################################################################################
#
# libretro-core-info
#
################################################################################
# Version: Commits on Nov 11, 2025
LIBRETRO_CORE_INFO_VERSION = 49965de2e05f433882463bba0403c0c6d7998913
LIBRETRO_CORE_INFO_SITE = $(call github,libretro,libretro-core-info,$(LIBRETRO_CORE_INFO_VERSION))
LIBRETRO_CORE_INFO_LICENSE = MIT

define LIBRETRO_CORE_INFO_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	mv $(@D)/bsnes_hd_beta_libretro.info		$(TARGET_DIR)/usr/share/libretro/info/bsnes_hd_libretro.info
	cp $(@D)/fbalpha2012_libretro.info			$(TARGET_DIR)/usr/share/libretro/info/fbalpha_libretro.info
	cp $(@D)/genesis_plus_gx_libretro.info		$(TARGET_DIR)/usr/share/libretro/genesisplusgx-expanded_libretro.info
	mv $(@D)/genesis_plus_gx_libretro.info		$(TARGET_DIR)/usr/share/libretro/info/genesisplusgx_libretro.info
	mv $(@D)/genesis_plus_gx_wide_libretro.info $(TARGET_DIR)/usr/share/libretro/info/genesisplusgx-wide_libretro.info
	cp $(@D)/mame_libretro.info					$(TARGET_DIR)/usr/share/libretro/info/mess_libretro.info
	mv $(@D)/mame_libretro.info					$(TARGET_DIR)/usr/share/libretro/info/mamevirtual_libretro.info
	cp $(@D)/mame2000_libretro.info				$(TARGET_DIR)/usr/share/libretro/info/imame4all_libretro.info
	mv $(@D)/mame2003_plus_libretro.info		$(TARGET_DIR)/usr/share/libretro/info/mame078plus_libretro.info
	mv $(@D)/mame2010_libretro.info				$(TARGET_DIR)/usr/share/libretro/info/mame0139_libretro.info
	mv $(@D)/mednafen_pce_fast_libretro.info	$(TARGET_DIR)/usr/share/libretro/info/pce_fast_libretro.info
	mv $(@D)/mednafen_pce_libretro.info			$(TARGET_DIR)/usr/share/libretro/info/pce_libretro.info
	mv $(@D)/mednafen_pcfx_libretro.info		$(TARGET_DIR)/usr/share/libretro/info/pcfx_libretro.info
	mv $(@D)/mednafen_saturn_libretro.info		$(TARGET_DIR)/usr/share/libretro/info/beetle-saturn_libretro.info
	mv $(@D)/mednafen_supafaust_libretro.info	$(TARGET_DIR)/usr/share/libretro/info/supafaust_libretro.info
	mv $(@D)/mednafen_vb_libretro.info			$(TARGET_DIR)/usr/share/libretro/info/vb_libretro.info
	mv $(@D)/mupen64plus_next_libretro.info		$(TARGET_DIR)/usr/share/libretro/info/mupen64plus-next_libretro.info
	cp $(@D)/snes9x2010_libretro.info			$(TARGET_DIR)/usr/share/libretro/info/pocketsnes_libretro.info
	mv $(@D)/snes9x2010_libretro.info			$(TARGET_DIR)/usr/share/libretro/info/snes9x_next_libretro.info
	mv $(@D)/vbam_libretro.info					$(TARGET_DIR)/usr/share/libretro/info/vba-m_libretro.info
	cp -r $(@D)/*.info							$(TARGET_DIR)/usr/share/libretro/info

	# superflappybirds_libretro.so => no info found
	touch $(TARGET_DIR)/usr/share/libretro/info/superflappybirds_libretro.info
endef

$(eval $(generic-package))
