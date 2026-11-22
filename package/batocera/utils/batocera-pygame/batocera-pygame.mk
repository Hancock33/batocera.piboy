################################################################################
#
# batocera-pygame
#
################################################################################
# Version: Commits on Feb 12, 2026
BATOCERA_PYGAME_VERSION = 879a88badc15725f52074de1c4de23cfd8906a32
BATOCERA_PYGAME_RETROTRIVIA_VERSION = 1.4
BATOCERA_PYGAME_LICENSE = GPL-3.0
BATOCERA_PYGAME_SITE = $(call github,lbrpdx,retrotrivia,$(BATOCERA_PYGAME_VERSION))
BATOCERA_PYGAME_EMULATOR_INFO = pygame.emulator.yml

BATOCERA_PYGAME_ROMS_DIR = $(TARGET_DIR)/usr/share/batocera/datainit/roms/pygame

define BATOCERA_PYGAME_INSTALL_SAMPLE
	$(INSTALL) -D -m 0644 $(BATOCERA_PYGAME_PKGDIR)/evmapy.keys $(TARGET_DIR)/usr/share/evmapy/pygame.keys
	$(INSTALL) -D -m 0755 -t $(BATOCERA_PYGAME_ROMS_DIR)/retrotrivia $(@D)/retrotrivia.pygame
	$(INSTALL) -D -m 0644 -t $(BATOCERA_PYGAME_ROMS_DIR)/retrotrivia $(@D)/questions.py $(@D)/videoplayer.py $(@D)/gamelists.py $(@D)/README.md
	$(INSTALL) -D -m 0644 -t $(BATOCERA_PYGAME_ROMS_DIR)/retrotrivia/assets $(@D)/assets/*
	$(INSTALL) -D -m 0644 -t $(BATOCERA_PYGAME_ROMS_DIR)/images $(@D)/retrotrivia.png
	$(INSTALL) -D -m 0644 -t $(BATOCERA_PYGAME_ROMS_DIR)/manuals $(@D)/retrotrivia-manual.pdf
	$(INSTALL) -D -m 0644 $(BATOCERA_PYGAME_PKGDIR)/retrotrivia.xml $(BATOCERA_PYGAME_ROMS_DIR)/gamelist.xml

	# create an alias for pygame to be able to kill it with killall and evmapy
	mkdir -p $(TARGET_DIR)/usr/bin
	ln -sf python $(TARGET_DIR)/usr/bin/pygame
endef

BATOCERA_PYGAME_POST_INSTALL_TARGET_HOOKS = BATOCERA_PYGAME_INSTALL_SAMPLE

$(eval $(generic-package))
$(eval $(emulator-info-package))
