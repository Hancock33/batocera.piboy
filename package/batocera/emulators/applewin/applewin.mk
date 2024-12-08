################################################################################
#
# applewin
#
################################################################################
# Version: Commits on Dec 07, 2024
APPLEWIN_VERSION = a9ae3a1d9e49ffcc08ce14953175c0ac5e49c033
APPLEWIN_SITE = https://github.com/audetto/AppleWin
APPLEWIN_SITE_METHOD=git
APPLEWIN_GIT_SUBMODULES=YES
APPLEWIN_LICENSE = GPLv2
APPLEWIN_DEPENDENCIES = sdl2 sdl2_image minizip-zlib slirp libpcap boost

APPLEWIN_SUPPORTS_IN_SOURCE_BUILD = NO

APPLEWIN_CONF_OPTS += -DBUILD_SA2=ON
APPLEWIN_CONF_OPTS += -DBUILD_LIBRETRO=ON

ifeq ($(BR2_PACKAGE_HAS_OPENGL),y)
APPLEWIN_CONF_OPTS += -DSA2_OPENGL=ON
else
APPLEWIN_CONF_OPTS += -DSA2_OPENGL=OFF
endif

define APPLEWIN_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/buildroot-build/source/frontends/libretro/applewin_libretro.so $(TARGET_DIR)/usr/lib/libretro/
	cp -avf $(@D)/buildroot-build/sa2 $(TARGET_DIR)/usr/bin/applewin
	mkdir -p $(TARGET_DIR)/usr/share/applewin
	cp -R $(@D)/resource/* $(TARGET_DIR)/usr/share/applewin/
	rm $(TARGET_DIR)/usr/share/applewin/resource.h
endef

$(eval $(cmake-package))
