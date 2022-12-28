################################################################################
#
# xbox-xcloud-client
#
################################################################################
# Version: Commits on Dec 28, 2022
XBOX_XCLOUD_CLIENT_VERSION = dc5636886efd4c145307c5993379e029afdc6aa4
XBOX_XCLOUD_CLIENT_SITE = https://github.com/unknownskl/xbox-xcloud-client/releases/download/v$(XBOX_XCLOUD_CLIENT_VERSION)
XBOX_XCLOUD_CLIENT_SOURCE = greenlight_$(XBOX_XCLOUD_CLIENT_VERSION)_amd64.deb
XBOX_XCLOUD_CLIENT_LICENSE =  MIT license
XBOX_XCLOUD_CLIENT_DEPENDENCIES = libnss at-spi2-atk

define XBOX_XCLOUD_CLIENT_EXTRACT_CMDS
    dpkg-deb -x $(XBOX_XCLOUD_CLIENT_DL_DIR)/$(XBOX_XCLOUD_CLIENT_SOURCE) $(TARGET_DIR)
endef

define XBOX_XCLOUD_CLIENT_INSTALL_TARGET_CMDS
    # es media
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/xboxcloud
	cp -a $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/wip/xbox-xcloud-client/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/xboxcloud
    # evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/wip/xbox-xcloud-client/xboxcloud.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
