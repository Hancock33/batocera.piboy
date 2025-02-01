################################################################################
#
# vkquake
#
################################################################################
# Version: Commits on Jan 27, 2025
VKQUAKE_VERSION = b86bf56e0c6acd9db95a11797e9108b647075ffd
VKQUAKE_SITE = $(call github,Novum,vkQuake,$(VKQUAKE_VERSION))
VKQUAKE_DEPENDENCIES = alsa-lib flac glslang mpg123 libvorbis opus opusfile sdl2
VKQUAKE_DEPENDENCIES += spirv-tools vulkan-headers vulkan-loader
VKQUAKE_LICENSE = GPLv2
VKQUAKE_LICENSE_FILE = LICENSE.txt

VKQUAKE_CONF_OPTS += -Ddo_userdirs=disabled

define VKQUAKE_INSTALL_TARGET_CMDS
$(INSTALL) -D -m 0755 $(@D)/build/vkquake $(TARGET_DIR)/usr/bin/
endef

define VKQUAKE_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake/vkquake/quake.keys $(TARGET_DIR)/usr/share/evmapy
endef

VKQUAKE_POST_INSTALL_TARGET_HOOKS += VKQUAKE_EVMAPY

$(eval $(meson-package))
