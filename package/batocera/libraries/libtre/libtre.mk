################################################################################
#
# LIBTRE
#
################################################################################

LIBTRE_VERSION = 0.8.0
LIBTRE_SOURCE = tre-${LIBTRE_VERSION}.tar.bz2
LIBTRE_SITE = https://laurikari.net/tre

LIBTRE_DEPENDENCIES = host-pkgconf

define LIBTRE_INSTALL_TARGET_CMDS
    cp -pvr $(@D)/lib/.libs/libtre.so* $(TARGET_DIR)/usr/lib
    cp -pvr $(@D)/src/agrep $(TARGET_DIR)/usr/bin

    cp -pvr $(@D)/lib/.libs/libtre.so* $(HOST_DIR)/aarch64-buildroot-linux-gnu/sysroot/usr/lib
    mkdir $(HOST_DIR)/aarch64-buildroot-linux-gnu/sysroot/usr/include/tre
    cp -pvr $(@D)/lib/regex.h  $(HOST_DIR)/aarch64-buildroot-linux-gnu/sysroot/usr/include/tre
    cp -pvr $(@D)/lib/tre-config.h  $(HOST_DIR)/aarch64-buildroot-linux-gnu/sysroot/usr/include/tre
    cp -pvr $(@D)/lib/tre.h  $(HOST_DIR)/aarch64-buildroot-linux-gnu/sysroot/usr/include/tre
endef

$(eval $(autotools-package))
