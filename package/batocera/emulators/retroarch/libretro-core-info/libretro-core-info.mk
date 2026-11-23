################################################################################
#
# libretro-core-info
#
################################################################################
# Version: Commits on Nov 23, 2026
LIBRETRO_CORE_INFO_VERSION = c3c55c2d5d16ecf7b447fcfc867acc363b0aa1d9
LIBRETRO_CORE_INFO_SITE = $(call github,libretro,libretro-super,$(LIBRETRO_CORE_INFO_VERSION))
LIBRETRO_CORE_INFO_LICENSE = MIT

LIBRETRO_CORE_INFO_TARGET = $(TARGET_DIR)/usr/share/libretro/info

define LIBRETRO_CORE_INFO_INSTALL_TARGET_CMDS
	mkdir -p $(LIBRETRO_CORE_INFO_TARGET)
	cp $(@D)/dist/info/*.info $(LIBRETRO_CORE_INFO_TARGET)
	# batocera core names
	mv $(LIBRETRO_CORE_INFO_TARGET)/bsnes_hd_beta_libretro.info $(LIBRETRO_CORE_INFO_TARGET)/bsnes_hd_libretro.info
	mv $(LIBRETRO_CORE_INFO_TARGET)/ep128emu_core_libretro.info $(LIBRETRO_CORE_INFO_TARGET)/ep128emu_libretro.info
	cp $(LIBRETRO_CORE_INFO_TARGET)/genesis_plus_gx_libretro.info $(LIBRETRO_CORE_INFO_TARGET)/genesisplusgx-expanded_libretro.info
	mv $(LIBRETRO_CORE_INFO_TARGET)/genesis_plus_gx_libretro.info $(LIBRETRO_CORE_INFO_TARGET)/genesisplusgx_libretro.info
	mv $(LIBRETRO_CORE_INFO_TARGET)/genesis_plus_gx_wide_libretro.info $(LIBRETRO_CORE_INFO_TARGET)/genesisplusgx-wide_libretro.info
	cp $(LIBRETRO_CORE_INFO_TARGET)/mamemess_libretro.info $(LIBRETRO_CORE_INFO_TARGET)/mess_libretro.info
	cp $(LIBRETRO_CORE_INFO_TARGET)/mame_libretro.info $(LIBRETRO_CORE_INFO_TARGET)/mamevirtual_libretro.info
	cp $(LIBRETRO_CORE_INFO_TARGET)/mame2000_libretro.info $(LIBRETRO_CORE_INFO_TARGET)/imame4all_libretro.info
	mv $(LIBRETRO_CORE_INFO_TARGET)/mame2003_plus_libretro.info $(LIBRETRO_CORE_INFO_TARGET)/mame078plus_libretro.info
	mv $(LIBRETRO_CORE_INFO_TARGET)/mame2010_libretro.info $(LIBRETRO_CORE_INFO_TARGET)/mame0139_libretro.info
	mv $(LIBRETRO_CORE_INFO_TARGET)/mednafen_pce_fast_libretro.info $(LIBRETRO_CORE_INFO_TARGET)/pce_fast_libretro.info
	mv $(LIBRETRO_CORE_INFO_TARGET)/mednafen_pce_libretro.info $(LIBRETRO_CORE_INFO_TARGET)/pce_libretro.info
	mv $(LIBRETRO_CORE_INFO_TARGET)/mednafen_pcfx_libretro.info $(LIBRETRO_CORE_INFO_TARGET)/pcfx_libretro.info
	mv $(LIBRETRO_CORE_INFO_TARGET)/mednafen_saturn_libretro.info $(LIBRETRO_CORE_INFO_TARGET)/beetle-saturn_libretro.info
	mv $(LIBRETRO_CORE_INFO_TARGET)/mednafen_supafaust_libretro.info $(LIBRETRO_CORE_INFO_TARGET)/supafaust_libretro.info
	mv $(LIBRETRO_CORE_INFO_TARGET)/mednafen_vb_libretro.info $(LIBRETRO_CORE_INFO_TARGET)/vb_libretro.info
	mv $(LIBRETRO_CORE_INFO_TARGET)/mupen64plus_next_libretro.info $(LIBRETRO_CORE_INFO_TARGET)/mupen64plus-next_libretro.info
	cp $(LIBRETRO_CORE_INFO_TARGET)/snes9x2010_libretro.info $(LIBRETRO_CORE_INFO_TARGET)/pocketsnes_libretro.info
	mv $(LIBRETRO_CORE_INFO_TARGET)/snes9x2010_libretro.info $(LIBRETRO_CORE_INFO_TARGET)/snes9x_next_libretro.info
	mv $(LIBRETRO_CORE_INFO_TARGET)/vbam_libretro.info $(LIBRETRO_CORE_INFO_TARGET)/vba-m_libretro.info

	# superflappybirds_libretro.so => no info found
	touch $(LIBRETRO_CORE_INFO_TARGET)/superflappybirds_libretro.info
endef

$(eval $(generic-package))
