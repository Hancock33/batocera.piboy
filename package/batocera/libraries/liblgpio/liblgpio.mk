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
	CROSS_PREFIX="$(TARGET_CROSS)" \
	$(MAKE) CC="$(TARGET_CC)" STRIP="$(TARGET_STRIP)" -C $(@D) -f Makefile lib
endef

define LIBLGPIO_INSTALL_STAGING_CMDS
	cp -av $(@D)/liblgpio* $(STAGING_DIR)/usr/lib/
endef

define LIBLGPIO_INSTALL_TARGET_CMDS
	cp -av $(@D)/liblgpio* $(TARGET_DIR)/usr/lib/
endef

$(eval $(generic-package))
