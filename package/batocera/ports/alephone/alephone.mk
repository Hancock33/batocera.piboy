################################################################################
#
# alephone
#
################################################################################
# Version: Commits on May 02, 2026
ALEPHONE_VERSION = a8be9df57be4eba987260decee3555afaef6fe40
ALEPHONE_SITE = $(call github,Aleph-One-Marathon,alephone,$(ALEPHONE_VERSION))
ALEPHONE_EMULATOR_INFO = alephone.emulator.yml
ALEPHONE_DEPENDENCIES = boost sdl2 sdl2_image sdl2_ttf
ALEPHONE_LICENSE = GPLv3
ALEPHONE_AUTORECONF = YES
ALEPHONE_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
ALEPHONE_CONF_OPTS = --with-boost="$(STAGING_DIR)/usr"

define ALEPHONE_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
endef

$(eval $(autotools-package))
$(eval $(emulator-info-package))
