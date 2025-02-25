################################################################################
#
# libfreeaptx
#
################################################################################
# Version: Commits on Feb 25, 2025
LIBFREEAPTX_VERSION = dae97a4df4181fae364bf7ae2a1ea6ecd76968a0
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
