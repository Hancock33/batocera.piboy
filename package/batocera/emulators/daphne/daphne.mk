################################################################################
#
# hypseus-singe - aka # daphne
#
################################################################################
# Version: Commits on Jan 25, 2023
DAPHNE_VERSION = 68e54c8eb91f2098416634087c567338e4ed09a1
DAPHNE_SITE = https://github.com/DirtBagXon/hypseus-singe
DAPHNE_SITE_METHOD=git
DAPHNE_LICENSE = GPLv3
DAPHNE_DEPENDENCIES = sdl2 sdl2_image sdl2_ttf zlib libogg libvorbis libmpeg2

DAPHNE_SUBDIR = build
DAPHNE_CONF_OPTS = ../src -DBUILD_SHARED_LIBS=OFF

define DAPHNE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/build/hypseus $(TARGET_DIR)/usr/bin/
		mkdir -p $(TARGET_DIR)/usr/share/daphne

	# copy support files
	cp -pr $(@D)/pics $(TARGET_DIR)/usr/share/daphne
	cp -pr $(@D)/fonts $(TARGET_DIR)/usr/share/daphne
	cp -pr $(@D)/sound $(TARGET_DIR)/usr/share/daphne
	cp -pf $(@D)/doc/*.ini $(TARGET_DIR)/usr/share/daphne

	#evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -prn $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/daphne/daphne.daphne.keys \
	    $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
