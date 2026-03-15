################################################################################
#
# freedroid
#
################################################################################
# Version: Commits on Feb 21, 2026
FREEDROID_VERSION = efd34bebb8024698742ab2685a8941e480c23ee0
FREEDROID_SITE = $(call github,ReinhardPrix,FreedroidClassic,$(FREEDROID_VERSION))
FREEDROID_EMULATOR_INFO = freedroid.emulator.yml
FREEDROID_DEPENDENCIES = sdl12-compat sdl_mixer sdl_image sdl_gfx jpeg
FREEDROID_LICENSE = GPL-2.0

FREEDROID_SUPPORTS_IN_SOURCE_BUILD = NO
FREEDROID_CONF_OPTS +=  --with-sdl-prefix="$(STAGING_DIR)/usr"
FREEDROID_AUTORECONF = YES

define FREEDROID_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=/usr STRIP=/bin/true DESTDIR=$(TARGET_DIR) install
	# install es media
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/freedroid
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/freedroid/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/freedroid/
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/freedroid/freedroid.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(autotools-package))
$(eval $(emulator-info-package))
