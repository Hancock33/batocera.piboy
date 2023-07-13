################################################################################
#
# vulkan-samples
#
################################################################################
# Version: Commits on Jul 10, 2023
VULKAN_SAMPLES_VERSION = 1fa4b013a9cd10e57fc6e54958f923eac0e68525
VULKAN_SAMPLES_SITE =  https://github.com/KhronosGroup/Vulkan-Samples
VULKAN_SAMPLES_GIT_SUBMODULES=YES
VULKAN_SAMPLES_SITE_METHOD=git
VULKAN_SAMPLES_DEPENDENCIES = vulkan-headers vulkan-loader host-ninja
VULKAN_SAMPLES_INSTALL_STAGING = YES
VULKAN_SAMPLES_SUPPORTS_IN_SOURCE_BUILD = NO

VULKAN_SAMPLES_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja
VULKAN_SAMPLES_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
VULKAN_SAMPLES_CONF_ENV += LDFLAGS="--lpthread -ldl"

ifeq ($(BR2_x86_64),y)
VULKAN_SAMPLES_CONF_OPTS += -DVKB_WSI_SELECTION=XCB
else
VULKAN_SAMPLES_CONF_OPTS += -DVKB_WSI_SELECTION=WAYLAND
endif

# Terrible temporary workaround for rpi4
VULKAN_SAMPLES_INSTALL_ARCH = $(BR2_ARCH)
ifeq ($(ARCH),arm)
VULKAN_SAMPLES_INSTALL_ARCH = armv8l
endif

ifeq ($(BR2_PACKAGE_MESA3D),y)
VULKAN_SAMPLES_DEPENDENCIES += mesa3d
endif

define VULKAN_SAMPLES_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(VULKAN_SAMPLES_BUILDDIR)
endef

define VULKAN_SAMPLES_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(VULKAN_SAMPLES_BUILDDIR)
endef

define VULKAN_SAMPLES_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/app/bin/Release/$(VULKAN_SAMPLES_INSTALL_ARCH)/vulkan_samples $(TARGET_DIR)/usr/bin/vulkan_samples
endef

$(eval $(cmake-package))
