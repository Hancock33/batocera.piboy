################################################################################
#
# xenia-edge
#
################################################################################
# Version: Commits on Nov 21, 2026
XENIA_EDGE_VERSION = 01ca7a5bafe654818940b0d9914a95a8bcd72615
XENIA_EDGE_SITE = https://github.com/has207/xenia-edge.git
XENIA_EDGE_SITE_METHOD = git
XENIA_EDGE_GIT_SUBMODULES = YES
XENIA_EDGE_LICENSE = BSD-3-Clause
XENIA_EDGE_LICENSE_FILES = LICENSE
XENIA_EDGE_EMULATOR_INFO = xenia-edge.emulator.yml

XENIA_EDGE_DEPENDENCIES += host-clang host-lld host-python3
XENIA_EDGE_DEPENDENCIES += expat libcurl libgl libgtk3 lz4 zlib

XENIA_EDGE_CONF_OPTS += -DPython3_EXECUTABLE=$(HOST_DIR)/bin/python3
XENIA_EDGE_CONF_OPTS += -DXENIA_BUILD_MISC=OFF
XENIA_EDGE_CONF_OPTS += -DXENIA_BUILD_TESTS=OFF
XENIA_EDGE_CONF_OPTS += -DXENIA_ENABLE_PROFILER=OFF
XENIA_EDGE_CONF_OPTS += -DXENIA_ENABLE_LTO=ON

XENIA_EDGE_SLANG_VERSION = 2026.8
XENIA_EDGE_SLANG_SOURCE = slang-$(XENIA_EDGE_SLANG_VERSION)-linux-$(HOSTARCH).tar.gz
XENIA_EDGE_EXTRA_DOWNLOADS = https://github.com/shader-slang/slang/releases/download/v$(XENIA_EDGE_SLANG_VERSION)/$(XENIA_EDGE_SLANG_SOURCE)

define XENIA_EDGE_EXTRACT_SLANG
	upstream=$$(sed -n 's/^SLANG_VERSION = "\(.*\)"$$/\1/p' $(@D)/xenia-build.py); \
	if [ "$$upstream" != "$(XENIA_EDGE_SLANG_VERSION)" ]; then \
		echo "xenia-edge wants Slang $$upstream, set XENIA_EDGE_SLANG_VERSION to match"; \
		exit 1; \
	fi
	rm -rf $(@D)/.slang
	mkdir -p $(@D)/.slang/$(XENIA_EDGE_SLANG_VERSION)
	$(TAR) -xzf $(XENIA_EDGE_DL_DIR)/$(XENIA_EDGE_SLANG_SOURCE) \
		-C $(@D)/.slang/$(XENIA_EDGE_SLANG_VERSION)
endef
XENIA_EDGE_POST_EXTRACT_HOOKS += XENIA_EDGE_EXTRACT_SLANG

XENIA_EDGE_CONF_OPTS += -DXE_BUILD_BRANCH=batocera
XENIA_EDGE_CONF_OPTS += -DXE_BUILD_COMMIT=$(XENIA_EDGE_VERSION)

define XENIA_EDGE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/bin/Linux/xenia_edge $(TARGET_DIR)/usr/bin/xenia-edge/xenia_edge
endef

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
XENIA_EDGE_POST_INSTALL_TARGET_HOOKS += XENIA_EDGE_POST_PROCESS

$(eval $(cmake-package))
$(eval $(emulator-info-package))
