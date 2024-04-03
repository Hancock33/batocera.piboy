################################################################################
#
# libzedmd
#
################################################################################
# Version: Commits on Apr 03, 2024
LIBZEDMD_VERSION = cc62fff0765cddee4703e471d990e9bae3c0f94d
LIBZEDMD_SITE = $(call github,PPUC,libzedmd,$(LIBZEDMD_VERSION))
LIBZEDMD_LICENSE = GPLv3
LIBZEDMD_LICENSE_FILES = LICENSE
LIBZEDMD_DEPENDENCIES = libframeutil libserialport
LIBZEDMD_SUPPORTS_IN_SOURCE_BUILD = NO

LIBZEDMD_CONF_OPTS += -DPLATFORM=linux
LIBZEDMD_CONF_OPTS += -DPOST_BUILD_COPY_EXT_LIBS=OFF

# handle supported target platforms
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3588),y)
	LIBZEDMD_CONF_OPTS += -DARCH=aarch64
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711)$(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
	LIBZEDMD_CONF_OPTS += -DARCH=aarch64
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
	LIBZEDMD_CONF_OPTS += -DARCH=x64
endif

# Install to staging to build Visual Pinball Standalone
LIBDMDUTIL_INSTALL_STAGING = YES

$(eval $(cmake-package))
