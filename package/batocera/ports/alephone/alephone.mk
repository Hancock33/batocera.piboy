################################################################################
#
# alephone
#
################################################################################
# Version: Commits on Oct 27, 2026
ALEPHONE_VERSION = 98455b3d4f50dded65f1346829a02ef3f4f2a09e
ALEPHONE_SITE = $(call github,Aleph-One-Marathon,alephone,$(ALEPHONE_VERSION))
ALEPHONE_EMULATOR_INFO = alephone.emulator.yml
ALEPHONE_DEPENDENCIES = asio boost sdl2 sdl2_image sdl2_ttf
ALEPHONE_LICENSE = GPLv3
ALEPHONE_AUTORECONF = YES
ALEPHONE_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
ALEPHONE_CONF_OPTS = --with-boost="$(STAGING_DIR)/usr"

define ALEPHONE_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
endef

$(eval $(autotools-package))
$(eval $(emulator-info-package))
