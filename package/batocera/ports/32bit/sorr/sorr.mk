################################################################################
#
# sorr
#
################################################################################
# Version: Commits on Oct 07, 2021 (branch@switch)
SORR_VERSION = 0290c3719fd74121ff9c9e690c955285e4ba391c
SORR_SITE = $(call github,Cpasjuste,bennugd-monolithic,$(SORR_VERSION))

SORR_DEPENDENCIES = sdl2 sdl2_mixer libogg libvorbis libtheora
SORR_LICENSE = GPL-2.0
SORR_SUPPORTS_IN_SOURCE_BUILD = NO

SORR_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
SORR_CONF_OPTS += -DCMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/toolchainfile.cmake
SORR_CONF_OPTS += -DCMAKE_VERBOSE_MAKEFILE=ON

define SORR_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/buildroot-build/sorr $(TARGET_DIR)/usr/bin
endef

$(eval $(cmake-package))
