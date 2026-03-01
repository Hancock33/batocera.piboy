################################################################################
#
# liblgpio
#
################################################################################
# Version: Commits on Feb 24, 2026
LIBLGPIO_VERSION = bcccd782eceedc5b278b3056ea81d5fbbb89c489
LIBLGPIO_SITE = $(call github,joan2937,lg,$(LIBLGPIO_VERSION))
LIBLGPIO_INSTALL_STAGING = YES

define LIBLGPIO_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
	CFLAGS="$(TARGET_CFLAGS) -std=gnu17" \
	CROSS_PREFIX="$(TARGET_CROSS)" \
	$(MAKE) CC="$(TARGET_CC)" STRIP="$(TARGET_STRIP)" -C $(@D) -f Makefile lib
endef

define LIBLGPIO_INSTALL_STAGING_CMDS
	cp -av $(@D)/lib*gpio.so* $(STAGING_DIR)/usr/lib/
endef

define LIBLGPIO_INSTALL_TARGET_CMDS
	cp -av $(@D)/lib*gpio.so* $(TARGET_DIR)/usr/lib/
endef

$(eval $(generic-package))
