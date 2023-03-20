################################################################################
#
# libretro-zc250x
#
################################################################################
# Version: Commits on Jan 25, 2023
LIBRETRO_ZC250X_VERSION = cfe8da6aa8714f2a77dba81026a5a5560bc70ad6
LIBRETRO_ZC250X_SITE = https://github.com/netux79/zc250x-libretro.git
LIBRETRO_ZC250X_SITE_METHOD=git
LIBRETRO_ZC250X_GIT_SUBMODULES=YES
LIBRETRO_ZC250X_LICENSE = GPLv2
LIBRETRO_ZC250X_DEPENDENCIES = retroarch

define LIBRETRO_ZC250X_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix" \
        GIT_VERSION="-$(shell echo $(LIBRETRO_ZC250X_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_ZC250X_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/zc250x_libretro.so $(TARGET_DIR)/usr/lib/libretro/zc250x_libretro.so
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/zc250x
	cp -avr $(@D)/datfile/* $(TARGET_DIR)/usr/share/batocera/datainit/bios/zc250x
	# install core info file
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	cp -a $(@D)/info/*.info $(TARGET_DIR)/usr/share/libretro/info/
endef

$(eval $(generic-package))
