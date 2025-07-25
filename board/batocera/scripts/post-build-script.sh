#!/bin/bash -e

# PWD = source dir
# BASE_DIR = build dir
# BUILD_DIR = base dir/build
# HOST_DIR = base dir/host
# BINARIES_DIR = images dir
# TARGET_DIR = target dir

BATOCERA_TARGET=$(grep -E "^BR2_PACKAGE_BATOCERA_TARGET_[A-Z_0-9]*=y$" "${BR2_CONFIG}" | sed -e s+'^BR2_PACKAGE_BATOCERA_TARGET_\([A-Z_0-9]*\)=y$'+'\1'+)

# For the root user:
# 1. Use Bash instead of Dash for interactive use.
# 2. Set home directory to /userdata/system instead of /root.
sed -i "s|^root:x:.*$|root:x:0:0:root:/userdata/system:/bin/bash|g" "${TARGET_DIR}/etc/passwd" || exit 1

rm -rf "${TARGET_DIR}/etc/dropbear" || exit 1
ln -sf "/userdata/system/.ssh" "${TARGET_DIR}/etc/dropbear" || exit 1

mkdir -p ${TARGET_DIR}/etc/emulationstation || exit 1
ln -sf "/usr/share/emulationstation/es_systems.cfg" "${TARGET_DIR}/etc/emulationstation/es_systems.cfg" || exit 1
ln -sf "/usr/share/emulationstation/themes"         "${TARGET_DIR}/etc/emulationstation/themes"         || exit 1
mkdir -p "${TARGET_DIR}/usr/share/batocera/datainit/cheats" || exit 1
ln -sf "/userdata/cheats" "${TARGET_DIR}/usr/share/batocera/datainit/cheats/custom" || exit 1

# we don't want the kodi startup script
rm -f "${TARGET_DIR}/etc/init.d/S50kodi" || exit 1

# we have custom urandom scripts
rm -f "${TARGET_DIR}/etc/init.d/S20urandom" || exit 1

# we dont use cups / printing?
rm -f "${TARGET_DIR}/etc/init.d/S81cupsd" || exit 1
rm -frv ${TARGET_DIR}/usr/share/cups

#remove mono-api
rm -frv ${TARGET_DIR}/usr/lib/mono/lldb
rm -rf "${TARGET_DIR}/usr/lib/tbb" || exit 1
rm -rf "${TARGET_DIR}/usr/share/clc" || exit 1

# use /userdata/system/iptables.conf for S35iptables
rm -f "${TARGET_DIR}/etc/iptables.conf" || exit 1
ln -sf "/userdata/system/iptables.conf" "${TARGET_DIR}/etc/iptables.conf" || exit 1

# acpid requires /var/run, so, requires S03populate
if test -e "${TARGET_DIR}/etc/init.d/S02acpid"
then
    mv "${TARGET_DIR}/etc/init.d/S02acpid" "${TARGET_DIR}/etc/init.d/S05acpid" || exit 1
fi

#### remove unneeded firmware + drivers
#if (test -e "${TARGET_DIR}/etc/init.d/S19piboy") || (test "${BATOCERA_TARGET}" = "RPI4")
#then
#    rm -frv ${TARGET_DIR}/usr/lib/dri/{armada-drm_dri.so,exynos_dri.so,hdlcd_dri.so,hx8357d_dri.so,ili9225_dri.so,ili9341_dri.so,imx-*.so,ingenic-drm_dri.so}
#    rm -frv ${TARGET_DIR}/usr/lib/dri/{mali-dp_dri.so,mcde_dri.so,mediatek_dri.so,meson_dri.so,mi0283qt_dri.so,mxsfb-drm_dri.so,pl111_dri.so,repaper_dri.so,rockchip_dri.so}
#    rm -frv ${TARGET_DIR}/usr/lib/dri/{st7586_dri.so,st7735r_dri.so,stm_dri.so,sun4i-drm_dri.so}
#    rm -frv ${TARGET_DIR}/usr/lib/dri/{kirin_dri.so,komeda_dri.so,rcar-du_dri.so}
#    rm -frv ${TARGET_DIR}/usr/lib/dri/{gm12u320_dri.so,ili9163_dri.so,ili9486_dri.so,panel-mipi-dbi_dri.so,rzg2l-du_dri.so,ssd130x_dri.so,sti_dri.so,udl_dri.so,zynqmp-dpsub_dri.so}
#fi

find ${TARGET_DIR}/usr/share/locale -type f -not -name 'emulationstation2.mo' -delete || exit 1
find ${TARGET_DIR}/usr/share/locale -xtype l -delete || exit 1
find ${TARGET_DIR}/usr/share/locale -empty -type d -delete || exit 1

