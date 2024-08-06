################################################################################
#
# ryujinxng
#
################################################################################
# Version: Commits on Aug 06, 2024
RYUJINXNG_VERSION = 1.1.1372
RYUJINXNG_SITE = https://github.com/Ryujinx/release-channel-master/releases/download/$(RYUJINXNG_VERSION)
RYUJINXNG_LICENSE = MIT
RYUJINXNG_DEPENDENCIES = sdl2 openal hicolor-icon-theme adwaita-icon-theme librsvg

ifeq ($(BR2_x86_64),y)
	RYUJINXNG_SOURCE = ryujinx-$(RYUJINXNG_VERSION)-linux_x64.tar.gz
else
	RYUJINXNG_SOURCE = ryujinx-$(RYUJINXNG_VERSION)-linux_arm64.tar.gz
endif

define RYUJINXNG_EXTRACT_CMDS
	mkdir -p $(@D)/target && cd $(@D)/target && \
		tar xf $(DL_DIR)/$(RYUJINXNG_DL_SUBDIR)/$(RYUJINXNG_SOURCE)
endef

define RYUJINXNG_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/bin/ryujinx-ng
	mkdir -p $(TARGET_DIR)/usr/bin/ryujinx-ng
	cp -avr $(@D)/target/publish/* $(TARGET_DIR)/usr/bin/ryujinx-ng
	rm -rf  $(TARGET_DIR)/usr/bin/ryujinx-ng/Ryujinx.Ava
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/ryujinx/switch.ryujinx.keys \
		$(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
