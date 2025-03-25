################################################################################
#
# vulkan-samples
#
################################################################################
# Version: Commits on Mar 25, 2025
VULKAN_SAMPLES_VERSION = 59202da150e7433c87b44f430e3fd4ccade49fe3
VULKAN_SAMPLES_SITE =  https://github.com/KhronosGroup/Vulkan-Samples
VULKAN_SAMPLES_GIT_SUBMODULES=YES
VULKAN_SAMPLES_SITE_METHOD=git
VULKAN_SAMPLES_DEPENDENCIES = vulkan-headers vulkan-loader
VULKAN_SAMPLES_INSTALL_STAGING = YES
VULKAN_SAMPLES_SUPPORTS_IN_SOURCE_BUILD = NO

VULKAN_SAMPLES_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
VULKAN_SAMPLES_CONF_ENV += LDFLAGS="--lpthread -ldl"

ifeq ($(BR2_PACKAGE_WAYLAND),y)
VULKAN_SAMPLES_CONF_OPTS += -DGLFW_BUILD_X11=OFF
VULKAN_SAMPLES_CONF_OPTS += -DGLFW_BUILD_WAYLAND=ON
VULKAN_SAMPLES_DEPENDENCIES += host-wayland libxkbcommon
else
VULKAN_SAMPLES_CONF_OPTS += -DGLFW_BUILD_X11=ON
VULKAN_SAMPLES_CONF_OPTS += -DGLFW_BUILD_WAYLAND=OFF
VULKAN_SAMPLES_DEPENDENCIES += xlib_libXinerama xlib_libXcursor xlib_libXi
endif

# Terrible temporary workaround for rpi4
VULKAN_SAMPLES_INSTALL_ARCH = $(BR2_ARCH)
ifeq ($(ARCH),arm)
VULKAN_SAMPLES_INSTALL_ARCH = armv8l
endif

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_SAMPLES_DEPENDENCIES += mesa3d
endif

$(eval $(cmake-package))