# remove buildlogs
find ${TARGET_DIR}/usr -type f -name ".applied_patches_list" -exec rm {} \;
find ${TARGET_DIR}/usr -type f -name ".files-list*.before" -exec rm {} \;
find ${TARGET_DIR}/usr -type f -name ".stamp_*" -exec rm {} \;

# remove static libraries
find ${TARGET_DIR}/usr -type f -name "*.a" -exec rm {} \;

# we don't want default xorg files
rm -f "${TARGET_DIR}/etc/X11/xorg.conf"  || exit 1
rm -f "${TARGET_DIR}/etc/init.d/S40xorg" || exit 1

# remove the S10triggerhappy
rm -f "${TARGET_DIR}/etc/init.d/S10triggerhappy" || exit 1

# remove the S40bluetoothd
rm -f "${TARGET_DIR}/etc/init.d/S40bluetoothd" || exit 1

# we want an empty boot directory (grub installation copy some files in the target boot directory)
rm -rf "${TARGET_DIR}/boot/grub" || exit 1

# reorder the boot scripts for the network boot
if test -e "${TARGET_DIR}/etc/init.d/S10udev"
then
    mv "${TARGET_DIR}/etc/init.d/S10udev"    "${TARGET_DIR}/etc/init.d/S05udev"    || exit 1 # move to make number spaces
fi
if test -e "${TARGET_DIR}/etc/init.d/S30dbus"
then
    mv "${TARGET_DIR}/etc/init.d/S30dbus"    "${TARGET_DIR}/etc/init.d/S01dbus"    || exit 1 # move really before for network (connman prerequisite) and pipewire
fi
if test -e "${TARGET_DIR}/etc/init.d/S40network"
then
    mv "${TARGET_DIR}/etc/init.d/S40network" "${TARGET_DIR}/etc/init.d/S07network" || exit 1 # move to make ifaces up sooner, mainly mountable/unmountable before/after share
fi
if test -e "${TARGET_DIR}/etc/init.d/S45connman"
then
    if test -e "${TARGET_DIR}/etc/init.d/S08connman"
    then
	rm -f "${TARGET_DIR}/etc/init.d/S45connman" || exit 1
    else
	mv "${TARGET_DIR}/etc/init.d/S45connman" "${TARGET_DIR}/etc/init.d/S08connman" || exit 1 # move to make before share
    fi
fi
if test -e "${TARGET_DIR}/etc/init.d/S21rngd"
then
    mv "${TARGET_DIR}/etc/init.d/S21rngd"    "${TARGET_DIR}/etc/init.d/S33rngd"    || exit 1 # move because it takes several seconds (on odroidgoa for example)
    sed -i "s/start-stop-daemon -S -q /start-stop-daemon -S -q -N 10 /g" "${TARGET_DIR}/etc/init.d/S33rngd"  || exit 1 # set rngd niceness to 10 (to decrease slowdown of other processes)
fi

# remove kodi default joystick configuration files
# while as a minimum, the file joystick.Sony.PLAYSTATION(R)3.Controller.xml makes references to PS4 controllers with axes which doesn't exist (making kodi crashing)
# i prefer to put it here than in packages/kodi while there are already a lot a lot of things
rm -rf "${TARGET_DIR}/usr/share/kodi/system/keymaps/joystick."*.xml || exit 1

# tmpfs or sysfs is mounted over theses directories
# clear these directories is required for the upgrade (otherwise, tar xf fails)
rm -rf "${TARGET_DIR}/"{var,run,sys,tmp} || exit 1
mkdir "${TARGET_DIR}/"{var,run,sys,tmp}  || exit 1

# make /etc/shadow a file generated from /boot/batocera-boot.conf for security
rm -f "${TARGET_DIR}/etc/shadow" || exit 1
touch "${TARGET_DIR}/run/batocera.shadow"
(cd "${TARGET_DIR}/etc" && ln -sf "../run/batocera.shadow" "shadow") || exit 1
# ln -sf "/run/batocera.shadow" "${TARGET_DIR}/etc/shadow" || exit 1

# fix pixbuf : Unable to load image-loading module: /lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-png.so
# this fix is to be removed once fixed. i've not found the exact source in buildroot. it prevents to display icons in filemanager and some others
if test "${BATOCERA_TARGET}" = "X86" -o "${BATOCERA_TARGET}" = X86_64
then
    ln -sf "/usr/lib/gdk-pixbuf-2.0" "${TARGET_DIR}/lib/gdk-pixbuf-2.0" || exit 1
fi

# timezone
# file generated from the output directory and compared to https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
# because i don't know how to list correctly them
(cd "${TARGET_DIR}/usr/share/zoneinfo" && find -L . -type f | grep -vE '/right/|/posix/|\.tab|Factory' | sed -e s+'^\./'++ | sort) > "${TARGET_DIR}/usr/share/batocera/tz"

