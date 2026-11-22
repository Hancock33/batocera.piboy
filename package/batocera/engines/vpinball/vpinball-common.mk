################################################################################
#
# vpinball-common
#
################################################################################
# CMake options shared by vpinball and its vpinball/PPUC dependencies.
# This is not a package: it only defines VPINBALL_COMMON_CONF_OPTS.

VPINBALL_COMMON_CONF_OPTS = -DPLATFORM=linux
VPINBALL_COMMON_CONF_OPTS += -DBUILD_SHARED=ON
VPINBALL_COMMON_CONF_OPTS += -DBUILD_STATIC=OFF
VPINBALL_COMMON_CONF_OPTS += -DPOST_BUILD_COPY_EXT_LIBS=OFF

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
VPINBALL_COMMON_CONF_OPTS += -DARCH=x64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3588_MAINLINE),y)
VPINBALL_COMMON_CONF_OPTS += -DARCH=aarch64 -DBUILD_RK3588=ON
else ifeq ($(BR2_PACKAGE_BATOCERA_BCM27XX),y)
VPINBALL_COMMON_CONF_OPTS += -DARCH=aarch64 -DBUILD_RPI=ON
else ifeq ($(BR2_aarch64),y)
VPINBALL_COMMON_CONF_OPTS += -DARCH=aarch64
endif
