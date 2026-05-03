################################################################################
#
# xenia-edge
#
################################################################################
# Version: Commits on Apr 30, 2026
XENIA_EDGE_VERSION = 0f2e40c024d59dc088977d0220edd12bac3a3f46
XENIA_EDGE_SITE = https://github.com/has207/xenia-edge.git
XENIA_EDGE_SITE_METHOD = git
XENIA_EDGE_GIT_SUBMODULES = YES
XENIA_EDGE_LICENSE = BSD
XENIA_EDGE_LICENSE_FILE = LICENSE
XENIA_EDGE_EMULATOR_INFO = xenia-edge.emulator.yml
XENIA_EDGE_DEPENDENCIES = alsa-lib lz4 python-toml qt6base qt6declarative sdl2 vulkan-headers vulkan-loader

XENIA_EDGE_CFLAGS = $(TARGET_CFLAGS) -Wno-implicit-function-declaration -Wno-incompatible-pointer-types -Wno-int-conversion
XENIA_EDGE_CONF_OPTS += -DCMAKE_C_FLAGS="$(XENIA_EDGE_CFLAGS)"
XENIA_EDGE_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(XENIA_EDGE_CFLAGS)"
XENIA_EDGE_CONF_OPTS += -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=OFF
XENIA_EDGE_CONF_OPTS += -DXENIA_BUILD_TESTS=OFF
XENIA_EDGE_CONF_OPTS += -DXENIA_BUILD_MISC=OFF
XENIA_EDGE_CONF_OPTS += -DXENIA_ENABLE_LTO=OFF
XENIA_EDGE_CONF_ENV += QT_DIR=$(STAGING_DIR)/usr

define XENIA_EDGE_INSTALL_TARGET_CMDS
	$(TARGET_STRIP) $(@D)/bin/Linux/xenia_edge
	mkdir -p $(TARGET_DIR)/usr/bin/xenia-edge
	$(INSTALL) -m 0755 -D $(@D)/bin/Linux/xenia_edge $(TARGET_DIR)/usr/bin/xenia-edge/xenia_edge
endef

XENIA_EDGE_POST_INSTALL_TARGET_HOOKS += XENIA_EDGE_POST_PROCESS

define XENIA_EDGE_POST_PROCESS
	# get the latest patches
	rm -rf $(TARGET_DIR)/usr/bin/xenia-edge/patches && mkdir -p $(TARGET_DIR)/usr/bin/xenia-edge/patches
	rm -rf $(@D)/temp && mkdir -p $(@D)/temp
	( cd $(@D)/temp && git init && \
	  git remote add origin https://github.com/xenia-canary/game-patches.git && \
	  git config core.sparsecheckout true && \
	  echo "patches/*.toml" >> .git/info/sparse-checkout && \
	  git pull --depth=1 origin main && \
	  mv -f patches/*.toml $(TARGET_DIR)/usr/bin/xenia-edge/patches \
	)

	# Clean up the temporary directory
	rm -rf $(@D)/temp
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
