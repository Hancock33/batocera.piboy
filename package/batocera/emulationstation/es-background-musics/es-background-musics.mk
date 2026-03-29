################################################################################
#
# es-background-musics
#
################################################################################

ES_BACKGROUND_MUSICS_VERSION = 2.0
ES_BACKGROUND_MUSICS_LICENSE = See license.md, they are free to use with Batocera
ES_BACKGROUND_MUSICS_SOURCE=

define ES_BACKGROUND_MUSICS_INSTALL_TARGET_CMDS
	rm -rf   $(TARGET_DIR)/usr/share/batocera/music
	mkdir -p $(TARGET_DIR)/usr/share/batocera/music
	#cp -R $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulationstation/es-background-musics/music/* $(TARGET_DIR)/usr/share/batocera/music/
	cd $(TARGET_DIR)/usr/share/freedroid/sound && \
	for f in *.mod; do \
		ln -srfv -- $(TARGET_DIR)/usr/share/freedroid/sound/"$$(readlink "$$f")"/"$$f" $(TARGET_DIR)/usr/share/batocera/music/"$$f"; \
	done
endef

$(eval $(generic-package))
