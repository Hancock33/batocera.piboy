################################################################################
#
# cemu
#
################################################################################
# Version: Commits on Nov 20, 2026
CEMU_VERSION = 2f49c079da1d50b85cea0ed99aedda58846b3523
CEMU_SITE = https://github.com/cemu-project/Cemu.git
CEMU_SITE_METHOD = git
CEMU_GIT_SUBMODULES = YES
CEMU_LICENSE = MPL-2.0
CEMU_LICENSE_FILES = LICENSE.txt
CEMU_SUPPORTS_IN_SOURCE_BUILD = NO

CEMU_DEPENDENCIES = bluez5_utils boost cemu-common cubeb fmt glm glslang libcurl libgtk3 libpng
CEMU_DEPENDENCIES += libusb libzip openssl pugixml rapidjson sdl3 wxwidgets xlib_libX11 zlib zstd
CEMU_DEPENDENCIES += host-glslang host-nasm

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

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
CEMU_CONF_OPTS += -DENABLE_OPENGL=ON
CEMU_DEPENDENCIES += libgl
else
CEMU_CONF_OPTS += -DENABLE_OPENGL=OFF
endif

# vulkan headers are bundled, the loader is opened at runtime
ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
CEMU_CONF_OPTS += -DENABLE_VULKAN=ON
else
CEMU_CONF_OPTS += -DENABLE_VULKAN=OFF
endif

# Cemu names its binary after the cmake build type (Cemu_release / Cemu_debug)
CEMU_BINARY = Cemu_$(call LOWERCASE,$(CMAKE_TARGET_BUILD_TYPE))

define CEMU_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/bin/$(CEMU_BINARY) $(TARGET_DIR)/usr/bin/cemu/cemu
	$(INSTALL) -m 0755 -D $(CEMU_PKGDIR)/get-audio-device $(TARGET_DIR)/usr/bin/cemu/get-audio-device
	# game profiles, shared fonts and translations are read from <prefix>/share/Cemu
	mkdir -p $(TARGET_DIR)/usr/share/Cemu
	cp -pr $(@D)/bin/gameProfiles $(@D)/bin/resources $(TARGET_DIR)/usr/share/Cemu/
	# placeholder keys.txt, see 002-fix-keys-path.patch
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/cemu
	touch $(TARGET_DIR)/usr/share/batocera/datainit/bios/cemu/keys.txt
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
