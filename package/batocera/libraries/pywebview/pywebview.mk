################################################################################
#
# pywebview
#
################################################################################
# Version: Commits on Aug 17, 2024
PYWEBVIEW_VERSION = 5.2
PYWEBVIEW_SITE = $(call github,r0x0r,pywebview,$(PYWEBVIEW_VERSION))
PYWEBVIEW_LICENSE = BSD

define PYWEBVIEW_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/python3.11/site-packages/
	cp -pr $(@D)/webview $(TARGET_DIR)/usr/lib/python3.11/site-packages/
endef

$(eval $(generic-package))
