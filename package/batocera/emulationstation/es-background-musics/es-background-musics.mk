################################################################################
#
# es-background-musics
#
################################################################################

ES_BACKGROUND_MUSICS_VERSION = 2.0
ES_BACKGROUND_MUSICS_LICENSE = See license.md, they are free to use with Batocera
ES_BACKGROUND_MUSICS_SOURCE =
ES_BACKGROUND_MUSICS_DEPENDENCIES = freedroid

define ES_BACKGROUND_MUSICS_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/share/batocera/music
	mkdir -p $(TARGET_DIR)/usr/share/batocera/music
	#cp -R $(ES_BACKGROUND_MUSICS_PKGDIR)/music/* $(TARGET_DIR)/usr/share/batocera/music/
	cd $(TARGET_DIR)/usr/share/freedroid/sound && \
	for f in *.mod; do \
		ln -srf -- $(TARGET_DIR)/usr/share/freedroid/sound/"$$(readlink "$$f")"/"$$f" $(TARGET_DIR)/usr/share/batocera/music/"$$f"; \
	done
endef

$(eval $(generic-package))
