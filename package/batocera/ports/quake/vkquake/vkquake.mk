################################################################################
#
# Quake 1
#
################################################################################
# Version: Commits on May 24, 2022
VKQUAKE_VERSION = 4c7c2c3a42ec84d32c243c2bb6d4a7ef41f1d9c2
VKQUAKE_SITE = $(call github,Novum,vkQuake,$(VKQUAKE_VERSION))

VKQUAKE_DEPENDENCIES = sdl2 sdl2_image
VKQUAKE_LICENSE = GPLv2

define VKQUAKE_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D)/Quake -f Makefile USE_SDL2=1 DO_USERDIRS=1
endef

define VKQUAKE_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/Quake/VKQUAKE $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
