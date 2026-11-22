################################################################################
#
# batocera-drminfo
#
################################################################################
# Version: Commits on May 27, 2020
BATOCERA_DRMINFO_VERSION = 1
BATOCERA_DRMINFO_SOURCE =
BATOCERA_DRMINFO_LICENSE = GPL-3.0+
BATOCERA_DRMINFO_DEPENDENCIES = libdrm

# too old kernel
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3128),y)
BATOCERA_DRMINFO_FLAGS = -DHAVE_NOT_DRM_MODE_CONNECTOR_DPI
endif
# this resolution seems to cause issues on the rpi4 (dmanlfc)
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
BATOCERA_DRMINFO_MAIN = batocera-drminfo-no-1360x768.c
else
BATOCERA_DRMINFO_MAIN = batocera-drminfo.c
endif
define BATOCERA_DRMINFO_BUILD_CMDS
	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) $(BATOCERA_DRMINFO_FLAGS) -I$(STAGING_DIR)/usr/include/drm $(BATOCERA_DRMINFO_PKGDIR)/$(BATOCERA_DRMINFO_MAIN) -o $(@D)/batocera-drminfo -ldrm
endef

define BATOCERA_DRMINFO_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/batocera-drminfo $(TARGET_DIR)/usr/bin/batocera-drminfo
endef

$(eval $(generic-package))
