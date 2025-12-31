################################################################################
#
# libzedmd
#
################################################################################
# Version: Commits on Dec 31, 2025
LIBZEDMD_VERSION = v0.10.0
LIBZEDMD_SITE = $(call github,PPUC,libzedmd,$(LIBZEDMD_VERSION))
LIBZEDMD_LICENSE = GPLv3
LIBZEDMD_LICENSE_FILES = LICENSE
LIBZEDMD_DEPENDENCIES = libframeutil libserialport sockpp
LIBZEDMD_SUPPORTS_IN_SOURCE_BUILD = NO
LIBZEDMD_INSTALL_STAGING = YES

LIBZEDMD_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

define LIBZEDMD_KOMIHASH
	cp -a $(@D)/third-party/include/komihash $(STAGING_DIR)/usr/include
endef

LIBZEDMD_POST_INSTALL_TARGET_HOOKS += LIBZEDMD_KOMIHASH

$(eval $(cmake-package))
