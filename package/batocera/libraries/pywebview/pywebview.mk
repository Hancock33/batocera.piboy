################################################################################
#
# pywebview
#
################################################################################
# Version: Commits on Oct 22, 2024
PYWEBVIEW_VERSION = 5.3.2
PYWEBVIEW_SITE = $(call github,r0x0r,pywebview,$(PYWEBVIEW_VERSION))
PYWEBVIEW_LICENSE = BSD

PYWEBVIEW_DEPENDENCIES += python-cryptography python-proxy-tools python-bottle
PYWEBVIEW_DEPENDENCIES += python-typing-extensions libgtk3 webkitgtk

define PYWEBVIEW_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/python3.12/site-packages/
	cp -pr $(@D)/webview $(TARGET_DIR)/usr/lib/python3.12/site-packages/
endef

$(eval $(generic-package))
