################################################################################
#
# libretro-atari800
#
################################################################################
# Version: Commits on Mar 31, 2026
LIBRETRO_ATARI800_VERSION = a9b9c433d8cb6c8e8eb08d14d3e95b430549723a
LIBRETRO_ATARI800_SITE = $(call github,libretro,libretro-atari800,$(LIBRETRO_ATARI800_VERSION))
LIBRETRO_ATARI800_LICENSE = GPL
LIBRETRO_ATARI800_DEPENDENCIES += retroarch
LIBRETRO_ATARI800_EMULATOR_INFO = atari800.libretro.core.yml

define LIBRETRO_ATARI800_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(SED) "s|CFLAGS += -DGIT_VERSION|CFLAGS = -DGIT_VERSION|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile \
		GIT_VERSION="-$(shell echo $(LIBRETRO_ATARI800_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_ATARI800_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/atari800_libretro.so $(TARGET_DIR)/usr/lib/libretro/atari800_libretro.so
	$(INSTALL) -D $(@D)/atari800_libretro.info $(TARGET_DIR)/usr/share/libretro/info/atari800_libretro.info
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
