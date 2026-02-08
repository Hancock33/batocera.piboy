################################################################################
#
# libretro-mame
#
################################################################################
# Version: Commits on Jan 30, 2026
LIBRETRO_MAME_VERSION = mame0285
LIBRETRO_MAME_SITE = https://github.com/Hancock33/batocera-mame-builds/releases/download/$(LIBRETRO_MAME_VERSION)
LIBRETRO_MAME_LICENSE = MAME
LIBRETRO_MAME_SOURCE = libretro-mame-$(MAME_CROSS_ARCH)-$(subst mame,,$(LIBRETRO_MAME_VERSION)).tar.xz
LIBRETRO_MAME_DEPENDENCIES = alsa-lib retroarch
$(eval $(call register,mame.libretro.core.yml))
$(eval $(call register-if-kconfig,BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY,sega-arcade.mame.libretro.core.yml))

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
$(eval $(emulator-info-package))
