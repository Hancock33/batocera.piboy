################################################################################
#
# d8vk
#
################################################################################
# Version: Commits on May 10, 2023
D8VK_VERSION = d8vk-v1.0
D8VK_SITE = https://github.com/AlpyneDreams/d8vk/releases/download/$(D8VK_VERSION)
D8VK_LICENSE = zlib
D8VK_LICENSE_FILES = LICENSE

D8VK_DEPENDENCIES = dxvk

define D8VK_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/wine/dxvk/x32
	mkdir -p $(TARGET_DIR)/usr/wine/dxvk/x64
	cp -af $(@D)/x32/d3d8.dll $(TARGET_DIR)/usr/wine/dxvk/x32
	cp -af $(@D)/x64/d3d8.dll $(TARGET_DIR)/usr/wine/dxvk/x64
endef

$(eval $(generic-package))
