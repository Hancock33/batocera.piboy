################################################################################
#
# xbox-xcloud-client
#
################################################################################
# Version: Commits on Sept 20, 2025
XBOX_XCLOUD_CLIENT_VERSION = v2.3.3
XBOX_XCLOUD_CLIENT_SITE = https://github.com/unknownskl/greenlight/releases/download/$(XBOX_XCLOUD_CLIENT_VERSION)
XBOX_XCLOUD_CLIENT_SOURCE = Greenlight-$(subst v,,$(XBOX_XCLOUD_CLIENT_VERSION)).AppImage

XBOX_XCLOUD_CLIENT_LICENSE =  MIT license
XBOX_XCLOUD_CLIENT_DEPENDENCIES = libnss

define XBOX_XCLOUD_CLIENT_EXTRACT_CMDS
	cp -av $(XBOX_XCLOUD_CLIENT_DL_DIR)/$(XBOX_XCLOUD_CLIENT_SOURCE) $(TARGET_DIR)/usr/bin/greenlight
endef

define XBOX_XCLOUD_CLIENT_INSTALL_TARGET_CMDS
	chmod 754 $(TARGET_DIR)/usr/bin/greenlight
endef

$(eval $(generic-package))
