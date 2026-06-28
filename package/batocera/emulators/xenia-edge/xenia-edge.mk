################################################################################
#
# xenia-edge
#
################################################################################
# Version: Commits on Jun 28, 2026
XENIA_EDGE_VERSION = d2724c303313dcdac779971e4f3d2a15089d919b
XENIA_EDGE_SITE = https://github.com/has207/xenia-edge.git
XENIA_EDGE_SITE_METHOD = git
XENIA_EDGE_GIT_SUBMODULES = YES
XENIA_EDGE_LICENSE = BSD
XENIA_EDGE_LICENSE_FILE = LICENSE
XENIA_EDGE_EMULATOR_INFO = xenia-edge.emulator.yml
XENIA_EDGE_DEPENDENCIES += alsa-lib ffmpeg fmt glslang libcurl
XENIA_EDGE_DEPENDENCIES += libgtk3 lz4 python-toml sdl3 vulkan-headers vulkan-loader
XENIA_EDGE_DEPENDENCIES += host-clang host-glslang host-ninja host-shader-slang

XENIA_EDGE_CONF_ENV += SLANGC_PATH=$(HOST_DIR)/bin/slangc
XENIA_EDGE_CFLAGS = $(TARGET_CFLAGS) -Wno-implicit-function-declaration -Wno-incompatible-pointer-types -Wno-int-conversion
XENIA_EDGE_CONF_OPTS += -DCMAKE_C_FLAGS="$(XENIA_EDGE_CFLAGS)"
XENIA_EDGE_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(XENIA_EDGE_CFLAGS)"
XENIA_EDGE_CONF_OPTS += -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=OFF
XENIA_EDGE_CONF_OPTS += -DXENIA_BUILD_TESTS=OFF
XENIA_EDGE_CONF_OPTS += -DXENIA_BUILD_MISC=OFF
XENIA_EDGE_CONF_OPTS += -DXENIA_USE_SYSTEM_SDL3=ON
XENIA_EDGE_CONF_OPTS += -DXENIA_HOST_SHADER_CC=$(@D)/host_tools/xenia-shader-cc

# xenia-shader-cc is a build-time host tool (GLSL/XeSL -> SPIR-V -> embedded
# .h). We cross-compile x86_64 on an aarch64 host, so letting the project's
# CMake build it with the target toolchain produces an x86_64 binary that
# can't run during the build (and needlessly recompiles glslang/SPIRV-Tools).
# Instead, compile it natively for the build machine against buildroot's
# host-glslang / host-spirv-tools and import it (003-import-prebuilt-host-shader-cc.patch).
define XENIA_EDGE_BUILD_HOST_SHADER_CC
	mkdir -p $(@D)/host_tools
	$(HOSTCXX) -O2 -std=c++17 \
		-I$(HOST_DIR)/include \
		-I$(HOST_DIR)/include/glslang \
		-I$(@D)/third_party/glslang/StandAlone \
		$(@D)/tools/build/shader_cc.cc \
		-o $(@D)/host_tools/xenia-shader-cc \
		-L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib \
		-Wl,--no-as-needed \
		-lSPIRV -lglslang-default-resource-limits -lglslang \
		-lSPIRV-Tools-opt -lSPIRV-Tools -lpthread
endef

XENIA_EDGE_PRE_CONFIGURE_HOOKS += XENIA_EDGE_BUILD_HOST_SHADER_CC

define XENIA_EDGE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/xenia-edge
	$(INSTALL) -m 0755 -D $(@D)/bin/Linux/xenia_edge $(TARGET_DIR)/usr/bin/xenia-edge/xenia_edge
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
