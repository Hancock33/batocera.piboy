################################################################################
#
# zxing
#
################################################################################

ZXING_VERSION = 2.3.0
ZXING_SITE = http://zxing.googlecode.com/files
ZXING_SOURCE = ZXing-$(ZXING_VERSION).zip
ZXING_LICENSE = Apache-2.0
ZXING_LICENSE_FILES = COPYING
ZXING_INSTALL_STAGING = YES

ifneq ($(BR2_ENABLE_LOCALE),y)
ZXING_DEPENDENCIES += libiconv
endif

define ZXING_EXTRACT_CMDS
	unzip -d $(BUILD_DIR) $(DL_DIR)/$(ZXING_SOURCE)
endef

define ZXING_BUILD_CMDS
	$(MAKE) -C $(@D)/cpp/core/src $(TARGET_CONFIGURE_OPTS)
endef

define ZXING_INSTALL_STAGING_CMDS
	$(MAKE) -C $(@D)/cpp/core/src DESTDIR=$(STAGING_DIR) install
endef

define ZXING_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D)/cpp/core/src DESTDIR=$(TARGET_DIR) install
endef

$(eval $(generic-package))
