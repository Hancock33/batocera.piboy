################################################################################
#
# batocera-retroachievements-sounds
#
################################################################################

define BATOCERA_RETROACHIEVEMENTS_SOUNDS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/libretro/assets/sounds \
		$(BATOCERA_RETROACHIEVEMENTS_SOUNDS_PKGDIR)/sounds/*.ogg
endef

$(eval $(generic-package))
