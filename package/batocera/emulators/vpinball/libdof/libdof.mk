################################################################################
#
# libdof
#
################################################################################
# Version: Commits on Mar 23, 2024
LIBDOF_VERSION = 92890aac83c03d76ed261424c274e17a9d54f6eb
LIBDOF_SITE = $(call github,jsm174,libdof,$(LIBDOF_VERSION))
LIBDOF_LICENSE = BSD-3-Clause
LIBDOF_LICENSE_FILES = LICENSE
LIBDOF_DEPENDENCIES = libserialport sockpp cargs
LIBDOF_SUPPORTS_IN_SOURCE_BUILD = NO

LIBDOF_CONF_OPTS += -DPLATFORM=linux
LIBDOF_CONF_OPTS += -DPOST_BUILD_COPY_EXT_LIBS=OFF

# handle supported target platforms
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3588),y)
	LIBDOF_CONF_OPTS += -DARCH=aarch64
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711)$(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
	LIBDOF_CONF_OPTS += -DARCH=aarch64
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
	LIBDOF_CONF_OPTS += -DARCH=x64
endif

# Install to staging to build Visual Pinball Standalone
LIBDOF_INSTALL_STAGING = YES

$(eval $(cmake-package))
