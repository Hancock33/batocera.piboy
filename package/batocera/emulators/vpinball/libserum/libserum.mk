################################################################################
#
# libserum
#
################################################################################
# Version: Commits on Jan 22, 2024
LIBSERUM_VERSION = 400787b03936487c6960e1b87a41637e31c74c2d
LIBSERUM_SITE = $(call github,zesinger,libserum,$(LIBSERUM_VERSION))
LIBSERUM_LICENSE = GPLv2+
LIBSERUM_LICENSE_FILES = LICENSE.md
LIBSERUM_DEPENDENCIES =
LIBSERUM_SUPPORTS_IN_SOURCE_BUILD = NO

LIBSERUM_CONF_OPTS += -DPLATFORM=linux
LIBSERUM_CONF_OPTS += -DPOST_BUILD_COPY_EXT_LIBS=OFF

# handle supported target platforms
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3588),y)
	LIBSERUM_CONF_OPTS += -DARCH=aarch64
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711)$(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
	LIBSERUM_CONF_OPTS += -DARCH=aarch64
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
	LIBSERUM_CONF_OPTS += -DARCH=x64
endif

# Install to staging to build Visual Pinball Standalone
LIBSERUM_INSTALL_STAGING = YES

$(eval $(cmake-package))