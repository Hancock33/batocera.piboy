################################################################################
#
# sdlpop
#
################################################################################
# Version: Commits on Nov 07, 2026
SDLPOP_VERSION = f7be2e939375d369d26e1d10bcdd5ca74d3002a2
SDLPOP_SITE = $(call github,NagyD,SDLPoP,$(SDLPOP_VERSION))
SDLPOP_SUBDIR = src
SDLPOP_LICENSE = GPL-3.0
SDLPOP_DEPENDENCIES = sdl2 sdl2_image
SDLPOP_EMULATOR_INFO = sdlpop.emulator.yml

define SDLPOP_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/SDLPoP
	mkdir -p $(TARGET_DIR)/usr/share/SDLPoP/cfg
	$(INSTALL) -m 0755 $(@D)/prince -D $(TARGET_DIR)/usr/bin/SDLPoP
	cp $(@D)/SDLPoP.ini $(TARGET_DIR)/usr/share/SDLPoP/cfg/SDLPoP.ini
	echo "# Blank cfg file for advanced configuration" > $(TARGET_DIR)/usr/share/SDLPoP/cfg/SDLPoP.cfg
	cp -pr $(@D)/data $(TARGET_DIR)/usr/share/SDLPoP/
	# install media
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/sdlpop
	cp -a  $(SDLPOP_PKGDIR)/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/sdlpop/
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
