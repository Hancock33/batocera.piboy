################################################################################
#
# box86
#
################################################################################
# Version: Commits on Jan 07, 2026
BOX86_VERSION = 0579f8b9c47d87d700724f4cce559b06cbd2b0f5
BOX86_SITE = $(call github,ptitseb,box86,$(BOX86_VERSION))
BOX86_SUPPORTS_IN_SOURCE_BUILD = NO
BOX86_LICENSE = MIT
BOX86_LICENSE_FILES = LICENSE
BOX86_DEPENDENCIES = bzip2 freetype host-python3 libpng libzip openal sdl2 sdl2_image zlib

BOX86_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_OPTIMIZATION)"
BOX86_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_OPTIMIZATION)"
BOX86_CONF_OPTS += -DNOGIT=1
BOX86_CONF_OPTS += -DSAVE_MEM=ON
BOX86_CONF_OPTS += -DWITH_MOLD=ON

ifeq ($(BR2_aarch64),y)
    BOX86_CONF_OPTS += -DARM_DYNAREC=ON
else ifeq ($(BR2_RISCV_64),y)
    BOX86_CONF_OPTS += -DRV64_DYNAREC=ON
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    BOX86_CONF_OPTS += -DRPI3ARM64=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    BOX86_CONF_OPTS += -DRPI4ARM64=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    BOX86_CONF_OPTS += -DRPI5ARM64=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3326),y)
    BOX86_CONF_OPTS += -DRK3326=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3399),y)
    BOX86_CONF_OPTS += -DRK3399=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3588),y)
    BOX86_CONF_OPTS += -DRK3588=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S922X)$(BR2_PACKAGE_BATOCERA_TARGET_A3GEN2),y)
    BOX86_CONF_OPTS += -DODROIDN2=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_ODIN),y)
    BOX86_CONF_OPTS += -DSD845=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_SM8250),y)
    BOX86_CONF_OPTS += -DSD865=1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_SM8550),y)
    BOX86_CONF_OPTS += -DSD8G2=1
else
    # fallback to generic devices
    ifeq ($(BR2_aarch64),y)
        BOX86_CONF_OPTS += -DARM64=1
    else ifeq ($(BR2_RISCV_64),y)
        BOX86_CONF_OPTS += -DRV64=1
    endif
endif

BOX86_BIN_ARCH_EXCLUDE = \
	/usr/bin \
	/usr/lib/box86-i386-linux-gnu

$(eval $(cmake-package))
