################################################################################
#
# cemu
#
################################################################################
# Version: Commits on Jun 14, 2025
CEMU_VERSION = 4fa0df6dcff636736a2ee8b9fcefe7236d36d522
CEMU_SITE = https://github.com/cemu-project/Cemu.git
CEMU_LICENSE = GPLv2
CEMU_SITE_METHOD=git
CEMU_GIT_SUBMODULES=YES
CEMU_DEPENDENCIES = bluez5_utils boost cubeb fmt glm glslang libcurl libpng libzip pugixml rapidjson sdl2 wxwidgets zlib zstd
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
    CEMU_PRE_CONFIGURE_HOOKS = CEMU_WAYLAND_CMAKE
else
    CEMU_CONF_OPTS += -DENABLE_WAYLAND=OFF
endif

define CEMU_WAYLAND_CMAKE
	$(SED) 's:$${WaylandProtocols_DATADIR}:$(STAGING_DIR)/usr/share/wayland-protocols:g' $(@D)/CMakeLists.txt
endef

define CEMU_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/cemu/
	$(INSTALL) -D -m 0755 $(@D)/bin/Cemu_release $(TARGET_DIR)/usr/bin/cemu/cemu
	cp -pr $(@D)/bin/{gameProfiles,resources}    $(TARGET_DIR)/usr/bin/cemu/
	$(INSTALL) -m 0755 -D $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/cemu/get-audio-device $(TARGET_DIR)/usr/bin/cemu/
	# keys.txt
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/cemu
	touch $(TARGET_DIR)/usr/share/batocera/datainit/bios/cemu/keys.txt
endef

$(eval $(cmake-package))
