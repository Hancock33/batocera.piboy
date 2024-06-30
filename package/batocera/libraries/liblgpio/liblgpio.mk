################################################################################
#
# liblgpio
#
################################################################################
# Version: Commits on Mar 28, 2024
LIBLGPIO_VERSION = 746f0df43774175090b93abcc860b6733eefc09b
LIBLGPIO_SITE = $(call github,joan2937,lg,$(LIBLGPIO_VERSION))
LIBLGPIO_INSTALL_STAGING = YES

define LIBLGPIO_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
	CFLAGS="$(TARGET_CFLAGS) -fPIC" \
	CXXFLAGS="$(TARGET_CXXFLAGS) -fPIC" \
	CROSS_PREFIX="$(TARGET_CROSS)" \
	$(MAKE) CC="$(TARGET_CC)" STRIP="$(TARGET_STRIP)" -C $(@D)/lg -f Makefile
endef

define LIBLGPIO_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0644 $(@D)/lg/liblgpio* $(STAGING_DIR)/usr/lib/
	$(INSTALL) -D -m 0644 $(@D)/lg/librgpio* $(STAGING_DIR)/usr/lib/
endef

define LIBLGPIO_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(@D)/lg/liblgpio* $(TARGET_DIR)/usr/lib/
	$(INSTALL) -D -m 0644 $(@D)/lg/librgpio* $(TARGET_DIR)/usr/lib/
endef

$(eval $(generic-package))
