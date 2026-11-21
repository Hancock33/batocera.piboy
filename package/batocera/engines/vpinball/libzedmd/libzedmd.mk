################################################################################
#
# libzedmd
#
################################################################################
# Version: Commits on Jun 01, 2026
LIBZEDMD_VERSION = v0.11.0
LIBZEDMD_SITE = $(call github,PPUC,libzedmd,$(LIBZEDMD_VERSION))
LIBZEDMD_LICENSE = GPLv3
LIBZEDMD_LICENSE_FILES = LICENSE
LIBZEDMD_DEPENDENCIES = cargs libframeutil libserialport sockpp
LIBZEDMD_SUPPORTS_IN_SOURCE_BUILD = NO
LIBZEDMD_INSTALL_STAGING = YES

LIBZEDMD_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

ifeq ($(BR2_aarch64),y)
LIBZEDMD_DEPENDENCIES += host-pkgconf libgpiod2
endif

define LIBZEDMD_INSTALL_TOOLS
	$(INSTALL) -D -m 0755 $(LIBZEDMD_BUILDDIR)/zedmd-client $(TARGET_DIR)/usr/bin/zedmd-client
	$(INSTALL) -D -m 0755 $(LIBZEDMD_BUILDDIR)/zedmd-test $(TARGET_DIR)/usr/bin/zedmd-test
endef
LIBZEDMD_POST_INSTALL_TARGET_HOOKS += LIBZEDMD_INSTALL_TOOLS

$(eval $(cmake-package))
