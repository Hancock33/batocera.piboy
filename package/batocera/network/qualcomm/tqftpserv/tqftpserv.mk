################################################################################
#
# tqftpserv
#
################################################################################
# Version: Commits on Jul 06, 2025
TQFTPSERV_VERSION = b0f786c1a736e3fcc2664db76f494c9d35cc44ec
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
