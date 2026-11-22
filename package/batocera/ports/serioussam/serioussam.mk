################################################################################
#
# serioussam
#
################################################################################
# Version: Commits on Jan 14, 2026
SERIOUSSAM_VERSION = 510d36f901cbe883c56b155b53717e4efdeb6522
SERIOUSSAM_SITE = $(call github,tx00100xt,SeriousSamClassic-VK,$(SERIOUSSAM_VERSION))
SERIOUSSAM_SUPPORTS_IN_SOURCE_BUILD = NO
SERIOUSSAM_EMULATOR_INFO = serioussam.emulator.yml
SERIOUSSAM_DEPENDENCIES = sdl2 sdl2_mixer host-serioussam
SERIOUSSAM_LICENSE = GPL-2.0

SERIOUSSAM_CONF_OPTS += -DCMAKE_C_COMPILER=$(TARGET_CC)
SERIOUSSAM_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(TARGET_CXX)
SERIOUSSAM_CONF_OPTS += -DImageMagick_EXECUTABLE_DIR=/usr/bin

define HOST_SERIOUSSAM_BUILD_CMDS
	cd $(HOST_SERIOUSSAM_BUILDDIR) && ninja ecc
	cd $(HOST_SERIOUSSAM_BUILDDIR) && ninja ecc-se
endef

define HOST_SERIOUSSAM_INSTALL_CMDS
	$(INSTALL) -m 0755 -D -t $(HOST_DIR)/bin \
		$(HOST_SERIOUSSAM_BUILDDIR)/SamTFE/Sources/ecc \
		$(HOST_SERIOUSSAM_BUILDDIR)/SamTSE/Sources/ecc-se
endef

ifeq ($(BR2_PACKAGE_BATOCERA_BCM27XX),y)
SERIOUSSAM_CONF_OPTS += -DRPI4=ON -DUSE_ASM=OFF
endif

