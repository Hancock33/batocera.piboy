################################################################################
#
# mame
#
################################################################################
# Version: Commits on Jul 31, 2026
MAME_VERSION = mame0289
MAME_SITE = https://github.com/Hancock33/batocera-mame-builds/releases/download/$(MAME_VERSION)
MAME_LICENSE = MAME
MAME_DEPENDENCIES += expat flac fontconfig glm jpeg libpng lua pulseaudio
MAME_DEPENDENCIES += rapidjson sdl2 sdl2_ttf sqlite zlib

$(eval $(call register,mame.emulator.yml))
$(eval $(call register-if-kconfig,BR2_PACKAGE_BATOCERA_VULKAN,bgfxbackend.mame.emulator.yml))
$(eval $(call register-if-kconfig,BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY,sega-arcade.mame.emulator.yml))

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
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/bin/mame/bgfx/chains \
		$(MAME_PKGDIR)/crt-geom-deluxe-rgb.json \
		$(MAME_PKGDIR)/crt-geom-deluxe-composite.json

	# Copy blank disk image(s)
	$(INSTALL) -m 0644 -D $(MAME_PKGDIR)/blank.fmtowns $(TARGET_DIR)/usr/share/mame/blank.fmtowns

	# Copy coin drop plugin
	cp -R -u $(MAME_PKGDIR)/coindrop $(TARGET_DIR)/usr/bin/mame/plugins

	# Copy data plugin information
	cp -R $(MAME_PKGDIR)/dats			$(TARGET_DIR)/usr/bin/mame/
	cp -R $(MAME_PKGDIR)/history			$(TARGET_DIR)/usr/bin/mame/

	# Copy user -autoboot_command overrides (batocera.linux/batocera.linux#11706)
	mkdir -p $(MAME_CONF_INIT)/autoload
	cp -R $(MAME_PKGDIR)/autoload			$(MAME_CONF_INIT)
endef

# Systems that share the generic MAME evmapy mapping
MAME_EVMAPY_SYSTEMS = adam advision apfm1000 apple2 apple2gs arcadia archimedes astrocde
MAME_EVMAPY_SYSTEMS += atom bbc camplynx cdi coco crvision electron fm7
MAME_EVMAPY_SYSTEMS += fmtowns gamate gameandwatch gamecom gamepock gmaster gp32 lcdgames
MAME_EVMAPY_SYSTEMS += laser310 macintosh sameduck megaduck neogeo pdp1 plugnplay pv1000
MAME_EVMAPY_SYSTEMS += socrates supracan ti99 tutor vc4000 vectrex vgmplay vsmile
MAME_EVMAPY_SYSTEMS += xegs
# Arcade systems
MAME_EVMAPY_SYSTEMS += acclaim alg alphadenshi amcoe atari atlus banpresto cave
MAME_EVMAPY_SYSTEMS += centurye cinematronics comad cps1 cps2 cps3 dataeast dynax
MAME_EVMAPY_SYSTEMS += eighting exidy gaelco gottlieb igs incredibletech irem jaleco
MAME_EVMAPY_SYSTEMS += kaneko konami midway mitchell namco nichibutsu nintendo nmk
MAME_EVMAPY_SYSTEMS += pgm playchoice psikyo sammy sega segastv seibu semicom
MAME_EVMAPY_SYSTEMS += seta snk taito technos tecmo toaplan unico universal
MAME_EVMAPY_SYSTEMS += visco

define MAME_EVMAPY
	$(INSTALL) -m 0644 -D $(MAME_PKGDIR)/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/mame.mame.keys
	for sys in $(MAME_EVMAPY_SYSTEMS); do \
		$(INSTALL) -m 0644 $(MAME_PKGDIR)/mame.mame.keys $(TARGET_DIR)/usr/share/evmapy/$$sys.mame.keys || exit 1; \
	done
endef

MAME_POST_INSTALL_TARGET_HOOKS += MAME_EVMAPY

$(eval $(generic-package))
$(eval $(emulator-info-package))
