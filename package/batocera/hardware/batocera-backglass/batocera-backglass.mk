################################################################################
#
# batocera-backglass
#
################################################################################

BATOCERA_BACKGLASS_VERSION = 1.0
BATOCERA_BACKGLASS_LICENSE = GPL
BATOCERA_BACKGLASS_SOURCE=

BATOCERA_BACKGLASS_PATH = $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/hardware/batocera-backglass

define BATOCERA_BACKGLASS_INSTALL_TARGET_CMDS
	# script
	mkdir -p $(TARGET_DIR)/usr/bin
	install -m 0755 $(BATOCERA_BACKGLASS_PATH)/batocera-backglass.sh		$(TARGET_DIR)/usr/bin/batocera-backglass
	install -m 0755 $(BATOCERA_BACKGLASS_PATH)/batocera-backglass-window.py $(TARGET_DIR)/usr/bin/batocera-backglass-window

	# hooks
	mkdir -p $(TARGET_DIR)/usr/share/batocera-backglass/scripts
	$(INSTALL) -m 0755 -D $(BATOCERA_BACKGLASS_PATH)/scripts/*.sh $(TARGET_DIR)/usr/share/batocera-backglass/scripts/

	# default web page
	mkdir -p $(TARGET_DIR)/usr/share/batocera-backglass/www/backglass-default
	cp -pr $(BATOCERA_BACKGLASS_PATH)/www/backglass-default/*.{js,css,htm} $(TARGET_DIR)/usr/share/batocera-backglass/www/backglass-default/
	mkdir -p $(TARGET_DIR)/usr/share/batocera-backglass/www/backglass-image
	cp -pr $(BATOCERA_BACKGLASS_PATH)/www/backglass-image/*.{js,css,htm}   $(TARGET_DIR)/usr/share/batocera-backglass/www/backglass-image/
	mkdir -p $(TARGET_DIR)/usr/share/batocera-backglass/www/backglass-marquee
	cp -pr $(BATOCERA_BACKGLASS_PATH)/www/backglass-marquee/*.{js,css,htm} $(TARGET_DIR)/usr/share/batocera-backglass/www/backglass-marquee/
	mkdir -p $(TARGET_DIR)/usr/share/batocera-backglass/www/backglass-boxart
	cp -pr $(BATOCERA_BACKGLASS_PATH)/www/backglass-boxart/*.{js,css,htm} $(TARGET_DIR)/usr/share/batocera-backglass/www/backglass-boxart/
	mkdir -p $(TARGET_DIR)/usr/share/batocera-backglass/www/backglass-fanart
	cp -pr $(BATOCERA_BACKGLASS_PATH)/www/backglass-fanart/*.{js,css,htm} $(TARGET_DIR)/usr/share/batocera-backglass/www/backglass-fanart/
endef

$(eval $(generic-package))
