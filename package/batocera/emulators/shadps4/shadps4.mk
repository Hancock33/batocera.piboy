################################################################################
#
# shadps4
#
################################################################################
# Version: Commits on Jan 13, 2025
SHADPS4_VERSION = d94abffd9a6bba013fe2524a7e085ccfa253ced9
SHADPS4_SITE = https://github.com/shadps4-emu/shadPS4.git
SHADPS4_SITE_METHOD=git
SHADPS4_GIT_SUBMODULES=YES
SHADPS4_LICENSE = GPLv2
SHADPS4_LICENSE_FILE = LICENSE
SHADPS4_DEPENDENCIES += alsa-lib pulseaudio openal openssl libedit udev
SHADPS4_DEPENDENCIES += libevdev jack2 qt6base qt6svg qt6tools qt6multimedia
SHADPS4_DEPENDENCIES += glslang vulkan-headers vulkan-loader vulkan-validationlayers

SHADPS4_SUPPORTS_IN_SOURCE_BUILD = NO

SHADPS4_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=/usr
SHADPS4_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
SHADPS4_CONF_OPTS += -DENABLE_QT_GUI=ON

define SHADPS4_INSTALL_TARGET_CMDS
	 mkdir -p $(TARGET_DIR)/usr/bin/shadps4
	 $(INSTALL) -m 0755 $(@D)/buildroot-build/shadps4 $(TARGET_DIR)/usr/bin/shadps4/
	 cp -pr $(@D)/buildroot-build/translations $(TARGET_DIR)/usr/bin/shadps4/
endef

define SHADPS4_INSTALL_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	$(INSTALL) -D -m 0644 \
	    $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/shadps4/ps4.keys \
	    $(TARGET_DIR)/usr/share/evmapy/ps4.keys
endef

SHADPS4_POST_INSTALL_TARGET_HOOKS = SHADPS4_INSTALL_EVMAPY

$(eval $(cmake-package))
