################################################################################
#
# dxvk-nvapi
#
################################################################################
# Version: Commits on Jan 21, 2023
DXVK_NVAPI_VERSION = e6e9ff0fb30dfc689a1fc964dd6c7cac61d8a964
DXVK_NVAPI_SOURCE = dxvk-nvapi-v$(DXVK_NVAPI_VERSION).tar.gz
DXVK_NVAPI_SITE = https://github.com/jp7677/dxvk-nvapi/releases/download/v$(DXVK_NVAPI_VERSION)
DXVK_NVAPI_LICENSE = zlib/libpng

define DXVK_NVAPI_EXTRACT_CMDS
	mkdir -p $(@D)/target && cd $(@D)/target && tar xf $(DL_DIR)/$(DXVK_NVAPI_DL_SUBDIR)/$(DXVK_NVAPI_SOURCE)
endef

define DXVK_NVAPI_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/wine/dxvk/x32
	mkdir -p $(TARGET_DIR)/usr/wine/dxvk/x64
	cp -a $(@D)/target/x32/nvapi.dll $(TARGET_DIR)/usr/wine/dxvk/x32
	cp -a $(@D)/target/x64/nvapi64.dll $(TARGET_DIR)/usr/wine/dxvk/x64
endef

$(eval $(generic-package))
