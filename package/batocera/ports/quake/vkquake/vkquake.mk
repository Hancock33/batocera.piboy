################################################################################
#
# vkquake
#
################################################################################
# Version: Commits on Aug 31, 2026
VKQUAKE_VERSION = 45e5a418e1512257d254a02f9be91832da0fe74b
VKQUAKE_SITE = $(call github,Novum,vkQuake,$(VKQUAKE_VERSION))
VKQUAKE_DEPENDENCIES = alsa-lib flac glslang mpg123 libvorbis opus opusfile sdl2
VKQUAKE_DEPENDENCIES += spirv-tools vulkan-headers vulkan-loader
VKQUAKE_DEPENDENCIES += host-spirv-tools host-glslang
VKQUAKE_LICENSE = GPLv2
VKQUAKE_LICENSE_FILE = LICENSE.txt
VKQUAKE_EMULATOR_INFO = vkquake.emulator.yml

VKQUAKE_CONF_OPTS += -Ddo_userdirs=disabled

define VKQUAKE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/vkquake $(TARGET_DIR)/usr/bin/
endef

$(eval $(meson-package))
$(eval $(emulator-info-package))
