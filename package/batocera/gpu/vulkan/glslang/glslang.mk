################################################################################
#
# GLSLANG
#
################################################################################
# Version.: Commits on Jul 28, 2021
GLSLANG_VERSION = d433cccb8acb76514cf5b70a3e1d9247a21288aab5c046e58b216ee27fbdc1e3826a6d26868bfd86refs/remotes/origin/

GLSLANG_SITE =  $(call github,KhronosGroup,glslang,$(GLSLANG_VERSION))
GLSLANG_DEPENDENCIES = vulkan-headers vulkan-loader
GLSLANG_INSTALL_STAGING = YES

GLSLANG_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
GLSLANG_CONF_ENV += LDFLAGS="--lpthread -ldl"

ifeq ($(BR2_PACKAGE_MESA3D),y)
GLSLANG_DEPENDENCIES += mesa3d
endif


$(eval $(cmake-package))
$(eval $(host-cmake-package))
