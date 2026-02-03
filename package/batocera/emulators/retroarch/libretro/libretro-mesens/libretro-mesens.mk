################################################################################
#
# libretro-mesens
#
################################################################################
# Version: Commits on Oct 21, 2024
LIBRETRO_MESENS_VERSION = d4fca31a6004041d99b02199688f84c009c55967
LIBRETRO_MESENS_SITE = $(call github,libretro,Mesen-S,$(LIBRETRO_MESENS_VERSION))
LIBRETRO_MESENS_LICENSE = GPL
LIBRETRO_MESENS_DEPENDENCIES += retroarch
LIBRETRO_MESENS_EMULATOR_INFO = mesen-s.libretro.core.yml

define LIBRETRO_MESENS_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" GIT_VERSION="" -C $(@D)/Libretro -f Makefile
endef

define LIBRETRO_MESENS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/Libretro/mesen-s_libretro.so $(TARGET_DIR)/usr/lib/libretro/mesens_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))