################################################################################
#
# shadps4
#
################################################################################
# Version: Commits on Mar 29, 2025
SHADPS4_VERSION = 3f33d218b35fcf7af7ca445c80a1f711eb77e474
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

$(eval $(cmake-package))
