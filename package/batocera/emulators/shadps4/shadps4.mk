################################################################################
#
# shadps4
#
################################################################################
# Version: Commits on Feb 16, 2025
SHADPS4_VERSION = e13fb2e366042ab66a57a5298101fdb4bba66674
SHADPS4_SITE = https://github.com/shadps4-emu/shadPS4.git
SHADPS4_SITE_METHOD=git
SHADPS4_GIT_SUBMODULES=YES
SHADPS4_LICENSE = GPLv2
SHADPS4_LICENSE_FILE = LICENSE
SHADPS4_DEPENDENCIES += alsa-lib jack2 libedit libevdev openal openssl pulseaudio udev
SHADPS4_DEPENDENCIES += glslang vulkan-headers vulkan-loader vulkan-validationlayers
SHADPS4_DEPENDENCIES += qt6base qt6multimedia qt6svg qt6tools

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