define SERIOUSSAM_INSTALL_TARGET_CMDS
	# evmap config
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/evmapy $(SERIOUSSAM_PKGDIR)/*.keys
	# TFE Assets
	rm -rf $(TARGET_DIR)/usr/share/game_assets/samtfe
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/samtfe/Bin
	cp -av $(SERIOUSSAM_BUILDDIR)/SamTFE/Sources/Debug/* $(TARGET_DIR)/usr/share/game_assets/samtfe/Bin
	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/share/game_assets/samtfe/Bin \
		$(SERIOUSSAM_BUILDDIR)/SamTFE/Sources/serioussam-ded \
		$(SERIOUSSAM_BUILDDIR)/SamTFE/Sources/serioussam-mkfont \
		$(SERIOUSSAM_BUILDDIR)/SamTFE/Sources/serioussam
	$(TARGET_STRIP) $(TARGET_DIR)/usr/share/game_assets/samtfe/Bin/*
	ln -sf /userdata/roms/ports/serioussam/SamTFE/1_00.gro				$(TARGET_DIR)/usr/share/game_assets/samtfe
	ln -sf /userdata/roms/ports/serioussam/SamTFE/1_00c.gro				$(TARGET_DIR)/usr/share/game_assets/samtfe
	ln -sf /userdata/roms/ports/serioussam/SamTFE/1_00_ExtraTools.gro	$(TARGET_DIR)/usr/share/game_assets/samtfe
	ln -sf /userdata/roms/ports/serioussam/SamTFE/1_00c_Logo.gro		$(TARGET_DIR)/usr/share/game_assets/samtfe
	ln -sf /userdata/roms/ports/serioussam/SamTFE/1_00_music.gro		$(TARGET_DIR)/usr/share/game_assets/samtfe
	ln -sf /userdata/roms/ports/serioussam/SamTFE/1_04_patch.gro		$(TARGET_DIR)/usr/share/game_assets/samtfe
	ln -sf /userdata/roms/ports/serioussam/SamTFE/1_00c_scripts.gro		$(TARGET_DIR)/usr/share/game_assets/samtfe
	ln -sf /userdata/roms/ports/serioussam/SamTFE/Help					$(TARGET_DIR)/usr/share/game_assets/samtfe
	ln -sf /userdata/roms/ports/serioussam/SamTFE/Levels				$(TARGET_DIR)/usr/share/game_assets/samtfe
	ln -sf /userdata/roms/ports/serioussam/SamTFE/Mods					$(TARGET_DIR)/usr/share/game_assets/samtfe

	# TSE Assets
	rm -rf $(TARGET_DIR)/usr/share/game_assets/samtse
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/samtse/Bin
	# copy assets
	cp -av $(SERIOUSSAM_BUILDDIR)/SamTSE/Sources/Debug/*				$(TARGET_DIR)/usr/share/game_assets/samtse/Bin
	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/share/game_assets/samtse/Bin $(SERIOUSSAM_BUILDDIR)/SamTSE/Sources/serioussamse-mkfont
	$(INSTALL) -m 0755 -D $(SERIOUSSAM_BUILDDIR)/SamTSE/Sources/serioussamse-ded $(TARGET_DIR)/usr/share/game_assets/samtse/Bin/serioussam-ded
	$(INSTALL) -m 0755 -D $(SERIOUSSAM_BUILDDIR)/SamTSE/Sources/serioussamse $(TARGET_DIR)/usr/share/game_assets/samtse/Bin/serioussam
	$(TARGET_STRIP) $(TARGET_DIR)/usr/share/game_assets/samtse/Bin/*

	# link libraries
	ln -sf /usr/share/game_assets/samtse/Bin/libEngineMP.so				$(TARGET_DIR)/usr/share/game_assets/samtse/Bin/libEngine.so
	ln -sf /usr/share/game_assets/samtse/Bin/libEntitiesMP.so			$(TARGET_DIR)/usr/share/game_assets/samtse/Bin/libEntities.so
	ln -sf /usr/share/game_assets/samtse/Bin/libGameMP.so				$(TARGET_DIR)/usr/share/game_assets/samtse/Bin/libGame.so
	ln -sf /usr/lib/libvorbisfile.so									$(TARGET_DIR)/usr/share/game_assets/samtse/Bin/libvorbisfile.so

	# link game files
	ln -sf /userdata/roms/ports/serioussam/SamTSE/SE1_00.gro			$(TARGET_DIR)/usr/share/game_assets/samtse
	ln -sf /userdata/roms/ports/serioussam/SamTSE/SE1_00_Extra.gro		$(TARGET_DIR)/usr/share/game_assets/samtse
	ln -sf /userdata/roms/ports/serioussam/SamTSE/SE1_00_ExtraTools.gro $(TARGET_DIR)/usr/share/game_assets/samtse
	ln -sf /userdata/roms/ports/serioussam/SamTSE/SE1_00_Levels.gro		$(TARGET_DIR)/usr/share/game_assets/samtse
	ln -sf /userdata/roms/ports/serioussam/SamTSE/SE1_00_Logo.gro		$(TARGET_DIR)/usr/share/game_assets/samtse
	ln -sf /userdata/roms/ports/serioussam/SamTSE/SE1_00_Music.gro		$(TARGET_DIR)/usr/share/game_assets/samtse
	ln -sf /userdata/roms/ports/serioussam/SamTSE/1_04_patch.gro		$(TARGET_DIR)/usr/share/game_assets/samtse
	ln -sf /userdata/roms/ports/serioussam/SamTSE/1_07_tools.gro		$(TARGET_DIR)/usr/share/game_assets/samtse
	ln -sf /userdata/roms/ports/serioussam/SamTSE/Help					$(TARGET_DIR)/usr/share/game_assets/samtse
	ln -sf /userdata/roms/ports/serioussam/SamTSE/Levels				$(TARGET_DIR)/usr/share/game_assets/samtse
	ln -sf /userdata/roms/ports/serioussam/SamTSE/Mods					$(TARGET_DIR)/usr/share/game_assets/samtse
endef

define SERIOUSSAM_CP_WEAPONS
	cp -vfr $(@D)/SamTFE/Sources/Entities/PlayerWeapons_old.es $(@D)/SamTFE/Sources/Entities/PlayerWeapons.es
	sed -i "s|add_compile_options(-march=native)|#add_compile_options(-march=native)|" $(@D)/SamTFE/Sources/CMakeLists.txt
	cp -vfr $(@D)/SamTSE/Sources/Entities/PlayerWeapons_old.es $(@D)/SamTSE/Sources/Entities/PlayerWeapons.es
	sed -i "s|add_compile_options(-march=native)|#add_compile_options(-march=native)|" $(@D)/SamTSE/Sources/CMakeLists.txt

	sed -i '/RPATH_SETTINGS/d' $(@D)/SamTFE/Sources/CMakeLists.txt
	sed -i '/RPATH_SETTINGS/d' $(@D)/SamTSE/Sources/CMakeLists.txt
endef
SERIOUSSAM_POST_EXTRACT_HOOKS += SERIOUSSAM_CP_WEAPONS

$(eval $(cmake-package))
$(eval $(emulator-info-package))
$(eval $(host-cmake-package))
