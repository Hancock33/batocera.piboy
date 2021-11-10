################################################################################
#
# FreePatsGM-SF2
#
################################################################################
# Version.: Commits on Feb 19, 2006
FREEPATS_VERSION = 20060219
FREEPATS_SITE =  https://freepats.zenvoid.org
FREEPATS_SOURCE = freepats-$(FREEPATS_VERSION).tar.xz
FREEPATS_LICENSE = LGPLv3

define FREEPATS_EXTRACT_CMDS
    tar -xf $(FREEPATS_DL_DIR)/$(FREEPATS_SOURCE) -C $(@D)
endef

define FREEPATS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/etc/timidity
	cp -pvr $(@D)/freepats/*.cfg $(TARGET_DIR)/etc/timidity
	cp -pvr $(@D)/freepats/*_000 $(TARGET_DIR)/etc/timidity
endef

$(eval $(generic-package))

