################################################################################
#
# xenia-canary
#
################################################################################
# Version: Commits on Dec 18, 2022
XENIA_CANARY_VERSION = 8c43160fc6a7ad18f3e5db2596d983aa0f767f1e
XENIA_CANARY_SOURCE = xenia_canary.zip
XENIA_CANARY_SITE = https://github.com/xenia-canary/xenia-canary/releases/download/experimental
XENIA_CANARY_LICENSE = BSD
XENIA_CANARY_LICENSE_FILE = LICENSE

define XENIA_CANARY_EXTRACT_CMDS
	mkdir -p $(@D) && cd $(@D) && $(UNZIP) -d $(@D) $(DL_DIR)/$(XENIA_CANARY_DL_SUBDIR)/$(XENIA_CANARY_SOURCE)
endef

define XENIA_CANARY_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr
	cp -pfr $(@D) $(TARGET_DIR)/usr/xenia-canary
endef

define XENIA_CANARY_POST_PROCESS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/xenia-canary/xbox360.xenia-canary.keys \
	    $(TARGET_DIR)/usr/share/evmapy
endef

XENIA_CANARY_POST_INSTALL_TARGET_HOOKS += XENIA_CANARY_POST_PROCESS

# when rebuilding the archive will not be downloaded if an existing version is cached.
# delete existing version before building
define XENIA_CANARY_REMOVE_SOURCE
	rm -rf $(DL_DIR)/$(XENIA_CANARY_DL_SUBDIR)/$(XENIA_CANARY_SOURCE)
endef
XENIA_CANARY_PRE_DOWNLOAD_HOOKS += XENIA_CANARY_REMOVE_SOURCE

$(eval $(generic-package))
