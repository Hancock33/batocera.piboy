#! /bin/bash
# A little script I whipped up to make it easy to
# patch source trees and have sane error handling
# -Erik
#
# (c) 2002 Erik Andersen <andersen@codepoet.org>

# Set directories from arguments, or use defaults.
builddir=${1-.}
patchdir=${2-../kernel-patches}
shift 2
patchpattern=${@-*}

if [ ! -d "${builddir}" ] ; then
    echo "Aborting.  '${builddir}' is not a directory."
    exit 1
fi
if [ ! -d "${patchdir}" ] ; then
    echo "Aborting.  '${patchdir}' is not a directory."
    exit 1
fi

# Remove any rejects present BEFORE patching - Because if there are
# any, even if patches are well applied, at the end it will complain
# about rejects in builddir.
find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print0 | \
    xargs -0 -r rm -f

for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do 
    apply="patch -g0 -p1 -E -d"
    uncomp_parm=""
    if [ -d "${patchdir}/$i" ] ; then
	echo "${patchdir}/$i skipped"
    else case "$i" in
	*.gz)
	type="gzip"; uncomp="gunzip -dc"; ;; 
	*.bz)
	type="bzip"; uncomp="bunzip -dc"; ;; 
	*.bz2)
	type="bzip2"; uncomp="bunzip2 -dc"; ;; 
	*.zip)
	type="zip"; uncomp="unzip -d"; ;; 
	*.Z)
	type="compress"; uncomp="uncompress -c"; ;; 
	*.tgz)
	type="tar gzip"; uncomp="gunzip -dc"; apply="tar xvf - -C"; ;; 
	*.tar)
	type="tar"; uncomp="cat"; apply="tar xvf - -C"; ;; 
	*)
	type="plaintext"; uncomp="cat"; ;; 
    esac fi
    echo ""
    echo "Applying ${i} using ${type}: " 
	echo ${i} >> ${builddir}/.applied_patches_list
    ${uncomp} "${patchdir}/${i}" ${uncomp_parm} | ${apply} "${builddir}"
    if [ $? != 0 ] ; then
        echo "Patch failed!  Please fix $i!"
	exit 1
    fi
done

# Check for rejects...
if [ "`find $builddir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
    echo "Aborting.  Reject files found."
    exit 1
fi

# Remove backup files
find $builddir/ '(' -name '*.orig' -o -name '.*.orig' ')' -exec rm -f {} \;
