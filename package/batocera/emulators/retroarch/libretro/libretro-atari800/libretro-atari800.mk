################################################################################
#
# libretro-atari800
#
################################################################################
# Version: Commits on Dec 04, 2025
LIBRETRO_ATARI800_VERSION = 630f2346a1dabefdcf534880a48e3e200e2cc551
LIBRETRO_ATARI800_SITE = $(call github,libretro,libretro-atari800,$(LIBRETRO_ATARI800_VERSION))
LIBRETRO_ATARI800_LICENSE = GPL
LIBRETRO_ATARI800_DEPENDENCIES = retroarch

define LIBRETRO_ATARI800_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(SED) "s|CFLAGS += -DGIT_VERSION|CFLAGS = -DGIT_VERSION|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile \
		GIT_VERSION="-$(shell echo $(LIBRETRO_ATARI800_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_ATARI800_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/atari800_libretro.so $(TARGET_DIR)/usr/lib/libretro/atari800_libretro.so
endef

$(eval $(generic-package))
