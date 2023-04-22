################################################################################
#
# samtse
#
################################################################################
# Version: Commits on Apr 21, 2023
SAMTSE_VERSION = 2270f2c431ff2b70ab4957906531056413661362
SAMTSE_SITE = https://github.com/tx00100xt/SeriousSamClassic-VK.git
SAMTSE_SITE_METHOD=git
SAMTSE_GIT_SUBMODULES=YES
SAMTSE_SUBDIR = SamTSE/Sources
SAMTSE_SUPPORTS_IN_SOURCE_BUILD = NO
SAMTSE_DEPENDENCIES = sdl2 sdl2_mixer host-samtfe
SAMTSE_LICENSE = GPL-2.0

define SAMTSE_CP_WEAPONS
	cp -vfr $(@D)/SamTSE/Sources/Entities/PlayerWeapons_old.es $(@D)/SamTSE/Sources/Entities/PlayerWeapons.es
	sed -i "s|add_compile_options(-march=native)|#add_compile_options(-march=native)|" $(@D)/SamTSE/Sources/CMakeLists.txt
endef
SAMTSE_POST_EXTRACT_HOOKS += SAMTSE_CP_WEAPONS

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
	SAMTSE_CONF_OPTS += -DRPI4=ON
endif
SAMTSE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DECC=$(HOST_DIR)/bin/ecc -DTSE=ON

define SAMTSE_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/share/game_assets/samtse
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/samtse/Bin
	# copy assets
	cp -av $(SAMTSE_BUILDDIR)/Debug/*                                   $(TARGET_DIR)/usr/share/game_assets/samtse/Bin
	cp -av $(SAMTSE_BUILDDIR)/MakeFONT                                  $(TARGET_DIR)/usr/share/game_assets/samtse/Bin
	cp -av $(SAMTSE_BUILDDIR)/serioussamse-ded                          $(TARGET_DIR)/usr/share/game_assets/samtse/Bin/serioussam-ded
	cp -av $(SAMTSE_BUILDDIR)/serioussamse                              $(TARGET_DIR)/usr/share/game_assets/samtse/Bin/serioussam
	$(TARGET_STRIP) $(TARGET_DIR)/usr/share/game_assets/samtse/Bin/*

	# link libraries
	ln -sf /usr/share/game_assets/samtse/Bin/libEngineMP.so             $(TARGET_DIR)/usr/share/game_assets/samtse/Bin/libEngine.so
	ln -sf /usr/share/game_assets/samtse/Bin/libEntitiesMP.so           $(TARGET_DIR)/usr/share/game_assets/samtse/Bin/libEntities.so
	ln -sf /usr/share/game_assets/samtse/Bin/libGameMP.so               $(TARGET_DIR)/usr/share/game_assets/samtse/Bin/libGame.so
	ln -sf /usr/lib/libvorbisfile.so                                    $(TARGET_DIR)/usr/share/game_assets/samtse/Bin/libvorbisfile.so

	# link game files
	cp -av $(@D)/SamTSE/SE1_10b.gro                                     $(TARGET_DIR)/usr/share/game_assets/samtse
	ln -sf /userdata/roms/ports/serioussam/SamTSE/SE1_00.gro            $(TARGET_DIR)/usr/share/game_assets/samtse
	ln -sf /userdata/roms/ports/serioussam/SamTSE/SE1_00_Extra.gro      $(TARGET_DIR)/usr/share/game_assets/samtse
	ln -sf /userdata/roms/ports/serioussam/SamTSE/SE1_00_ExtraTools.gro $(TARGET_DIR)/usr/share/game_assets/samtse
	ln -sf /userdata/roms/ports/serioussam/SamTSE/SE1_00_Levels.gro     $(TARGET_DIR)/usr/share/game_assets/samtse
	ln -sf /userdata/roms/ports/serioussam/SamTSE/SE1_00_Logo.gro       $(TARGET_DIR)/usr/share/game_assets/samtse
	ln -sf /userdata/roms/ports/serioussam/SamTSE/SE1_00_Music.gro      $(TARGET_DIR)/usr/share/game_assets/samtse
	ln -sf /userdata/roms/ports/serioussam/SamTSE/1_04_patch.gro        $(TARGET_DIR)/usr/share/game_assets/samtse
	ln -sf /userdata/roms/ports/serioussam/SamTSE/1_07_tools.gro        $(TARGET_DIR)/usr/share/game_assets/samtse
	ln -sf /userdata/roms/ports/serioussam/SamTSE/Help                  $(TARGET_DIR)/usr/share/game_assets/samtse
	ln -sf /userdata/roms/ports/serioussam/SamTSE/Levels                $(TARGET_DIR)/usr/share/game_assets/samtse
	ln -sf /userdata/roms/ports/serioussam/SamTSE/Mods                  $(TARGET_DIR)/usr/share/game_assets/samtse
endef

$(eval $(cmake-package))
