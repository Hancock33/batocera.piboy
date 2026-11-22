################################################################################
#
# guncon3
#
################################################################################
# Version: Commits on Mar 22, 2023
GUNCON3_VERSION = 0dfe0feaa2afc37a8a70f6cd0f6c803ee4d89f40
GUNCON3_SITE = $(call github,pcnimdock,guncon3_dkms,$(GUNCON3_VERSION))
GUNCON3_LICENSE = GPL-2.0
GUNCON3_LICENSE_FILES = LICENSE

GUNCON3_MODULE_SUBDIRS = src

define GUNCON3_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 -D $(GUNCON3_PKGDIR)/99-guncon3.rules $(TARGET_DIR)/etc/udev/rules.d/99-guncon3.rules
	$(INSTALL) -m 0755 -D $(GUNCON3_PKGDIR)/guncon3-add $(TARGET_DIR)/usr/bin/guncon3-add
	$(INSTALL) -m 0755 -D $(GUNCON3_PKGDIR)/batocera-guncon3-calibrator $(TARGET_DIR)/usr/bin/batocera-guncon3-calibrator
	$(INSTALL) -m 0755 -D $(GUNCON3_PKGDIR)/batocera-guncon3-calibrator-daemon $(TARGET_DIR)/usr/bin/batocera-guncon3-calibrator-daemon
endef

$(eval $(kernel-module))
$(eval $(generic-package))
