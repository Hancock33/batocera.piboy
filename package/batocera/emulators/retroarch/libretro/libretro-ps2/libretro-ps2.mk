################################################################################
#
# libretro-ps2
#
################################################################################
# Version: Commits on Sept 20, 2026
LIBRETRO_PS2_VERSION = 669ed5f52d0abd7ea0d260c0ff8edef4d5edc5dd
LIBRETRO_PS2_SITE = https://github.com/libretro/ps2.git
LIBRETRO_PS2_SITE_METHOD = git
LIBRETRO_PS2_GIT_SUBMODULES = YES
LIBRETRO_PS2_LICENSE = GPLv2
LIBRETRO_PS2_DEPENDENCIES = libaio xz host-xxd retroarch
LIBRETRO_PS2_EMULATOR_INFO = pcsx2.libretro.core.yml
LIBRETRO_PS2_SUPPORTS_IN_SOURCE_BUILD = NO

define LIBRETRO_PS2_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix"
endef

define LIBRETRO_PS2_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/pcsx2/resources
	$(INSTALL) -D $(@D)/pcsx2_libretro.so    $(TARGET_DIR)/usr/lib/libretro/pcsx2_libretro.so
	cp -f $(@D)/bin/resources/GameIndex.yaml $(TARGET_DIR)/usr/share/batocera/datainit/bios/pcsx2/resources
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