# alsa lib
# on x86_64, pcsx2 has no sound because getgrnam_r returns successfully but the result parameter is not filled for an unknown reason (in alsa-lib)
AUDIOGROUP=$(grep -E "^audio:" "${TARGET_DIR}/etc/group" | cut -d : -f 3)
sed -i -e s+'defaults.pcm.ipc_gid .*$'+'defaults.pcm.ipc_gid '"${AUDIOGROUP}"+ "${TARGET_DIR}/usr/share/alsa/alsa.conf" || exit 1

# bios file
mkdir -p "${TARGET_DIR}/usr/share/batocera/datainit/bios" || exit 1
python "${BR2_EXTERNAL_BATOCERA_PATH}/package/batocera/core/batocera-scripts/scripts/batocera-systems" --createReadme > "${TARGET_DIR}/usr/share/batocera/datainit/bios/readme.txt" || exit 1

# enable serial console
SYSTEM_GETTY_PORT=$(grep "BR2_TARGET_GENERIC_GETTY_PORT" "${BR2_CONFIG}" | sed 's/.*\"\(.*\)\"/\1/')
if ! [[ -z "${SYSTEM_GETTY_PORT}" ]]; then
    SYSTEM_GETTY_BAUDRATE=$(grep -E "^BR2_TARGET_GENERIC_GETTY_BAUDRATE_[0-9]*=y$" "${BR2_CONFIG}" | sed -e s+'^BR2_TARGET_GENERIC_GETTY_BAUDRATE_\([0-9]*\)=y$'+'\1'+)
    sed -i -e '/# GENERIC_SERIAL$/s~^.*#~S0::respawn:/sbin/getty -n -L -l /usr/bin/batocera-autologin '${SYSTEM_GETTY_PORT}' '${SYSTEM_GETTY_BAUDRATE}' vt100 #~' \
        ${TARGET_DIR}/etc/inittab
fi

# miscellaneous stuff
rm -rf "${TARGET_DIR}/usr/bin/mame/docs" || exit 1
rm -rf "${TARGET_DIR}/usr/wine/wine-custom/share/man" || exit 1
rm -rf "${TARGET_DIR}/usr/wine/wine-proton/share/man" || exit 1
rm -rf "${TARGET_DIR}/usr/lib/python3.13/site-packages/numpy/doc" || exit 1
rm -rf "${TARGET_DIR}/usr/share/ledspicer/doc" || exit 1
rm -rf "${TARGET_DIR}/usr/share/lirc/python-pkg/lirc/doc" || exit 1
rm -rf "${TARGET_DIR}/usr/share/qt6/doc" || exit 1
rm -rf "${TARGET_DIR}/usr/bin/mame/docs" || exit 1
rm -rf "${TARGET_DIR}/usr/bin/pcsx2/resources/docs" || exit 1
rm -rf "${TARGET_DIR}/usr/share/batocera/shaders/bezel/Mega_Bezel/resource/docs" || exit 1
rm -rf "${TARGET_DIR}/usr/share/batocera/shaders/docs" || exit 1
rm -rf "${TARGET_DIR}/usr/bin/mame/ini/examples" || exit 1
rm -rf "${TARGET_DIR}/usr/libexec/lzo/examples" || exit 1
rm -rf "${TARGET_DIR}/usr/lib/python3.13/site-packages/numpy/_core/tests/examples" || exit 1
rm -rf "${TARGET_DIR}/usr/share/mc/examples" || exit 1
rm -rf "${TARGET_DIR}/usr/share/examples" || exit 1
rm -rf "${TARGET_DIR}/usr/share/vpl" || exit 1
find ${TARGET_DIR} -type f -name "CHANGELOG*" -exec rm {} \; || exit 1
find ${TARGET_DIR} -type f -name "changelog.txt" -exec rm {} \; || exit 1
find ${TARGET_DIR} -type f -name "README*" -exec rm {} \; || exit 1
sudo find ${TARGET_DIR} -type f -name "LICENSE*" -exec rm {} \; || exit 1
sudo find ${TARGET_DIR} -type f -name "license*" -exec rm {} \; || exit 1

# With PARALLEL_BUILD it is difficult to control which of two
# conflicting files from different packages will be the one ending up
# in the final image.  We take any files written to a special
# directory ${BINARIES_DIR}/batocera-target/ and overwrite those
# in the main target tree.

if [ -d "${BINARIES_DIR}/batocera-target" ]; then
    cp -pr "${BINARIES_DIR}/batocera-target/./" "${TARGET_DIR}/./"
fi
