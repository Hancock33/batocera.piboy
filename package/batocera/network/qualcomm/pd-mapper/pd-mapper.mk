################################################################################
#
# pd-mapper
#
################################################################################
# Version: Commits on Dec 30, 2025
PD_MAPPER_VERSION = 5ecd2fe926aca7abfe40724177f63b942cff3947
PD_MAPPER_SITE = $(call github,linux-msm,pd-mapper,$(PD_MAPPER_VERSION))
PD_MAPPER_LICENSE_FILE = LICENSE
PD_MAPPER_DEPENDENCIES = host-qrtr qrtr

define PD_MAPPER_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
		LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib -lqrtr" -C $(@D)
endef

define PD_MAPPER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/pd-mapper $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
