################################################################################
#
# applewin
#
################################################################################
# Version: Commits on Apr 04, 2026
APPLEWIN_VERSION = 08625822a65cb876726deb0470b807c3d95808b9
APPLEWIN_SITE = https://github.com/audetto/AppleWin.git
APPLEWIN_SITE_METHOD=git
APPLEWIN_GIT_SUBMODULES=YES
APPLEWIN_LICENSE = GPLv2
APPLEWIN_DEPENDENCIES = host-xxd libpcap sdl2 sdl2_image slirp
APPLEWIN_EMULATOR_INFO = applewin.emulator.yml applewin.libretro.core.yml

APPLEWIN_SUPPORTS_IN_SOURCE_BUILD = NO

APPLEWIN_CONF_OPTS += -DBUILD_SA2=ON
APPLEWIN_CONF_OPTS += -DBUILD_LIBRETRO=ON

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
APPLEWIN_CONF_OPTS += -DSA2_OPENGL=ON
else
APPLEWIN_CONF_OPTS += -DSA2_OPENGL=OFF
endif

define APPLEWIN_INSTALL_TARGET_CMDS
	# libretro core
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/buildroot-build/source/frontends/libretro/applewin_libretro.so $(TARGET_DIR)/usr/lib/libretro/
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	cp -av $(@D)/buildroot-build/source/frontends/libretro/applewin_libretro.info $(TARGET_DIR)/usr/share/libretro/info/
	# standalone core
	cp -avf $(@D)/buildroot-build/sa2 $(TARGET_DIR)/usr/bin/applewin
	mkdir -p $(TARGET_DIR)/usr/share/applewin
	cp -R $(@D)/resource/* $(TARGET_DIR)/usr/share/applewin/
	rm $(TARGET_DIR)/usr/share/applewin/resource.h
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
