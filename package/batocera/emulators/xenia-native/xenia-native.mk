################################################################################
#
# xenia-native
#
################################################################################
# Version: Commits on Mar 05, 2026
XENIA_NATIVE_VERSION = 16d2cc05c5dde6fac4ee3ed11c78cdcc93c75210
XENIA_NATIVE_SITE = https://github.com/xenia-canary/xenia-canary.git
XENIA_NATIVE_LICENSE = BSD
XENIA_NATIVE_LICENSE_FILE = LICENSE
XENIA_NATIVE_SITE_METHOD=git
XENIA_NATIVE_GIT_SUBMODULES=YES
XENIA_NATIVE_SUPPORTS_IN_SOURCE_BUILD = NO

XENIA_NATIVE_DEPENDENCIES = xserver_xorg-server alsa-lib fmt freetype libgtk3 libpng lz4 sdl2 zlib

XENIA_NATIVE_TARGET_CFLAGS = $(TARGET_CFLAGS) -Wno-implicit-function-declaration -Wno-incompatible-pointer-types -Wno-int-conversion
XENIA_NATIVE_CONF_OPTS += -DCMAKE_C_FLAGS="$(XENIA_NATIVE_TARGET_CFLAGS)"
XENIA_NATIVE_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(XENIA_NATIVE_TARGET_CFLAGS)"

define XENIA_NATIVE_CROSS_VERSION
	echo #define XE_BUILD_BRANCH "master" >> $(@D)/build/version.h
	echo #define XE_BUILD_COMMIT "$(XENIA_NATIVE_VERSION)" >> $(@D)/build/version.h
	echo #define XE_BUILD_COMMIT_SHORT "$(shell echo $(XENIA_NATIVE_VERSION) | cut -c 1-7)" >> $(@D)/build/version.h
	echo #define XE_BUILD_DATE __DATE__ >> $(@D)/build/version.h
endef

XENIA_NATIVE_POST_CONFIGURE_HOOKS = XENIA_NATIVE_CROSS_VERSION

define XENIA_NATIVE_INSTALL_TARGET_CMDS
	$(TARGET_STRIP) $(@D)/build/bin/Linux/xenia_canary
	$(INSTALL) -m 0755 -D $(@D)/build/bin/Linux/xenia_canary $(TARGET_DIR)/usr/bin/xenia-native
endef

$(eval $(cmake-package))
