################################################################################
#
# alephone
#
################################################################################
# Version: Commits on Sept 21, 2026
ALEPHONE_VERSION = 6497ea3b6906ee7e2d7b7206b5c760a4039877db
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
