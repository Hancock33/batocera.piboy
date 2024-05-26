################################################################################
#
# ryujinx
#
################################################################################
# Version: Commits on May 25, 2024
RYUJINX_VERSION = 1.1.1322
RYUJINX_SITE = https://github.com/Ryujinx/release-channel-master/releases/download/$(RYUJINX_VERSION)
RYUJINX_LICENSE = MIT
RYUJINX_DEPENDENCIES = sdl2 openal hicolor-icon-theme adwaita-icon-theme librsvg

ifeq ($(BR2_x86_64),y)
	RYUJINX_SOURCE = ryujinx-$(RYUJINX_VERSION)-linux_x64.tar.gz
else
	RYUJINX_SOURCE = ryujinx-$(RYUJINX_VERSION)-linux_arm64.tar.gz
endif

define RYUJINX_EXTRACT_CMDS
	mkdir -p $(@D)/target && cd $(@D)/target && \
		tar xf $(DL_DIR)/$(RYUJINX_DL_SUBDIR)/$(RYUJINX_SOURCE)
endef

define RYUJINX_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/bin/ryujinx
	mkdir -p $(TARGET_DIR)/usr/bin/ryujinx
	cp -avr $(@D)/target/publish/* $(TARGET_DIR)/usr/bin/ryujinx
	rm -rf  $(TARGET_DIR)/usr/bin/ryujinx/Ryujinx.Ava
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/ryujinx/switch.ryujinx.keys \
		$(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
