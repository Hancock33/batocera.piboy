################################################################################
#
# alephone
#
################################################################################
# Version: Commits on Oct 11, 2026
ALEPHONE_VERSION = 97c73d8f2892c542283ac79940cf732bb077624d
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
