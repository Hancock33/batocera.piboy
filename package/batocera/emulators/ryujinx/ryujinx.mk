################################################################################
#
# ryujinx
#
################################################################################
# Version: Commits on Apr 28, 2023
RYUJINX_VERSION = 1.1.738
RYUJINX_SOURCE = ryujinx-$(RYUJINX_VERSION)-linux_x64.tar.gz
RYUJINX_SITE = https://github.com/Ryujinx/release-channel-master/releases/download/$(RYUJINX_VERSION)
RYUJINX_LICENSE = MIT
RYUJINX_DEPENDENCIES = sdl2 openal hicolor-icon-theme adwaita-icon-theme librsvg

define RYUJINX_EXTRACT_CMDS
	mkdir -p $(@D)/target && cd $(@D)/target && \
	    tar xf $(DL_DIR)/$(RYUJINX_DL_SUBDIR)/$(RYUJINX_SOURCE)
endef

define RYUJINX_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/ryujinx
	mkdir -p $(TARGET_DIR)/usr/ryujinx
	cp -avr $(@D)/target/publish/* $(TARGET_DIR)/usr/ryujinx
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/ryujinx/switch.ryujinx.keys \
	    $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
