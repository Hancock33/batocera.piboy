################################################################################
#
# libfreeaptx
#
################################################################################
# Version: Commits on Mar 05, 2025
LIBFREEAPTX_VERSION = 0.2.2
LIBFREEAPTX_SITE = $(call github,regularhunter,libfreeaptx,$(LIBFREEAPTX_VERSION))
LIBFREEAPTX_LICENSE = LGPL-2.1+
LIBFREEAPTX_LICENSE_FILES = COPYING
LIBFREEAPTX_INSTALL_STAGING = YES

define LIBFREEAPTX_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr -C $(@D)
endef

define LIBFREEAPTX_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr DESTDIR=$(STAGING_DIR) -C $(@D) install
endef

define LIBFREEAPTX_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
endef

$(eval $(generic-package))
