################################################################################
#
# mame
#
################################################################################
# Version: Commits on Nov 28, 2025
MAME_VERSION = mame0283
MAME_SITE = https://github.com/Hancock33/batocera-mame-builds/releases/download/$(MAME_VERSION)
MAME_LICENSE = MAME
MAME_DEPENDENCIES += expat flac fontconfig glm jpeg libpng lua pulseaudio
MAME_DEPENDENCIES += rapidjson sdl2 sdl2_ttf sqlite zlib

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
    MAME_CROSS_ARCH = x86_64
endif

ifeq ($(BR2_aarch64),y)
    MAME_CROSS_ARCH = aarch64
endif

ifeq ($(BR2_arm),y)
    MAME_CROSS_ARCH = arm
endif

MAME_SOURCE = mame-$(MAME_CROSS_ARCH)-$(subst mame,,$(MAME_VERSION)).tar.xz

MAME_CONF_INIT = $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/mame/

define MAME_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/bin/mame
	mkdir -p $(TARGET_DIR)/usr/bin/mame
	tar -xf $(DL_DIR)/$(MAME_DL_SUBDIR)/$(MAME_SOURCE) -C $(TARGET_DIR)

	# Copy extra bgfx shaders
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/crt-geom-deluxe-rgb.json $(TARGET_DIR)/usr/bin/mame/bgfx/chains
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/crt-geom-deluxe-composite.json $(TARGET_DIR)/usr/bin/mame/bgfx/chains

	# Copy blank disk image(s)
	mkdir -p $(TARGET_DIR)/usr/share/mame
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/blank.fmtowns $(TARGET_DIR)/usr/share/mame/blank.fmtowns

	# Copy coin drop plugin
	cp -R -u $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/coindrop $(TARGET_DIR)/usr/bin/mame/plugins

	# Copy data plugin information
	cp -R $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/dats			$(TARGET_DIR)/usr/bin/mame/
	cp -R $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/history			$(TARGET_DIR)/usr/bin/mame/

	# gameStop script when exiting a rotated screen (xorg)
	if [ "$(BR2_PACKAGE_XSERVER_XORG_SERVER)" = "y" ]; then \
		mkdir -p $(TARGET_DIR)/usr/share/batocera/configgen/scripts; \
		cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/rotation_fix.sh $(TARGET_DIR)/usr/share/batocera/configgen/scripts/rotation_fix.sh; \
	fi

	# Copy user -autoboot_command overrides (batocera.linux/batocera.linux#11706)
	mkdir -p $(MAME_CONF_INIT)/autoload
	cp -R $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/autoload			$(MAME_CONF_INIT)
endef

define MAME_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/adam.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/advision.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/apfm1000.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/apple2.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/apple2gs.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/arcadia.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/archimedes.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/astrocde.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/atom.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/bbc.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/camplynx.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/cdi.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/coco.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/crvision.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/electron.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/fm7.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/fmtowns.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/gamate.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/gameandwatch.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/gamecom.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/gamepock.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/gmaster.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/gp32.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/lcdgames.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/laser310.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/macintosh.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/sameduck.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/megaduck.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/neogeo.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/pdp1.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/plugnplay.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/pv1000.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/socrates.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/supracan.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/ti99.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/tutor.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/vc4000.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/vectrex.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/vgmplay.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/vsmile.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/xegs.mame.keys

	# Arcade Systems
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/acclaim.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/alg.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/alphadenshi.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/amcoe.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/atari.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/atlus.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/banpresto.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/cave.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/centurye.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/cinematronics.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/comad.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/cps1.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/cps2.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/cps3.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/dataeast.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/dynax.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/eighting.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/exidy.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/gaelco.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/gottlieb.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/igs.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/incredibletech.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/irem.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/jaleco.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/kaneko.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/konami.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/midway.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/mitchell.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/namco.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/nichibutsu.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/nintendo.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/nmk.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/pgm.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/playchoice.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/psikyo.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/sammy.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/sega.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/segastv.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/seibu.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/semicom.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/seta.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/snk.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/taito.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/technos.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/tecmo.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/toaplan.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/unico.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/universal.mame.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/mame/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/visco.mame.keys
endef

MAME_POST_INSTALL_TARGET_HOOKS += MAME_EVMAPY

$(eval $(generic-package))
