################################################################################
#
# xenia-native
#
################################################################################
# Version: Commits on Apr 05, 2026
XENIA_NATIVE_VERSION = 1da37db58496e3d02d5cc8dd2f96c5a8024507ef
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

define XENIA_NATIVE_POST_PROCESS
	# get the latest patches
	mkdir -p $(TARGET_DIR)/usr/bin/xenia-canary/patches
	mkdir -p $(@D)/temp
	( cd $(@D)/temp && git init && \
	  git remote add origin https://github.com/xenia-canary/game-patches.git && \
	  git config core.sparsecheckout true && \
	  echo "patches/*.toml" >> .git/info/sparse-checkout && \
	  git pull --depth=1 origin main && \
	  mv -f patches/*.toml $(TARGET_DIR)/usr/bin/xenia-canary/patches \
	)

	# Clean up the temporary directory
	rm -rf $(@D)/temp
endef

XENIA_NATIVE_POST_INSTALL_TARGET_HOOKS += XENIA_NATIVE_POST_PROCESS

define XENIA_NATIVE_INSTALL_TARGET_CMDS
	$(TARGET_STRIP) $(@D)/build/bin/Linux/xenia_canary
	mkdir -p $(TARGET_DIR)/usr/bin/xenia-canary
	$(INSTALL) -m 0755 -D $(@D)/buildroot-build/Linux/xenia_canary $(TARGET_DIR)/usr/bin/xenia-canary/xenia_canary
endef

$(eval $(cmake-package))
