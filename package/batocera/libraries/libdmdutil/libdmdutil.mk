################################################################################
#
# libdmdutil
#
################################################################################
# Version: Commits on Jan 22, 2024
LIBDMDUTIL_VERSION = 3bc4ee060dc94ce34c23d0c763d58323348c4487
LIBDMDUTIL_SITE = $(call github,vpinball,libdmdutil,$(LIBDMDUTIL_VERSION))
LIBDMDUTIL_LICENSE = BSD-3-Clause
LIBDMDUTIL_LICENSE_FILES = LICENSE
LIBDMDUTIL_DEPENDENCIES = libserialport libzedmd libserum
LIBDMDUTIL_SUPPORTS_IN_SOURCE_BUILD = NO

LIBDMDUTIL_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
LIBDMDUTIL_CONF_OPTS += -DBUILD_STATIC=OFF
LIBDMDUTIL_CONF_OPTS += -DPLATFORM=linux
LIBDMDUTIL_CONF_OPTS += -DARCH=$(DMDUTIL_ARCH)

# handle supported target platforms
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3588),y)
	DMDUTIL_ARCH = aarch64
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711)$(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
	DMDUTIL_ARCH = aarch64
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
	DMDUTIL_ARCH = x64
endif

define LIBDMDUTIL_CMAKE_HACKS
	## derived from platforms/${PLATFORM}/${DMDUTIL_ARCH}/external.sh and CMakeLists.txt ##
	$(SED) 's:third-party/include$$:$(STAGING_DIR)/usr/include/\n	third-party/include:g'						$(@D)/CMakeLists.txt
	$(SED) 's:$${CMAKE_SOURCE_DIR}/third-party/runtime-libs/$${PLATFORM}/$${ARCH}/:$(STAGING_DIR)/usr/lib/:g'	$(@D)/CMakeLists.txt
	$(SED) 's:third-party/runtime-libs/$${PLATFORM}/$${ARCH}:$(STAGING_DIR)/usr/lib/:g'							$(@D)/CMakeLists.txt
endef

# Install to staging to build Visual Pinball Standalone
LIBDMDUTIL_INSTALL_STAGING = YES

LIBDMDUTIL_PRE_CONFIGURE_HOOKS += LIBDMDUTIL_CMAKE_HACKS

$(eval $(cmake-package))
