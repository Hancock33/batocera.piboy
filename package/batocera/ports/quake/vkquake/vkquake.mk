################################################################################
#
# vkquake
#
################################################################################
# Version: Commits on Mar 01, 2025
VKQUAKE_VERSION = c423f7e491d4669403dffbcffaa5c9b80ccf234f
VKQUAKE_SITE = $(call github,Novum,vkQuake,$(VKQUAKE_VERSION))
VKQUAKE_DEPENDENCIES = alsa-lib flac glslang mpg123 libvorbis opus opusfile sdl2
VKQUAKE_DEPENDENCIES += spirv-tools vulkan-headers vulkan-loader
VKQUAKE_DEPENDENCIES += host-spirv-tools host-glslang
VKQUAKE_LICENSE = GPLv2
VKQUAKE_LICENSE_FILE = LICENSE.txt

VKQUAKE_CONF_OPTS += -Ddo_userdirs=disabled

define VKQUAKE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/build/vkquake $(TARGET_DIR)/usr/bin/
endef

$(eval $(meson-package))
