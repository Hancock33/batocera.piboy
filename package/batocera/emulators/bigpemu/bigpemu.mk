################################################################################
#
# bigpemu
#
################################################################################
# Version: Commits on May 22, 2024
BIGPEMU_VERSION = v114
BIGPEMU_SOURCE = BigPEmu_Linux64_$(BIGPEMU_VERSION).tar.gz
BIGPEMU_SITE = https://www.richwhitehouse.com/jaguar/builds

define BIGPEMU_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/bigpemu
	cp -pr $(@D)/* $(TARGET_DIR)/usr/bin/bigpemu/
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/bigpemu/jaguar.bigpemu.keys $(TARGET_DIR)/usr/share/evmapy
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/bigpemu/jaguarcd.bigpemu.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
