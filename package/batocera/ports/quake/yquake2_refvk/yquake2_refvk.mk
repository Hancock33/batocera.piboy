################################################################################
#
# yquake2_refvk
#
################################################################################
# Version: Commits on Jul 28, 2024
YQUAKE2_REFVK_VERSION = b337bb07f88a30605c134d9e634f19fef39309f9
YQUAKE2_REFVK_SITE = $(call github,yquake2,ref_vk,$(YQUAKE2_REFVK_VERSION))

YQUAKE2_REFVK_DEPENDENCIES = yquake2
YQUAKE2_REFVK_LICENSE = GPL-2.0

define YQUAKE2_REFVK_FIXSDL2_PATH
	sed -i "s+/usr+$(STAGING_DIR)/usr+g" $(@D)/Makefile
	sed -i "s+sdl2-config+$(STAGING_DIR)/usr/bin/sdl2-config+g" $(@D)/Makefile
endef
YQUAKE2_REFVK_PRE_CONFIGURE_HOOKS += YQUAKE2_REFVK_FIXSDL2_PATH

define YQUAKE2_REFVK_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" YQ2_ARCH="" \
	$(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
	-C $(@D)/ -f Makefile
endef

define YQUAKE2_REFVK_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/release/ref_vk.so $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
