################################################################################
#
# qrtr
#
################################################################################
# Version: Commits on Dec 21, 2022
QRTR_VERSION = d0d471c96e7d112fac6f48bd11f9e8ce209c04d2
QRTR_SITE = $(call github,andersson,qrtr,$(QRTR_VERSION))
QRTR_LICENSE = BSD-3-Clause license
QRTR_LICENSE_FILE = LICENSE
QRTR_DEPENDENCIES = linux-headers
HOST_QRTR_DEPENDENCIES = linux-headers

define QRTR_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define QRTR_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/qrtr-ns $(TARGET_DIR)/usr/bin
    $(INSTALL) -D -m 0755 $(@D)/qrtr-cfg $(TARGET_DIR)/usr/bin
    $(INSTALL) -D -m 0755 $(@D)/qrtr-lookup $(TARGET_DIR)/usr/bin
    cp $(@D)/libqrtr.so $(TARGET_DIR)/usr/lib
    ln -sf libqrtr.so $(TARGET_DIR)/usr/lib/libqrtr.so.1
    ln -sf libqrtr.so.1 $(TARGET_DIR)/usr/lib/libqrtr.so.1.0
endef

define HOST_QRTR_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) prefix=$(STAGING_DIR)/usr all
endef

define HOST_QRTR_INSTALL_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) prefix=$(STAGING_DIR)/usr install
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
