################################################################################
#
# d7vk
#
################################################################################
# Version: Commits on Dec 28, 2025
D7VK_VERSION = v1.1
D7VK_SOURCE = d7vk-$(D7VK_VERSION).zip
D7VK_SITE = https://github.com/WinterSnowfall/d7vk/releases/download/$(D7VK_VERSION)
D7VK_LICENSE = zlib/libpng

define D7VK_EXTRACT_CMDS
	mkdir -p $(@D)/target && cd $(@D)/target && unzip $(DL_DIR)/$(D7VK_DL_SUBDIR)/$(D7VK_SOURCE)
endef

define D7VK_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/wine/d7vk
	cp -pr $(@D)/target/d7vk-$(D7VK_VERSION)/x32 $(TARGET_DIR)/usr/wine/d7vk/
endef

$(eval $(generic-package))
