################################################################################
#
# xenia-canary
#
################################################################################
# Version: Commits on Apr 02, 2023
XENIA_CANARY_VERSION = 190cef987283e7688a9b6835d0322fe0662cf0a9
XENIA_CANARY_SOURCE = xenia_canary.zip
XENIA_CANARY_SITE = https://github.com/xenia-canary/xenia-canary/releases/download/"$(shell echo $(XENIA_CANARY_VERSION) | cut -c 1-7)"
XENIA_CANARY_LICENSE = BSD
XENIA_CANARY_LICENSE_FILE = LICENSE

XENIA_CANARY_DEPENDENCIES = python-toml

define XENIA_CANARY_EXTRACT_CMDS
	mkdir -p $(@D) && cd $(@D) && $(UNZIP) -d $(@D) $(DL_DIR)/$(XENIA_CANARY_DL_SUBDIR)/$(XENIA_CANARY_SOURCE)
endef

define XENIA_CANARY_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/xenia-canary
	cp -avr $(@D)/xenia_canary.exe $(TARGET_DIR)/usr/xenia-canary
endef

define XENIA_CANARY_POST_PROCESS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/xenia-canary/xbox360.xenia-canary.keys \
	    $(TARGET_DIR)/usr/share/evmapy
endef

XENIA_CANARY_POST_INSTALL_TARGET_HOOKS += XENIA_CANARY_POST_PROCESS

# When rebuilding, if an existing version is cached a new version will not be downloaded as the filenames is the same.
# Delete existing version before building
define XENIA_CANARY_REMOVE_SOURCE
	rm -rf $(DL_DIR)/$(XENIA_CANARY_DL_SUBDIR)/$(XENIA_CANARY_SOURCE)
endef
XENIA_CANARY_PRE_DOWNLOAD_HOOKS += XENIA_CANARY_REMOVE_SOURCE

$(eval $(generic-package))
