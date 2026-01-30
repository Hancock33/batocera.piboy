################################################################################
#
# yquake2
#
################################################################################
# Version: Commits on Jan 29, 2026
YQUAKE2_VERSION = a6963f4ecc45002f1a15c1893ca6b97ae94815ab
YQUAKE2_SITE = $(call github,yquake2,yquake2remaster,$(YQUAKE2_VERSION))
YQUAKE2_LICENSE = GPLv2
YQUAKE2_LICENSE_FILES = LICENSE

ifeq ($(BR2_PACKAGE_SDL3),y)
    YQUAKE2_DEPENDENCIES += sdl3
else
    YQUAKE2_DEPENDENCIES += sdl2
    YQUAKE2_CONF_OPTS += -DSDL3_SUPPORT=OFF
endif

ifeq ($(BR2_PACKAGE_OPENAL),y)
    YQUAKE2_DEPENDENCIES += openal
else
    YQUAKE2_CONF_OPTS += -DOPENAL_SUPPORT=OFF
endif

ifeq ($(BR2_PACKAGE_LIBCURL),y)
    YQUAKE2_DEPENDENCIES += libcurl
else
    YQUAKE2_CONF_OPTS += -DCURL_SUPPORT=OFF
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
    YQUAKE2_CONF_OPTS += -DGLES1_RENDERER=ON
endif
ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
    YQUAKE2_CONF_OPTS += -DGL1_RENDERER=ON -DGL3_RENDERER=ON
endif
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
    YQUAKE2_CONF_OPTS += -DGL4_RENDERER=ON
endif
ifeq ($(BR2_PACKAGE_BATOCERA_GLES3),y)
    YQUAKE2_CONF_OPTS += -DGLES3_RENDERER=ON
endif
ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    YQUAKE2_CONF_OPTS += -DVK_RENDERER=ON
endif

define YQUAKE2_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/yquake2/baseq2
	$(INSTALL) -D $(@D)/release/quake2                 $(TARGET_DIR)/usr/bin/yquake2/
	$(INSTALL) -D -m 0644 $(@D)/release/ref_*.so       $(TARGET_DIR)/usr/bin/yquake2/
	$(INSTALL) -D -m 0644 $(@D)/release/baseq2/game.so $(TARGET_DIR)/usr/bin/yquake2/baseq2/
endef

$(eval $(cmake-package))
