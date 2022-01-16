################################################################################
#
# HSM SHADERS
#
################################################################################
# Version.: Commits on Jan 16, 2022
HSM_SHADERS_VERSION = 1e37a154117c753f75a185912563bcc6c7c7837a
HSM_SHADERS_SITE = $(call github,HyperspaceMadness,Mega_Bezel,$(HSM_SHADERS_VERSION))
HSM_SHADERS_LICENSE = GPL

define HSM_SHADERS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/shaders
	mkdir -p $(TARGET_DIR)/usr/share/batocera/shaders/bezel
	mkdir -p $(TARGET_DIR)/usr/share/batocera/shaders/bezel/Mega_Bezel
	mkdir -p $(TARGET_DIR)/usr/share/batocera/shaders/bezel/Mega_Bezel/Presets
	cp -R $(@D)/Presets/* $(TARGET_DIR)/usr/share/batocera/shaders/bezel/Mega_Bezel/Presets
	cp -R $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/retroarch/shaders/hsm-shaders/presets-batocera/* $(TARGET_DIR)/usr/share/batocera/shaders/bezel/Mega_Bezel/Presets
	mkdir -p $(TARGET_DIR)/usr/share/batocera/shaders/bezel/Mega_Bezel/tools
	cp -R $(@D)/tools/* $(TARGET_DIR)/usr/share/batocera/shaders/bezel/Mega_Bezel/tools
	mkdir -p $(TARGET_DIR)/usr/share/batocera/shaders/bezel/Mega_Bezel/shaders
	cp -R $(@D)/shaders/* $(TARGET_DIR)/usr/share/batocera/shaders/bezel/Mega_Bezel/shaders
endef

$(eval $(generic-package))
