################################################################################
#
# glslang
#
################################################################################
# Version: Commits on Jan 23, 2026
GLSLANG_VERSION = f0bd0257c308b9a26562c1a30c4748a0219cc951
GLSLANG_SITE = $(call github,KhronosGroup,glslang,$(GLSLANG_VERSION))
GLSLANG_BRANCH = vulkan-sdk-1.4.341
GLSLANG_DEPENDENCIES = vulkan-headers vulkan-loader spirv-tools
GLSLANG_INSTALL_STAGING = YES
GLSLANG_SUPPORTS_IN_SOURCE_BUILD = NO

GLSLANG_CONF_OPTS += -DBUILD_EXTERNAL=OFF
GLSLANG_CONF_OPTS += -DALLOW_EXTERNAL_SPIRV_TOOLS=1
GLSLANG_CONF_OPTS += -DSPIRV-Tools-opt_DIR=$(STAGING_DIR)/usr/lib/cmake/SPIRV-Tools-opt
GLSLANG_CONF_OPTS += -DSPIRV-Tools_DIR=$(STAGING_DIR)/usr/lib/cmake/SPIRV-Tools
GLSLANG_CONF_OPTS += -DGLSLANG_TESTS=OFF
GLSLANG_CONF_OPTS += -DENABLE_GLSLANG_BINARIES=OFF

GLSLANG_CONF_ENV += LDFLAGS="-lpthread -ldl"

HOST_GLSLANG_DEPENDENCIES = host-spirv-tools spirv-tools

HOST_GLSLANG_CONF_OPTS += -DENABLE_OPT=1
HOST_GLSLANG_CONF_OPTS += -DALLOW_EXTERNAL_SPIRV_TOOLS=1
HOST_GLSLANG_CONF_OPTS += -DSPIRV-Tools-opt_DIR=$(HOST_DIR)/lib/cmake/SPIRV-Tools-opt
HOST_GLSLANG_CONF_OPTS += -DSPIRV-Tools_DIR=$(HOST_DIR)/lib/cmake/SPIRV-Tools
HOST_GLSLANG_CONF_OPTS += -DGLSLANG_TESTS=OFF

ifeq ($(BR2_PACKAGE_MESA3D),y)
GLSLANG_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
$(eval $(host-cmake-package))
