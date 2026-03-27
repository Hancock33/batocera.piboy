################################################################################
#
# vkquake
#
################################################################################
# Version: Commits on Mar 27, 2026
VKQUAKE_VERSION = fb83a20f8f03a2114204d35ed75d85d5f73956a0
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
