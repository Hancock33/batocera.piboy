################################################################################
#
# wsdd
#
################################################################################
# Version: Commits on Jun 01, 2025
WSDD_VERSION = v0.9
WSDD_SITE = $(call github,christgau,wsdd,$(WSDD_VERSION))
WSDD_LICENSE = MIT
WSDD_LICENSE_FILES = LICENSE

define WSDD_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/src/wsdd.py $(TARGET_DIR)/usr/bin/wsdd
	$(INSTALL) -D -m 0755 $(WSDD_PKGDIR)/S93wsdd $(TARGET_DIR)/etc/init.d/S93wsdd
endef

$(eval $(generic-package))
