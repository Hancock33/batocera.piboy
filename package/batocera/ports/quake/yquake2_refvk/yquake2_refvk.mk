################################################################################
#
# Yamagi Quake II - Vulkan plugin
#
################################################################################
# Version: Commits on May 03, 2022
YQUAKE2_REFVK_VERSION = 6b1c62b5129ebc3a00d12296a5764d81430cb6a5
YQUAKE2_REFVK_SITE = $(call github,yquake2,ref_vk,$(YQUAKE2_REFVK_VERSION))

YQUAKE2_REFVK_DEPENDENCIES = yquake2
YQUAKE2_REFVK_LICENSE = GPL-2.0

define YQUAKE2_REFVK_FIXSDL2_PATH
	sed -i "s+/usr+$(STAGING_DIR)/usr+g" $(@D)/Makefile
	sed -i "s+sdl2-config+$(STAGING_DIR)/usr/bin/sdl2-config+g" $(@D)/Makefile
endef
YQUAKE2_REFVK_PRE_CONFIGURE_HOOKS += YQUAKE2_REFVK_FIXSDL2_PATH

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI4),y)
define YQUAKE2_REFVK_FIXCFLAGS_PATH
	sed -i 's/-msse/-mcpu=cortex-a72 -mtune=cortex-a72 -ffast-math/g' $(@D)/Makefile
	sed -i 's/-mfpmath=sse/-mcpu=cortex-a72 -mtune=cortex-a72 -ffast-math/g' $(@D)/Makefile
endef
YQUAKE2_REFVK_PRE_CONFIGURE_HOOKS += YQUAKE2_REFVK_FIXCFLAGS_PATH
endif

define YQUAKE2_REFVK_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile
endef

define YQUAKE2_REFVK_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/release/ref_vk.so $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
