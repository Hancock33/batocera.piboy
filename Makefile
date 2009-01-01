# Makefile for buildroot2
#
# Copyright (C) 1999-2005 by Erik Andersen <andersen@codepoet.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
#

#--------------------------------------------------------------
# Just run 'make menuconfig', configure stuff, then run 'make'.
# You shouldn't need to mess with anything beyond this point...
#--------------------------------------------------------------
TOPDIR=./
CONFIG_CONFIG_IN=Config.in
CONFIG_DEFCONFIG=.defconfig
CONFIG=package/config
DATE:=$(shell date +%Y%m%d)

noconfig_targets:=menuconfig config oldconfig randconfig \
	defconfig allyesconfig allnoconfig release tags \
	source-check help


# Use shell variables, if defined
ifneq ($(BUILDROOT_LOCAL),)
BR2_LOCAL:=$(BUILDROOT_LOCAL)
else
BR2_LOCAL:=$(TOPDIR)/local
endif

# $(shell find . -name *_defconfig |sed 's/.*\///')
# Pull in the user's configuration file
ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
ifeq ($(BOARD),)
# if "make BOARD=xyz" command
-include .config
else
# if "make" command
-include $(BR2_LOCAL)/$(BOARD)/$(BOARD).config
endif
endif

# Override BR2_DL_DIR if shell variable defined
ifneq ($(BUILDROOT_DL_DIR),)
BR2_DL_DIR:=$(BUILDROOT_DL_DIR)
endif
LOCAL:=$(BR2_LOCAL)

# To put more focus on warnings, be less verbose as default
# Use 'make V=1' to see the full commands
ifdef V
  ifeq ("$(origin V)", "command line")
    KBUILD_VERBOSE=$(V)
  endif
endif
ifndef KBUILD_VERBOSE
  KBUILD_VERBOSE=0
endif

ifeq ($(KBUILD_VERBOSE),1)
  quiet=
  Q=
ifndef VERBOSE
  VERBOSE=1
endif
else
  quiet=quiet_
  Q=@
endif

# we want bash as shell
SHELL:=$(shell if [ -x "$$BASH" ]; then echo $$BASH; \
	else if [ -x /bin/bash ]; then echo /bin/bash; \
	else echo sh; fi; fi)

# kconfig uses CONFIG_SHELL
CONFIG_SHELL:=$(SHELL)

export SHELL CONFIG_SHELL quiet Q KBUILD_VERBOSE VERBOSE

