################################################################################
#
# evmapy
#
################################################################################
# Version: Commits on Jul 09, 2015
EVMAPY_VERSION = bd65338c236cd30b4f2d7835733ea5d6b108b75d
EVMAPY_SITE = $(call github,kempniu,evmapy,$(EVMAPY_VERSION))
EVMAPY_LICENSE = GPL-2.0
EVMAPY_LICENSE_FILES = LICENSE
EVMAPY_SETUP_TYPE = setuptools

define EVMAPY_INSTALL_SCRIPTS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	$(INSTALL) -D -m 0755 $(EVMAPY_PKGDIR)/batocera-evmapy $(TARGET_DIR)/usr/bin/batocera-evmapy
endef

EVMAPY_POST_INSTALL_TARGET_HOOKS = EVMAPY_INSTALL_SCRIPTS

$(eval $(python-package))
