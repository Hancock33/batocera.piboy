################################################################################
#
# freedroid
#
################################################################################
# Version: Commits on Mar 22, 2026
FREEDROID_VERSION = 59f0aa53fc81ac320377d814d5d6f6f602065fb0
FREEDROID_SITE = $(call github,ReinhardPrix,FreedroidClassic,$(FREEDROID_VERSION))
FREEDROID_EMULATOR_INFO = freedroid.emulator.yml
FREEDROID_DEPENDENCIES = sdl2 sdl2_image
FREEDROID_LICENSE = GPL-2.0
FREEDROID_AUTORECONF = YES
FREEDROID_SUPPORTS_IN_SOURCE_BUILD = NO

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
