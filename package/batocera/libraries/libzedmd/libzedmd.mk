################################################################################
#
# libzedmd
#
################################################################################
# Version: Commits on Jan 25, 2024
LIBZEDMD_VERSION = 44a8f03cd2f6c8c358714d871f4c716f447052ec
LIBZEDMD_SITE = $(call github,PPUC,libzedmd,$(LIBZEDMD_VERSION))
LIBZEDMD_LICENSE = GPLv3
LIBZEDMD_LICENSE_FILES = LICENSE
LIBZEDMD_DEPENDENCIES = libserialport
LIBZEDMD_SUPPORTS_IN_SOURCE_BUILD = NO

LIBZEDMD_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
LIBZEDMD_CONF_OPTS += -DBUILD_STATIC=OFF
LIBZEDMD_CONF_OPTS += -DPLATFORM=linux
LIBZEDMD_CONF_OPTS += -DARCH=$(ZEDMD_ARCH)

# handle supported target platforms
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3588),y)
    ZEDMD_ARCH = aarch64
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711)$(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    ZEDMD_ARCH = aarch64
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
    ZEDMD_ARCH = x64
endif

define LIBZEDMD_CMAKE_HACKS
   ## derived from platforms/${PLATFORM}/${ZEDMD_ARCH}/external.sh and CMakeLists.txt ##
   $(SED) 's:third-party/include$$:$(STAGING_DIR)/usr/include/\n   third-party/include:g' $(@D)/CMakeLists.txt
   $(SED) 's:$${CMAKE_SOURCE_DIR}/third-party/runtime-libs/$${PLATFORM}/$${ARCH}/:$(STAGING_DIR)/usr/lib/:g' $(@D)/CMakeLists.txt
   $(SED) 's:third-party/runtime-libs/$${PLATFORM}/$${ARCH}:$(STAGING_DIR)/usr/lib/:g' $(@D)/CMakeLists.txt
endef

# Install to staging to build Visual Pinball Standalone
LIBZEDMD_INSTALL_STAGING = YES

LIBZEDMD_PRE_CONFIGURE_HOOKS += LIBZEDMD_CMAKE_HACKS

$(eval $(cmake-package))
