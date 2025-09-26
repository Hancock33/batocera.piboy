################################################################################
#
# libretro-mame
#
################################################################################
# Version: Commits on Sept 26, 2025
LIBRETRO_MAME_VERSION = mame0281
LIBRETRO_MAME_SITE = https://github.com/Hancock33/batocera-mame-builds/releases/download/$(LIBRETRO_MAME_VERSION)
LIBRETRO_MAME_LICENSE = MAME
LIBRETRO_MAME_SOURCE = libretro-mame-$(MAME_CROSS_ARCH)-$(subst mame,,$(LIBRETRO_MAME_VERSION)).tar.xz
LIBRETRO_MAME_DEPENDENCIES = alsa-lib retroarch

define LIBRETRO_MAME_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/lib/libretro/mame_libretro.so
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	tar -xf $(DL_DIR)/$(LIBRETRO_MAME_DL_SUBDIR)/$(LIBRETRO_MAME_SOURCE) -C $(TARGET_DIR)

	mkdir -p $(TARGET_DIR)/usr/share/lr-mame
	ln -sf /usr/bin/mame/hash $(TARGET_DIR)/usr/share/lr-mame/hash

	mkdir -p $(TARGET_DIR)/usr/share/mame
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/blank.fmtowns $(TARGET_DIR)/usr/share/mame/blank.fmtowns

	# Copy coin drop plugin
	mkdir -p $(TARGET_DIR)/usr/bin/mame/
	cp -R -u $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/coindrop $(TARGET_DIR)/usr/bin/mame/plugins
endef

$(eval $(generic-package))
