################################################################################
#
# libzedmd
#
################################################################################
# Version: Commits on May 08, 2026
LIBZEDMD_VERSION = 24044222a83ffed33f93d9f0a0baa68fe9fa5a47
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
