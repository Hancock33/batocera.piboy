################################################################################
#
# tqftpserv
#
################################################################################
# Version: Commits on May 11, 2026
TQFTPSERV_VERSION = 7259073ad9c0bdff03465c07fb1a59a08b05f5af
TQFTPSERV_SITE = $(call github,linux-msm,tqftpserv,$(TQFTPSERV_VERSION))
TQFTPSERV_LICENSE = BSD-3-Clause license
TQFTPSERV_LICENSE_FILE = LICENSE
TQFTPSERV_DEPENDENCIES = host-qrtr qrtr

define TQFTPSERV_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
		LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib -lqrtr" -C $(@D)
endef

define TQFTPSERV_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/tqftpserv $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
