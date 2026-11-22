################################################################################
#
# vkquake2
#
################################################################################
# Version: Commits on Aug 04, 2026
VKQUAKE2_VERSION = 1.5.10
VKQUAKE2_SITE = $(call github,kondrak,vkQuake2,$(VKQUAKE2_VERSION))
VKQUAKE2_LICENSE = GPL-2.0
VKQUAKE2_LICENSE_FILES = LICENSE

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
	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/bin/vkquake2 $(@D)/quake2 $(@D)/ref*.so
	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/bin/vkquake2/baseq2 $(@D)/baseq2/*.so
	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/bin/vkquake2/ctf $(@D)/ctf/*.so
	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/bin/vkquake2/rogue $(@D)/rogue/*.so
	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/bin/vkquake2/smd $(@D)/smd/*.so
	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/bin/vkquake2/xatrix $(@D)/xatrix/*.so
	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/bin/vkquake2/zaero $(@D)/zaero/*.so
endef

define VKQUAKE2_EVMAPY
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/evmapy $(VKQUAKE2_PKGDIR)/quake2.keys
endef

VKQUAKE2_POST_INSTALL_TARGET_HOOKS += VKQUAKE2_EVMAPY

$(eval $(cmake-package))
$(eval $(emulator-info-package))
