################################################################################
#
# xbox-xcloud-client
#
################################################################################
# Version: Commits on Aug 30, 2023
XBOX_XCLOUD_CLIENT_VERSION = 2.0.0-beta12
XBOX_XCLOUD_CLIENT_SITE = https://github.com/unknownskl/greenlight/releases/download/v$(XBOX_XCLOUD_CLIENT_VERSION)
XBOX_XCLOUD_CLIENT_SOURCE = Greenlight-$(XBOX_XCLOUD_CLIENT_VERSION).AppImage

XBOX_XCLOUD_CLIENT_LICENSE =  MIT license
XBOX_XCLOUD_CLIENT_DEPENDENCIES = libnss

define XBOX_XCLOUD_CLIENT_EXTRACT_CMDS
	cp -av $(XBOX_XCLOUD_CLIENT_DL_DIR)/$(XBOX_XCLOUD_CLIENT_SOURCE) $(TARGET_DIR)/usr/bin/greenlight
	chmod 754 $(TARGET_DIR)/usr/bin/greenlight
endef

define XBOX_XCLOUD_CLIENT_INSTALL_TARGET_CMDS
	# es media
	#mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/xboxcloud
	#cp -a $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/xbox-xcloud-client/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/xboxcloud
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/xbox-xcloud-client/xboxcloud.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
