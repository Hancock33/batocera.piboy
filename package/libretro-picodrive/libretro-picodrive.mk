################################################################################
#
# libretro-picodrive
#
################################################################################
LIBRETRO_PICODRIVE_VERSION = 4cdacae8ddd5aae15a7b670efffd5688ec97371f
LIBRETRO_PICODRIVE_SITE = $(call github,libretro,picodrive,$(LIBRETRO_PICODRIVE_VERSION))
LIBRETRO_PICODRIVE_DEPENDENCIES = libpng sdl

define LIBRETRO_PICODRIVE_CONFIGURE_CMDS
	rm -rf $(@D)/picodrive
	git -C $(@D) clone https://github.com/libretro/picodrive
	git -C $(@D) checkout $(LIBRETRO_PICODRIVE_VERSION)
	#cp -r $(@D)/../picodrivegithub/.git $(@D)/
	git -C $(@D)/picodrive submodule update --init
	##( cd $(@D)/picodrive && \
        ##CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" CFLAGS="$(TARGET_CFLAGS)" \
	##./configure )
endef


define LIBRETRO_PICODRIVE_BUILD_CMDS
	$(MAKE) -C $(@D)/picodrive/cpu/cyclone CONFIG_FILE=$(@D)/picodrive/cpu/cyclone_config.h	
	CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" -C  $(@D)/picodrive -f Makefile.libretro platform="$(LIBRETRO_PLATFORM) armasm"
endef

define LIBRETRO_PICODRIVE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/picodrive/picodrive_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/picodrive_libretro.so
endef
#LIBRETRO_PICODRIVE_PRE_CONFIGURE_HOOKS +=  LIBRETRO_PICODRIVE_GITHUBHACK
$(eval $(generic-package))
#$(eval $(autotools-package))

