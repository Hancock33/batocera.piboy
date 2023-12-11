################################################################################
#
# bauh
#
################################################################################
# Version: Commits on Apr 16, 2022
BAUH_VERSION = 0.10.2
BAUH_SITE =  $(call github,vinifmor,bauh,$(BAUH_VERSION))
BAUH_SETUP_TYPE = setuptools
BAUH_DEPENDENCIES = python-pyqt5 python-pyqt5-sip

define BAUH_KEEP_FLATPAK_ONLY
	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/bauh/gems/{snap,web,arch,appimage}
endef

BAUH_POST_INSTALL_TARGET_HOOKS += BAUH_KEEP_FLATPAK_ONLY

$(eval $(python-package))
