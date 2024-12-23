################################################################################
#
# libretro-kronos
#
################################################################################
# Version: Commits on Dec 23, 2024
LIBRETRO_KRONOS_VERSION = c88d79ad23ca7c3a0363b4f8fc1f08287f1bbe99
LIBRETRO_KRONOS_SITE = $(call github,FCare,kronos,$(LIBRETRO_KRONOS_VERSION))
LIBRETRO_KRONOS_LICENSE = BSD-3-Clause

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
LIBRETRO_KRONOS_DEPENDENCIES += libglvnd
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_XU4),y)
    LIBRETRO_KRONOS_PLATFORM = odroid
    LIBRETRO_KRONOS_EXTRA_ARGS += BOARD=ODROID-XU4 FORCE_GLES=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S922X),y)
    LIBRETRO_KRONOS_PLATFORM = odroid-n2
    LIBRETRO_KRONOS_EXTRA_ARGS += FORCE_GLES=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3399),y)
    LIBRETRO_KRONOS_PLATFORM = rockpro64
    LIBRETRO_KRONOS_EXTRA_ARGS += FORCE_GLES=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S905GEN3),y)
    LIBRETRO_KRONOS_PLATFORM = odroid-c4
    LIBRETRO_KRONOS_EXTRA_ARGS += FORCE_GLES=1
else
    LIBRETRO_KRONOS_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_KRONOS_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION) -Wno-implicit-function-declaration|g" $(@D)/yabause/src/libretro/Makefile
	$(MAKE) -C $(@D)/yabause/src/libretro -f Makefile generate-files && \
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C \
		$(@D)/yabause/src/libretro -f Makefile \
		platform="$(LIBRETRO_KRONOS_PLATFORM)" $(LIBRETRO_KRONOS_EXTRA_ARGS)
endef

define LIBRETRO_KRONOS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/yabause/src/libretro/kronos_libretro.so $(TARGET_DIR)/usr/lib/libretro/kronos_libretro.so
endef

$(eval $(generic-package))
