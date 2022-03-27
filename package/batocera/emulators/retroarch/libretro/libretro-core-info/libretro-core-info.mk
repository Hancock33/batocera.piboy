################################################################################
#
# LIBRETRO_CORE_INFO
#
################################################################################
# Version: Commits on Mar 26, 2022
LIBRETRO_CORE_INFO_VERSION = 26d15c57d1dbdee1ffa42035e511930d5389458a
LIBRETRO_CORE_INFO_SITE = $(call github,libretro,libretro-core-info,$(LIBRETRO_CORE_INFO_VERSION))
LIBRETRO_CORE_INFO_LICENSE = MIT

define LIBRETRO_CORE_INFO_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/libretro/cores
	mv $(@D)/genesis_plus_gx_libretro.info 		$(TARGET_DIR)/usr/share/libretro/cores/genesisplusgx_libretro.info
	mv $(@D)/genesis_plus_gx_wide_libretro.info $(TARGET_DIR)/usr/share/libretro/cores/genesisplusgx-wide_libretro.info
	mv $(@D)/mame_libretro.info 				$(TARGET_DIR)/usr/share/libretro/cores/mamevirtual_libretro.info
	mv $(@D)/mame2003_plus_libretro.info 		$(TARGET_DIR)/usr/share/libretro/cores/mame078plus_libretro.info
	mv $(@D)/mame2010_libretro.info 			$(TARGET_DIR)/usr/share/libretro/cores/mame0139_libretro.info
	mv $(@D)/mednafen_pce_fast_libretro.info 	$(TARGET_DIR)/usr/share/libretro/cores/pce_fast_libretro.info
	mv $(@D)/mednafen_pcfx_libretro.info		$(TARGET_DIR)/usr/share/libretro/cores/pcfx_libretro.info
	mv $(@D)/mednafen_supafaust_libretro.info	$(TARGET_DIR)/usr/share/libretro/cores/supafaust_libretro.info
	mv $(@D)/mednafen_vb_libretro.info 			$(TARGET_DIR)/usr/share/libretro/cores/vb_libretro.info
	mv $(@D)/mess2015_libretro.info				$(TARGET_DIR)/usr/share/libretro/cores/mess_libretro.info
	mv $(@D)/mupen64plus_next_libretro.info 	$(TARGET_DIR)/usr/share/libretro/cores/mupen64plus-next_libretro.info
	mv $(@D)/vbam_libretro.info 				$(TARGET_DIR)/usr/share/libretro/cores/vba-m_libretro.info
	cp -a $(@D)/*.info 							$(TARGET_DIR)/usr/share/libretro/cores/
endef

$(eval $(generic-package))
