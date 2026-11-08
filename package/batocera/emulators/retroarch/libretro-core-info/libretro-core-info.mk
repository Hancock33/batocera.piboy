################################################################################
#
# libretro-core-info
#
################################################################################
# Version: Commits on Nov 07, 2026
LIBRETRO_CORE_INFO_VERSION = 9edb6adf917c943dafd83693a7a7f5d2c273c02c
LIBRETRO_CORE_INFO_SITE = $(call github,libretro,libretro-super,$(LIBRETRO_CORE_INFO_VERSION))
LIBRETRO_CORE_INFO_LICENSE = MIT

define LIBRETRO_CORE_INFO_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	mv $(@D)/dist/info/bsnes_hd_beta_libretro.info		$(TARGET_DIR)/usr/share/libretro/info/bsnes_hd_libretro.info
	mv $(@D)/dist/info/ep128emu_core_libretro.info		$(TARGET_DIR)/usr/share/libretro/info/ep128emu_libretro.info
	cp $(@D)/dist/info/genesis_plus_gx_libretro.info	$(TARGET_DIR)/usr/share/libretro/info/genesisplusgx-expanded_libretro.info
	mv $(@D)/dist/info/genesis_plus_gx_libretro.info	$(TARGET_DIR)/usr/share/libretro/info/genesisplusgx_libretro.info
	mv $(@D)/dist/info/genesis_plus_gx_wide_libretro.info $(TARGET_DIR)/usr/share/libretro/info/genesisplusgx-wide_libretro.info
	cp $(@D)/dist/info/mamemess_libretro.info			$(TARGET_DIR)/usr/share/libretro/info/mess_libretro.info
	cp $(@D)/dist/info/mame_libretro.info				$(TARGET_DIR)/usr/share/libretro/info/mamevirtual_libretro.info
	cp $(@D)/dist/info/mame2000_libretro.info			$(TARGET_DIR)/usr/share/libretro/info/imame4all_libretro.info
	mv $(@D)/dist/info/mame2003_plus_libretro.info		$(TARGET_DIR)/usr/share/libretro/info/mame078plus_libretro.info
	mv $(@D)/dist/info/mame2010_libretro.info			$(TARGET_DIR)/usr/share/libretro/info/mame0139_libretro.info
	mv $(@D)/dist/info/mednafen_pce_fast_libretro.info	$(TARGET_DIR)/usr/share/libretro/info/pce_fast_libretro.info
	mv $(@D)/dist/info/mednafen_pce_libretro.info		$(TARGET_DIR)/usr/share/libretro/info/pce_libretro.info
	mv $(@D)/dist/info/mednafen_pcfx_libretro.info		$(TARGET_DIR)/usr/share/libretro/info/pcfx_libretro.info
	mv $(@D)/dist/info/mednafen_saturn_libretro.info	$(TARGET_DIR)/usr/share/libretro/info/beetle-saturn_libretro.info
	mv $(@D)/dist/info/mednafen_supafaust_libretro.info	$(TARGET_DIR)/usr/share/libretro/info/supafaust_libretro.info
	mv $(@D)/dist/info/mednafen_vb_libretro.info		$(TARGET_DIR)/usr/share/libretro/info/vb_libretro.info
	mv $(@D)/dist/info/mupen64plus_next_libretro.info	$(TARGET_DIR)/usr/share/libretro/info/mupen64plus-next_libretro.info
	cp $(@D)/dist/info/snes9x2010_libretro.info			$(TARGET_DIR)/usr/share/libretro/info/pocketsnes_libretro.info
	mv $(@D)/dist/info/snes9x2010_libretro.info			$(TARGET_DIR)/usr/share/libretro/info/snes9x_next_libretro.info
	mv $(@D)/dist/info/vbam_libretro.info				$(TARGET_DIR)/usr/share/libretro/info/vba-m_libretro.info
	cp -r $(@D)/dist/info/*.info						$(TARGET_DIR)/usr/share/libretro/info

	# superflappybirds_libretro.so => no info found
	touch $(TARGET_DIR)/usr/share/libretro/info/superflappybirds_libretro.info
endef

$(eval $(generic-package))
