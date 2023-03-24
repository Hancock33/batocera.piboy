################################################################################
#
# samtfe
#
################################################################################
# Version: Commits on Mar 24, 2023
SAMTFE_VERSION = 7b5e7ea3746f46caba2acf6d2c4b63b471b5c64f
SAMTFE_SITE = https://github.com/tx00100xt/SeriousSamClassic-VK.git
SAMTFE_SITE_METHOD=git
SAMTFE_GIT_SUBMODULES=YES
SAMTFE_SUBDIR = SamTFE/Sources
SAMTFE_SUPPORTS_IN_SOURCE_BUILD = NO
SAMTFE_DEPENDENCIES = sdl2 sdl2_mixer host-samtfe
SAMTFE_LICENSE = GPL-2.0

define SAMTFE_CP_WEAPONS
	cp -vfr $(@D)/SamTFE/Sources/Entities/PlayerWeapons_old.es $(@D)/SamTFE/Sources/Entities/PlayerWeapons.es
	sed -i "s|add_compile_options(-march=native)|#add_compile_options(-march=native)|" $(@D)/SamTFE/Sources/CMakeLists.txt
endef
SAMTFE_POST_EXTRACT_HOOKS += SAMTFE_CP_WEAPONS


HOST_SAMTFE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
define HOST_SAMTFE_INSTALL_CMDS
	cp -av $(HOST_SAMTFE_BUILDDIR)/ecc $(HOST_DIR)/bin
endef

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
SAMTFE_CONF_OPTS += -DRPI4=ON
endif
SAMTFE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DECC=$(HOST_DIR)/bin/ecc -DTFE=ON

define SAMTFE_INSTALL_TARGET_CMDS
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/samtfe/*.keys $(TARGET_DIR)/usr/share/evmapy
	# assets
	rm -rf $(TARGET_DIR)/usr/share/game_assets/samtfe
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/samtfe/Bin
	cp -av $(SAMTFE_BUILDDIR)/Debug/* $(TARGET_DIR)/usr/share/game_assets/samtfe/Bin
	cp -av $(SAMTFE_BUILDDIR)/{serioussam-ded,MakeFONT,serioussam} $(TARGET_DIR)/usr/share/game_assets/samtfe/Bin
	$(TARGET_STRIP) $(TARGET_DIR)/usr/share/game_assets/samtfe/Bin/*
	cp -av $(@D)/SamTFE/SE1_10b.gro                                   $(TARGET_DIR)/usr/share/game_assets/samtfe
	ln -sf /userdata/roms/ports/serioussam/SamTFE/1_00.gro            $(TARGET_DIR)/usr/share/game_assets/samtfe
	ln -sf /userdata/roms/ports/serioussam/SamTFE/1_00c.gro           $(TARGET_DIR)/usr/share/game_assets/samtfe
	ln -sf /userdata/roms/ports/serioussam/SamTFE/1_00_ExtraTools.gro $(TARGET_DIR)/usr/share/game_assets/samtfe
	ln -sf /userdata/roms/ports/serioussam/SamTFE/1_00c_Logo.gro      $(TARGET_DIR)/usr/share/game_assets/samtfe
	ln -sf /userdata/roms/ports/serioussam/SamTFE/1_00_music.gro      $(TARGET_DIR)/usr/share/game_assets/samtfe
	ln -sf /userdata/roms/ports/serioussam/SamTFE/1_04_patch.gro      $(TARGET_DIR)/usr/share/game_assets/samtfe
	ln -sf /userdata/roms/ports/serioussam/SamTFE/1_00c_scripts.gro   $(TARGET_DIR)/usr/share/game_assets/samtfe
	ln -sf /userdata/roms/ports/serioussam/SamTFE/Help                $(TARGET_DIR)/usr/share/game_assets/samtfe
	ln -sf /userdata/roms/ports/serioussam/SamTFE/Levels              $(TARGET_DIR)/usr/share/game_assets/samtfe
	ln -sf /userdata/roms/ports/serioussam/SamTFE/Mods                $(TARGET_DIR)/usr/share/game_assets/samtfe
endef

$(eval $(cmake-package))
$(eval $(host-cmake-package))
