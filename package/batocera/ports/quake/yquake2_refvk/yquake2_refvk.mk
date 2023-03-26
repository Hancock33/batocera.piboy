################################################################################
#
# yquake2_refvk
#
################################################################################
# Version: Commits on Mar 25, 2023
YQUAKE2_REFVK_VERSION = 192ca4d5fd5727cbf6fd5ca129c1d58990d962ed
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
