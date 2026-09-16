################################################################################
#
# vkquake2
#
################################################################################
# Version: Commits on Aug 04, 2026
VKQUAKE2_VERSION = 1.5.10
VKQUAKE2_SITE = $(call github,kondrak,vkQuake2,$(VKQUAKE2_VERSION))
VKQUAKE2_LICENSE = GPL-2.0
VKQUAKE2_LICENSE_FILE = LICENSE

VKQUAKE2_DEPENDENCIES = alsa-lib glslang libglu vulkan-headers vulkan-loader
VKQUAKE2_DEPENDENCIES += xlib_libXxf86dga xlib_libXxf86vm
VKQUAKE2_EMULATOR_INFO = vkquake2.emulator.yml

ifeq ($(BR2_aarch64),y)
    VKQUAKE2_CONF_OPTS = -DGAME_ARCH=aarch64
else ifeq ($(BR2_arm),y)
    VKQUAKE2_CONF_OPTS = -DGAME_ARCH=armv7l
else ifeq ($(BR2_x86_64),y)
    VKQUAKE2_CONF_OPTS = -DGAME_ARCH=x64
endif

define VKQUAKE2_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/vkquake2/baseq2
	mkdir -p $(TARGET_DIR)/usr/bin/vkquake2/ctf
	mkdir -p $(TARGET_DIR)/usr/bin/vkquake2/rogue
	mkdir -p $(TARGET_DIR)/usr/bin/vkquake2/smd
	mkdir -p $(TARGET_DIR)/usr/bin/vkquake2/xatrix
	mkdir -p $(TARGET_DIR)/usr/bin/vkquake2/zaero

	cp -f $(@D)/quake2      $(TARGET_DIR)/usr/bin/vkquake2/
	cp -f $(@D)/ref*.so     $(TARGET_DIR)/usr/bin/vkquake2/
	cp -f $(@D)/baseq2/*.so $(TARGET_DIR)/usr/bin/vkquake2/baseq2/
	cp -f $(@D)/ctf/*.so    $(TARGET_DIR)/usr/bin/vkquake2/ctf/
	cp -f $(@D)/rogue/*.so  $(TARGET_DIR)/usr/bin/vkquake2/rogue/
	cp -f $(@D)/smd/*.so    $(TARGET_DIR)/usr/bin/vkquake2/smd/
	cp -f $(@D)/xatrix/*.so $(TARGET_DIR)/usr/bin/vkquake2/xatrix/
	cp -f $(@D)/zaero/*.so  $(TARGET_DIR)/usr/bin/vkquake2/zaero/
endef

define VKQUAKE2_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake/vkquake2/quake2.keys $(TARGET_DIR)/usr/share/evmapy
endef

VKQUAKE2_POST_INSTALL_TARGET_HOOKS += VKQUAKE2_EVMAPY

$(eval $(cmake-package))
$(eval $(emulator-info-package))
