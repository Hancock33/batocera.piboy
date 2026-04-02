################################################################################
#
# libretro-amiberry
#
################################################################################
# Version: Commits on Apr 02, 2026
LIBRETRO_AMIBERRY_VERSION = a47fd2d81d09925fe7852db5c6dbb0bac8a29876
LIBRETRO_AMIBERRY_SITE = https://github.com/BlitterStudio/amiberry.git
LIBRETRO_AMIBERRY_SITE_METHOD=git
LIBRETRO_AMIBERRY_GIT_SUBMODULES=YES
LIBRETRO_AMIBERRY_LICENSE = GPLv3
LIBRETRO_AMIBERRY_SUPPORTS_IN_SOURCE_BUILD = NO

LIBRETRO_AMIBERRY_DEPENDENCIES += flac libpcap libmpeg2 libpng libserialport libxml2 mpg123
LIBRETRO_AMIBERRY_DEPENDENCIES += portmidi sdl3
LIBRETRO_AMIBERRY_EMULATOR_INFO = amiberry.libretro.core.yml

define LIBRETRO_AMIBERRY_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/libretro -f Makefile platform=unix DEBUG=0
endef

define LIBRETRO_AMIBERRY_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/libretro/amiberry_libretro.so $(TARGET_DIR)/usr/lib/libretro/amiberry_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
