################################################################################
#
# vulkan-samples
#
################################################################################
# Version: Commits on Jul 16, 2024
VULKAN_SAMPLES_VERSION = b11511238ca70d6a4fa56e3ac8a1645b6e7094dc
VULKAN_SAMPLES_SITE =  https://github.com/KhronosGroup/Vulkan-Samples
VULKAN_SAMPLES_GIT_SUBMODULES=YES
VULKAN_SAMPLES_SITE_METHOD=git
VULKAN_SAMPLES_DEPENDENCIES = vulkan-headers vulkan-loader
VULKAN_SAMPLES_INSTALL_STAGING = YES
VULKAN_SAMPLES_SUPPORTS_IN_SOURCE_BUILD = NO

VULKAN_SAMPLES_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
VULKAN_SAMPLES_CONF_ENV += LDFLAGS="--lpthread -ldl"

ifeq ($(BR2_x86_64),y)
VULKAN_SAMPLES_CONF_OPTS += -DVKB_WSI_SELECTION=XCB -DGLFW_BUILD_X11=ON
else ifeq ($(BR2_PACKAGE_WAYLAND),y)
VULKAN_SAMPLES_CONF_OPTS += -DVKB_WSI_SELECTION=WAYLAND -DGLFW_BUILD_X11=OFF
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
