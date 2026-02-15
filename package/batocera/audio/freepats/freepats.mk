################################################################################
#
# freepats
#
################################################################################
# Version: Commits on Oct 27, 2020
FREEPATS_VERSION = v1.0.3
FREEPATS_SITE =  $(call github,feross,freepats,$(FREEPATS_VERSION))
FREEPATS_LICENSE = LGPLv3

define FREEPATS_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/etc/timidity
	mkdir -p $(TARGET_DIR)/etc/timidity
	cp -pvr $(@D)/*.cfg $(TARGET_DIR)/etc/timidity
	cp -pvr $(@D)/*_000 $(TARGET_DIR)/etc/timidity
endef

$(eval $(generic-package))
