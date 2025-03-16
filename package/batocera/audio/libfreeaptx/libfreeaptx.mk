################################################################################
#
# libfreeaptx
#
################################################################################
# Version: Commits on Mar 05, 2025
LIBFREEAPTX_VERSION = 6dee419f934ec781e531f885f7e8e740752e67d1
LIBFREEAPTX_SITE =  $(call github,regularhunter,libfreeaptx,$(LIBFREEAPTX_VERSION))
LIBFREEAPTX_LICENSE = GPLv2.1
LIBFREEAPTX_INSTALL_STAGING = YES

define LIBFREEAPTX_INSTALL_STAGING_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" PREFIX="$(STAGING_DIR)/usr" -C $(@D) install
endef

define LIBFREEAPTX_INSTALL_TARGET_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
endef

$(eval $(generic-package))
