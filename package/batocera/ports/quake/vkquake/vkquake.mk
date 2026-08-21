################################################################################
#
# vkquake
#
################################################################################
# Version: Commits on Aug 21, 2026
VKQUAKE_VERSION = 8ffb2ae7ef090310b9c5fde3eeafa56e1d5b6b47
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
