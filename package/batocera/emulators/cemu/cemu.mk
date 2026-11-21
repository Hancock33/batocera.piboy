################################################################################
#
# cemu
#
################################################################################
# Version: Commits on Nov 20, 2026
CEMU_VERSION = 2f49c079da1d50b85cea0ed99aedda58846b3523
CEMU_SITE = https://github.com/cemu-project/Cemu.git
CEMU_LICENSE = GPLv2
CEMU_SITE_METHOD=git
CEMU_GIT_SUBMODULES=YES
CEMU_DEPENDENCIES += bluez5_utils boost cemu-common cubeb fmt glm glslang libcurl libpng libzip
CEMU_DEPENDENCIES += pugixml rapidjson sdl3 wxwidgets zlib zstd
CEMU_DEPENDENCIES += host-glslang host-libusb host-nasm host-pugixml host-zstd

CEMU_SUPPORTS_IN_SOURCE_BUILD = NO

CEMU_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
CEMU_CONF_OPTS += -DENABLE_DISCORD_RPC=OFF
CEMU_CONF_OPTS += -DENABLE_FERAL_GAMEMODE=OFF
CEMU_CONF_OPTS += -DENABLE_VCPKG=OFF
CEMU_CONF_OPTS += -DLINUX=ON

ifeq ($(BR2_PACKAGE_HIDAPI),y)
    CEMU_CONF_OPTS += -DENABLE_HIDAPI=ON
    CEMU_DEPENDENCIES += hidapi
else
    CEMU_CONF_OPTS += -DENABLE_HIDAPI=OFF
endif

ifeq ($(BR2_PACKAGE_WAYLAND),y)
    CEMU_CONF_OPTS += -DENABLE_WAYLAND=ON
    CEMU_DEPENDENCIES += wayland wayland-protocols
else
    CEMU_CONF_OPTS += -DENABLE_WAYLAND=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    CEMU_CONF_OPTS += -DENABLE_VULKAN=ON
    CEMU_DEPENDENCIES += glslang
else
    CEMU_DEPENDENCIES += -DENABLE_VULKAN=OFF
endif

define CEMU_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/cemu/ $(TARGET_DIR)/usr/share/Cemu/
	cp -p $(@D)/bin/cemu $(TARGET_DIR)/usr/bin/cemu/
	# game profiles, shared fonts and translations are read from <prefix>/share/Cemu
	cp -pr $(@D)/bin/{gameProfiles,resources} $(TARGET_DIR)/usr/share/Cemu/
	$(INSTALL) -m 0755 -D \
		$(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/cemu/get-audio-device \
		$(TARGET_DIR)/usr/bin/cemu/
	# create dir for keys.txt
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/cemu
	touch $(TARGET_DIR)/usr/share/batocera/datainit/bios/cemu/keys.txt
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
