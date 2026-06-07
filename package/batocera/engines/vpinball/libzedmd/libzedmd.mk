################################################################################
#
# libzedmd
#
################################################################################
# Version: Commits on Jun 07, 2026
LIBZEDMD_VERSION = f94d80d7d151532e3a26998c5c6b37fe57ccceff
LIBZEDMD_SITE = $(call github,PPUC,libzedmd,$(LIBZEDMD_VERSION))
LIBZEDMD_LICENSE = GPLv3
LIBZEDMD_LICENSE_FILES = LICENSE
LIBZEDMD_DEPENDENCIES = cargs libframeutil libserialport sockpp
LIBZEDMD_SUPPORTS_IN_SOURCE_BUILD = NO
LIBZEDMD_INSTALL_STAGING = YES

LIBZEDMD_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

define LIBZEDMD_POST_PROCESS
	mkdir -p $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 755 $(@D)/buildroot-build/zedmd-client $(TARGET_DIR)/usr/bin/zedmd-client
endef

LIBZEDMD_POST_INSTALL_TARGET_HOOKS += LIBZEDMD_POST_PROCESS

$(eval $(cmake-package))
