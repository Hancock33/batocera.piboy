################################################################################
#
# box64
#
################################################################################
# Version: Commits on Mar 26, 2026
BOX64_VERSION = d7c86cadf6e935d24f77c66dc3ba7c1cb32f1d8d
BOX64_SITE = $(call github,ptitseb,box64,$(BOX64_VERSION))
BOX64_SUPPORTS_IN_SOURCE_BUILD = NO
BOX64_LICENSE = MIT
BOX64_LICENSE_FILES = LICENSE
BOX64_DEPENDENCIES = bzip2 freetype host-python3 libpng libzip openal sdl2 sdl2_image zlib

BOX64_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_OPTIMIZATION)"
BOX64_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_OPTIMIZATION)"
BOX64_CONF_OPTS += -DBOX32=ON
BOX64_CONF_OPTS += -DNOGIT=1
BOX64_CONF_OPTS += -DSAVE_MEM=ON
BOX64_CONF_OPTS += -DWITH_MOLD=ON

ifeq ($(BR2_aarch64),y)
    BOX64_CONF_OPTS += -DARM_DYNAREC=ON
else ifeq ($(BR2_RISCV_64),y)
    BOX64_CONF_OPTS += -DRV64_DYNAREC=ON
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    BOX64_CONF_OPTS += -DRPI3ARM64=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    BOX64_CONF_OPTS += -DRPI4ARM64=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    BOX64_CONF_OPTS += -DRPI5ARM64=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3326),y)
    BOX64_CONF_OPTS += -DRK3326=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3399),y)
    BOX64_CONF_OPTS += -DRK3399=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3588),y)
    BOX64_CONF_OPTS += -DRK3588=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S922X)$(BR2_PACKAGE_BATOCERA_TARGET_A3GEN2),y)
    BOX64_CONF_OPTS += -DODROIDN2=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_ODIN),y)
    BOX64_CONF_OPTS += -DSD845=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_SM8250),y)
    BOX64_CONF_OPTS += -DSD865=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_SM8550),y)
    BOX64_CONF_OPTS += -DSD8G2=1
else
    # fallback to generic devices
    ifeq ($(BR2_aarch64),y)
        BOX64_CONF_OPTS += -DARM64=1
    else ifeq ($(BR2_RISCV_64),y)
        BOX64_CONF_OPTS += -DRV64=1
    endif
endif

BOX64_BIN_ARCH_EXCLUDE = \
	/usr/bin \
	/usr/lib/box64-x86_64-linux-gnu \
	/usr/lib/box64-i386-linux-gnu
