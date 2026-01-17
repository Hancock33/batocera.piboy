################################################################################
#
# glslang
#
################################################################################
# Version: Commits on Jan 07, 2026
GLSLANG_VERSION = b937eae5e2ae1e29efe8f8775feaa434239806d2
GLSLANG_SITE = $(call github,KhronosGroup,glslang,$(GLSLANG_VERSION))
GLSLANG_BRANCH = vulkan-tmp-1.4.338
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
