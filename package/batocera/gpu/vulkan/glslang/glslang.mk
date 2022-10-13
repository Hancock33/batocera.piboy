################################################################################
#
# glslang
#
################################################################################
# Version: Commits on Oct 12, 2022
GLSLANG_VERSION = ef6c9714a80bb6013d8b190f2d9b3430976c2dcf

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
