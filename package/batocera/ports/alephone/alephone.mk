################################################################################
#
# alephone
#
################################################################################
# Version: Commits on Nov 14, 2026
ALEPHONE_VERSION = 7768e9aa16a652db44177ab7936ce7796d306dce
ALEPHONE_SITE = $(call github,Aleph-One-Marathon,alephone,$(ALEPHONE_VERSION))
ALEPHONE_EMULATOR_INFO = alephone.emulator.yml
ALEPHONE_DEPENDENCIES = asio boost sdl2 sdl2_image sdl2_ttf
ALEPHONE_LICENSE = GPL-3.0
ALEPHONE_AUTORECONF = YES
ALEPHONE_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
ALEPHONE_CONF_OPTS = --with-boost="$(STAGING_DIR)/usr"

$(eval $(autotools-package))
$(eval $(emulator-info-package))
