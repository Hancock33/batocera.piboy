################################################################################
#
# dolphin-triforce
#
################################################################################

DOLPHIN_TRIFORCE_VERSION = 1.0
DOLPHIN_TRIFORCE_SOURCE = 
DOLPHIN_TRIFORCE_EMULATOR_INFO = dolphin_triforce.emulator.yml

define DOLPHIN_TRIFORCE_EXTRAS
	mkdir -p $(TARGET_DIR)/usr/share/triforce
	# copy extra ini files
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/*.ini $(TARGET_DIR)/usr/share/triforce
	# Virtua Striker 2002 (Japan)
	#cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/ $(TARGET_DIR)/usr/share/triforce/GEYJ6E.ini
	# Virtua Striker 2002 (Export, Type3)
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/SBEY.ini $(TARGET_DIR)/usr/share/triforce/GEYP6E.ini
	# F-ZERO AX
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/SBGG.ini $(TARGET_DIR)/usr/share/triforce/GGGE6E.ini
	# F-ZERO AX (Monster)
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/SBHA.ini $(TARGET_DIR)/usr/share/triforce/GHAE6E.ini
	# VIRTUA STRIKER 4 (Asia)
	#cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/ $(TARGET_DIR)/usr/share/triforce/GHZW6E.ini
	# VIRTUA STRIKER 4 (Export)
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/SBJA.ini $(TARGET_DIR)/usr/share/triforce/GJAP6E.ini
	# Mario Kart GP
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/SBKP.ini $(TARGET_DIR)/usr/share/triforce/GKPJ6E.ini
	# VIRTUA STRIKER 4 Ver.2006 (Japan)
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/SBLK.ini $(TARGET_DIR)/usr/share/triforce/GLKJ6E.ini
	# VIRTUA STRIKER 4 Ver.2006 (Export)
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/SBLL.ini $(TARGET_DIR)/usr/share/triforce/GLLP6E.ini
	# Mario Kart Arcade GP2
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dolphin-triforce/ini/SBNL.ini $(TARGET_DIR)/usr/share/triforce/GNLJ82.ini

	cd $(TARGET_DIR)/usr/bin && ln -sf dolphin-triforce dolphin-triforce.desktopconfig
endef

DOLPHIN_TRIFORCE_POST_INSTALL_TARGET_HOOKS += DOLPHIN_TRIFORCE_EXTRAS

$(eval $(generic-package))
$(eval $(emulator-info-package))
