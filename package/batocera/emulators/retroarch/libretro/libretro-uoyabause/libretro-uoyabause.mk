################################################################################
#
# libretro-uoyabause
#
################################################################################
# Version: Commits on Feb 13, 2024 (branch@libretro-cmake-rpi4)
LIBRETRO_UOYABAUSE_VERSION = c60e60854ae5bdef3f463a784674e8fe8c7d87f0
LIBRETRO_UOYABAUSE_SITE = $(call github,rob-ack,yabause,$(LIBRETRO_UOYABAUSE_VERSION))
LIBRETRO_UOYABAUSE_LICENSE = GPLv2
LIBRETRO_UOYABAUSE_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_UOYABAUSE_SUBDIR = yabause
LIBRETRO_UOYABAUSE_CMAKE_BACKEND = make

LIBRETRO_UOYABAUSE_CONF_OPTS += -DYAB_PORTS=libretro
LIBRETRO_UOYABAUSE_CONF_OPTS += -DYAB_USE_QT5=False
LIBRETRO_UOYABAUSE_CONF_OPTS += -DSH2_DYNAREC=False
LIBRETRO_UOYABAUSE_CONF_OPTS += -DSH2_TRACE=False
LIBRETRO_UOYABAUSE_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
LIBRETRO_UOYABAUSE_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

define LIBRETRO_UOYABAUSE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/libyabause_libretro.so $(TARGET_DIR)/usr/lib/libretro/uoyabause_libretro.so
endef

LIBRETRO_UOYABAUSE_POST_CONFIGURE_HOOKS = LIBRETRO_UOYABAUSE_BUILD_EXTERNAL

$(eval $(cmake-package))