ifndef HOSTAR
HOSTAR:=ar
endif
ifndef HOSTAS
HOSTAS:=as
endif
ifndef HOSTCC
HOSTCC:=gcc
else
endif
ifndef HOSTCXX
HOSTCXX:=g++
endif
ifndef HOSTFC
HOSTFC:=gfortran
endif
ifndef HOSTCPP
HOSTCPP:=cpp
endif
ifndef HOSTLD
HOSTLD:=ld
endif
ifndef HOSTLN
HOSTLN:=ln
endif
ifndef HOSTNM
HOSTNM:=nm
endif
HOSTAR:=$(shell which $(HOSTAR) || type -p $(HOSTAR) || echo ar)
HOSTAS:=$(shell which $(HOSTAS) || type -p $(HOSTAS) || echo as)
HOSTCC:=$(shell which $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
HOSTCXX:=$(shell which $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
HOSTFC:=$(shell which $(HOSTLD) || type -p $(HOSTLD) || echo || which g77 || type -p g77 || echo gfortran)
HOSTCPP:=$(shell which $(HOSTCPP) || type -p $(HOSTCPP) || echo cpp)
HOSTLD:=$(shell which $(HOSTLD) || type -p $(HOSTLD) || echo ld)
HOSTLN:=$(shell which $(HOSTLN) || type -p $(HOSTLN) || echo ln)
HOSTNM:=$(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)
HOST_GLIB_BIN:=`dirname $(shell which glib-genmarshal || echo /usr/bin/glib-genmarshal)`
HOST_GLIB:=$(shell dirname $(HOST_GLIB_BIN) || echo /usr)


ifndef CFLAGS_FOR_BUILD
CFLAGS_FOR_BUILD:=-g -O2
endif
ifndef CXXFLAGS_FOR_BUILD
CXXFLAGS_FOR_BUILD:=-g -O2
endif
ifndef FCFLAGS_FOR_BUILD
FCFLAGS_FOR_BUILD:=-g -O2
endif
export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTFC HOSTLD


ifeq ($(BR2_HAVE_DOT_CONFIG),y)

# cc-option
# Usage: cflags-y+=$(call cc-option, -march=winchip-c6, -march=i586)
# sets -march=winchip-c6 if supported else falls back to -march=i586
# without checking the latter.
cc-option=$(shell if $(TARGET_CC) $(TARGET_CFLAGS) $(1) -S -o /dev/null -xc /dev/null \
	> /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)

#############################################################
#
# Hide troublesome environment variables from sub processes
#
#############################################################
unexport CROSS_COMPILE
unexport ARCH

#############################################################
#
# Setup the proper filename extensions for the host
#
##############################################################
ifneq ($(findstring linux,$(BR2_GNU_BUILD_SUFFIX)),)
HOST_EXEEXT:=
HOST_LIBEXT:=.a
HOST_SHREXT:=.so
endif
ifneq ($(findstring apple,$(BR2_GNU_BUILD_SUFFIX)),)
HOST_EXEEXT:=
HOST_LIBEXT:=.a
HOST_SHREXT:=.dylib
endif
ifneq ($(findstring cygwin,$(BR2_GNU_BUILD_SUFFIX)),)
HOST_EXEEXT:=.exe
HOST_LIBEXT:=.lib
HOST_SHREXT:=.dll
HOST_LOADLIBES="-lcurses -lintl"
export HOST_LOADLIBES
endif
ifneq ($(findstring mingw,$(BR2_GNU_BUILD_SUFFIX)),)
HOST_EXEEXT:=.exe
HOST_LIBEXT:=.lib
HOST_SHREXT:=.dll
endif

# The preferred type of libs we build for the target
ifeq ($(BR2_PREFER_STATIC_LIB),y)
LIBTGTEXT=.a
#PREFERRED_LIB_FLAGS:=--disable-shared --enable-static
else
LIBTGTEXT=.so
#PREFERRED_LIB_FLAGS:=--disable-static --enable-shared
endif
PREFERRED_LIB_FLAGS:=--enable-static --enable-shared

##############################################################
#
# The list of stuff to build for the target toolchain
# along with the packages to build for the target.
#
##############################################################
ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
BASE_TARGETS:=uclibc-configured binutils cross_compiler uclibc-target-utils kernel-headers
else
BASE_TARGETS:=uclibc
endif
TARGETS:=

# setup our pathes
include project/Makefile.in

BR2_DEPENDS_DIR=$(PROJECT_BUILD_DIR)/buildroot-config

include toolchain/Makefile.in
include package/Makefile.in

#############################################################
#
# You should probably leave this stuff alone unless you know
# what you are doing.
#
#############################################################

all: world

# In this section, we need .config
include .config.cmd

include project/*.mk

# We also need the various per-package makefiles, which also add
# each selected package to TARGETS if that package was selected
# in the .config file.
ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
# avoid pulling in external toolchain which is broken for toplvl parallel builds
# Explicit ordering:
include toolchain/dependencies/dependencies.mk
include toolchain/binutils/binutils.mk
include toolchain/ccache/ccache.mk
include toolchain/elf2flt/elf2flt.mk
include toolchain/gcc/gcc-uclibc-3.x.mk
include toolchain/gcc/gcc-uclibc-4.x.mk
include toolchain/gdb/gdb.mk
include toolchain/kernel-headers/kernel-headers.mk
include toolchain/mklibs/mklibs.mk
include toolchain/sstrip/sstrip.mk
include toolchain/uClibc/uclibc.mk
else
include toolchain/*/*.mk
endif

ifeq ($(BR2_PACKAGE_LINUX),y)
TARGETS+=linux26-modules
endif

include package/*/*.mk

TARGETS+=target-devfiles

# target stuff is last so it can override anything else
include target/Makefile.in

TARGETS+=erase-fakeroots

TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
TARGETS_ALL:=$(patsubst %,__real_tgt_%,$(TARGETS))
# all targets depend on the crosscompiler and it's prerequisites
$(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %

$(BR2_DEPENDS_DIR): .config
	rm -rf $@
	mkdir -p $(@D)
	cp -dpRf $(CONFIG)/buildroot-config $@

dirs: $(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
	$(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(PROJECT_BUILD_DIR) \
	$(PROJECT_BUILD_DIR)/autotools-stamps

$(BASE_TARGETS): dirs

world: dependencies dirs target-host-info $(BASE_TARGETS) $(TARGETS_ALL)


.PHONY: all world dirs clean dirclean distclean source \
	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
	$(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
	$(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(PROJECT_BUILD_DIR) \
	$(PROJECT_BUILD_DIR)/autotools-stamps

#############################################################
#
# staging and target directories do NOT list these as
# dependencies anywhere else
#
#############################################################
$(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(PROJECT_BUILD_DIR) \
	$(PROJECT_BUILD_DIR)/autotools-stamps $(BINARIES_DIR):
	@mkdir -p $@

$(STAGING_DIR):
	@mkdir -p $(STAGING_DIR)/bin
	@mkdir -p $(STAGING_DIR)/lib
ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
	@mkdir -p $(STAGING_DIR)/usr/lib
else
ifneq ($(BR2_TOOLCHAIN_EXTERNAL),y)
	@ln -snf . $(STAGING_DIR)/usr
	@mkdir -p $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)
	@ln -snf ../lib $(STAGING_DIR)/usr/lib
	@ln -snf ../lib $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
endif
endif
	@mkdir -p $(STAGING_DIR)/usr/include

$(PROJECT_BUILD_DIR)/.root:
	mkdir -p $(TARGET_DIR)
	if ! [ -d "$(TARGET_DIR)/bin" ]; then \
		if [ -d "$(TARGET_SKELETON)" ]; then \
			cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
		fi; \
		touch $(STAGING_DIR)/.fakeroot.00000; \
	fi
	-find $(TARGET_DIR) -type d -name CVS -o -name .svn | xargs rm -rf
	-find $(TARGET_DIR) -type f -name .empty | xargs rm -rf	
	touch $@

$(TARGET_DIR): $(PROJECT_BUILD_DIR)/.root

erase-fakeroots:
	rm -f $(PROJECT_BUILD_DIR)/.fakeroot*

target-devfiles:
ifeq ($(BR2_HAVE_DEVFILES),y)
	( scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )
else
	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/lib/pkgconfig
	find $(TARGET_DIR)/usr/lib -name '*.a' -delete
	find $(TARGET_DIR)/lib -name '*.a' -delete
	find $(TARGET_DIR)/usr/lib -name '*.la' -delete
	find $(TARGET_DIR)/lib -name '*.la' -delete
endif

source: $(TARGETS_SOURCE) $(HOST_SOURCE)

_source-check:
	$(MAKE) SPIDER=--spider source

external-deps:
	@$(MAKE) -Bs BR2_WGET=$(TOPDIR)/toolchain/wget-show-external-deps.sh \
		SPIDER=--spider source

#############################################################
#
# Cleanup and misc junk
#
#############################################################
clean: $(TARGETS_CLEAN)
	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(PROJECT_BUILD_DIR)/.root $(PROJECT_BUILD_DIR)/autotools-stamps

dirclean: $(TARGETS_DIRCLEAN)
	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(PROJECT_BUILD_DIR)/.root $(PROJECT_BUILD_DIR)/autotools-stamps

distclean:
ifeq ($(DL_DIR),$(BASE_DIR)/dl)
	rm -rf $(DL_DIR)
endif
	rm -rf $(BUILD_DIR) $(PROJECT_BUILD_DIR) $(BINARIES_DIR) \
	$(LINUX_KERNEL) $(BASE_DIR)/include \
		.config.cmd
	$(MAKE) -C $(CONFIG) clean

sourceball:
	rm -rf $(BUILD_DIR) $(PROJECT_BUILD_DIR) $(BINARIES_DIR)
	set -e; \
	cd ..; \
	rm -f buildroot.tar.bz2; \
	tar -cvf buildroot.tar buildroot; \
	bzip2 -9 buildroot.tar; \


else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)

all: menuconfig

# configuration
# ---------------------------------------------------------------------------

HOSTCFLAGS=$(CFLAGS_FOR_BUILD)
export HOSTCFLAGS

$(CONFIG)/conf:
	@mkdir -p $(CONFIG)/buildroot-config
	$(MAKE) CC="$(HOSTCC)" -C $(CONFIG) conf
	-@if [ ! -f .config ]; then \
		cp $(CONFIG_DEFCONFIG) .config; \
	fi
$(CONFIG)/mconf:
	@mkdir -p $(CONFIG)/buildroot-config
	$(MAKE) CC="$(HOSTCC)" -C $(CONFIG) conf mconf
	-@if [ ! -f .config ]; then \
		cp $(CONFIG_DEFCONFIG) .config; \
	fi

menuconfig: $(CONFIG)/mconf
	@mkdir -p $(CONFIG)/buildroot-config
	@if ! KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
		$(CONFIG)/mconf $(CONFIG_CONFIG_IN); then \
		test -f .config.cmd || rm -f .config; \
	fi

config: $(CONFIG)/conf
	@mkdir -p $(CONFIG)/buildroot-config
	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
		$(CONFIG)/conf $(CONFIG_CONFIG_IN)

oldconfig: $(CONFIG)/conf
	@mkdir -p $(CONFIG)/buildroot-config
	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
		$(CONFIG)/conf -o $(CONFIG_CONFIG_IN)

randconfig: $(CONFIG)/conf
	@mkdir -p $(CONFIG)/buildroot-config
	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
		$(CONFIG)/conf -r $(CONFIG_CONFIG_IN)

allyesconfig: $(CONFIG)/conf
	cat $(CONFIG_DEFCONFIG) > .config
	@mkdir -p $(CONFIG)/buildroot-config
	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
		$(CONFIG)/conf -y $(CONFIG_CONFIG_IN)
	#sed -i -e "s/^CONFIG_DEBUG.*/# CONFIG_DEBUG is not set/" .config

allnoconfig: $(CONFIG)/conf
	@mkdir -p $(CONFIG)/buildroot-config
	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
		$(CONFIG)/conf -n $(CONFIG_CONFIG_IN)

defconfig: $(CONFIG)/conf
	@mkdir -p $(CONFIG)/buildroot-config
	@KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
		$(CONFIG)/conf -d $(CONFIG_CONFIG_IN)

# check if download URLs are outdated
source-check: allyesconfig
	$(MAKE) _source-check

#############################################################
#
# Cleanup and misc junk
#
#############################################################
clean:
	rm -f .config .config.old .config.cmd .tmpconfig.h .lognr.*
	-$(MAKE) -C $(CONFIG) clean

distclean: clean
	rm -rf sources/*

endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)

%_defconfig: $(CONFIG)/conf
	cp $(shell find ./target/ -name $@) .config
	-@$(MAKE) oldconfig

update:
	cp .config $(BOARD_PATH)/$(BOARD_NAME)_defconfig

configured: dirs host-sed kernel-headers uclibc-config busybox-config linux26-config

prepatch:	gcc-patched binutils-patched gdb-patched uclibc-patched

.lognr.$(PROJECT):
	@echo "0" > .lognr.$(PROJECT)

log:	.lognr.$(PROJECT)
	@expr `cat .lognr.$(PROJECT)` + 1 > .lognr.$(PROJECT)	
	@echo Creating $(PROJECT)-`cat .lognr.$(PROJECT)`.log
	@$(MAKE) > $(PROJECT)-`cat .lognr.$(PROJECT)`.log 2>&1


cross: $(BASE_TARGETS)

help:
	@echo 'Cleaning:'
	@echo '  clean                  - delete temporary files created by build'
	@echo '  distclean              - delete all non-source files (including .config)'
	@echo
	@echo 'Build:'
	@echo '  all                    - make world'
	@echo
	@echo 'Configuration:'
	@echo '  menuconfig             - interactive curses-based configurator'
	@echo '  oldconfig              - resolve any unresolved symbols in .config'
	@echo
	@echo 'Miscellaneous:'
	@echo '  source                 - download all sources needed for offline-build'
	@echo '  source-check           - check all packages for valid download URLs'
	@echo '  external-deps          - list external packages used'
	@echo
	@echo 'See docs/README and docs/buildroot.html for further details'
	@echo

.PHONY: dummy subdirs release distclean clean config oldconfig \
	menuconfig tags check test depend defconfig help

