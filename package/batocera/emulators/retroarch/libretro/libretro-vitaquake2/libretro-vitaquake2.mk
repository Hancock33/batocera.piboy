################################################################################
#
# libretro-vitaquake2
#
################################################################################
# Version: Commits on Jun 28, 2024
LIBRETRO_VITAQUAKE2_VERSION = f17824b379b1b43c48b4cffb7b6715758bb6af1c
LIBRETRO_VITAQUAKE2_SITE = $(call github,libretro,vitaquake2,$(LIBRETRO_VITAQUAKE2_VERSION))
LIBRETRO_VITAQUAKE2_LICENSE = GPL-2.0

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
LIBRETRO_VITAQUAKE2_DEPENDENCIES = libglvnd
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_VITAQUAKE2_PLATFORM = rpi4_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_VITAQUAKE2_PLATFORM = rpi5_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_VITAQUAKE2_PLATFORM = rpi3_64
else ifeq ($(BR2_arm)$(BR2_aarch64)$(BR2_riscv),y)
    LIBRETRO_VITAQUAKE2_DEPENDENCIES += libgles
    LIBRETRO_VITAQUAKE2_CONF_OPTS += GLES=1
else
    LIBRETRO_VITAQUAKE2_PLATFORM = $(LIBRETRO_PLATFORM)
endif

# Enable GLES 3.1 when possible
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_H616)$(BR2_PACKAGE_BATOCERA_TARGET_AMLOGIC_GLES3)$(BR2_PACKAGE_BATOCERA_TARGET_ROCKCHIP_GLES3)$(BR2_riscv),y)
    LIBRETRO_VITAQUAKE2_CONF_OPTS += GLES31=1
endif

define LIBRETRO_VITAQUAKE2_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION) -Wno-implicit-function-declaration -Wno-incompatible-pointer-types -Wno-int-conversion|g" $(@D)/Makefile
	# build the mission cores
	$(foreach game,xatrix rogue zaero, \
		$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) clean && \
		$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) \
			-f Makefile basegame=$(game) platform="$(LIBRETRO_VITAQUAKE2_PLATFORM)" $(LIBRETRO_VITAQUAKE2_CONF_OPTS);
	)
	# now build the main core
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) clean && \
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) \
		-f Makefile platform="$(LIBRETRO_VITAQUAKE2_PLATFORM)" $(LIBRETRO_VITAQUAKE2_CONF_OPTS)
endef

define LIBRETRO_VITAQUAKE2_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro/
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/vitaquake2*.so $(TARGET_DIR)/usr/lib/libretro/
endef

$(eval $(generic-package))
