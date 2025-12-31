################################################################################
#
# libretro-vecx
#
################################################################################
# Version: Commits on Apr 12, 2025
LIBRETRO_VECX_VERSION = 841229a6a81a0461d08af6488f252dcec5266c6a
LIBRETRO_VECX_SITE = $(call github,libretro,libretro-vecx,$(LIBRETRO_VECX_VERSION))
LIBRETRO_VECX_LICENSE = GPLv2|LGPLv2.1
LIBRETRO_VECX_DEPENDENCIES = retroarch

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
    LIBRETRO_VECX_DEPENDENCIES += libgl
else
    ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
        LIBRETRO_VECX_DEPENDENCIES += libgles
        LIBRETRO_VECX_MAKE_OPTS += GLES=1
        LIBRETRO_VECX_MAKE_OPTS += GL_LIB=-lGLESv2
    else
        LIBRETRO_VECX_MAKE_OPTS += HAS_GPU=0
    endif
endif

ifeq ($(BR2_PACKAGE_RASPI2PNG),y)
    LIBRETRO_VECX_PLATFORM = rpi
else ifeq ($(BR2_PACKAGE_BATOCERA_RPI_MESA3D),y)
    LIBRETRO_VECX_PLATFORM = rpi-mesa
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_VECX_PLATFORM = unix
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
    LIBRETRO_VECX_PLATFORM = armv
else ifeq ($(BR2_PACKAGE_HAS_LIBMALI),y)
    LIBRETRO_VECX_PLATFORM = unix
else
    LIBRETRO_VECX_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_VECX_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro  platform="$(LIBRETRO_VECX_PLATFORM)" $(LIBRETRO_VECX_MAKE_OPTS) \
		GIT_VERSION="-$(shell echo $(LIBRETRO_VECX_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_VECX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/vecx_libretro.so $(TARGET_DIR)/usr/lib/libretro/vecx_libretro.so
endef

$(eval $(generic-package))
