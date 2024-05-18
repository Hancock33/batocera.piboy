################################################################################
#
# xenia
#
################################################################################
# Version: Commits on May 18, 2024
XENIA_VERSION = v1.0.2816-master
XENIA_SOURCE = xenia_master.zip
XENIA_SITE = https://github.com/xenia-project/release-builds-windows/releases/download/$(XENIA_VERSION)
XENIA_LICENSE = BSD
XENIA_LICENSE_FILE = LICENSE

XENIA_DEPENDENCIES = python-toml

define XENIA_EXTRACT_CMDS
	mkdir -p $(@D) && cd $(@D) && $(UNZIP) -d $(@D) \
	    $(DL_DIR)/$(XENIA_DL_SUBDIR)/$(XENIA_SOURCE)
endef

define XENIA_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/xenia
	cp -avr $(@D)/xenia.exe $(TARGET_DIR)/usr/bin/xenia
endef

define XENIA_POST_PROCESS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/xenia/xbox360.xenia.keys $(TARGET_DIR)/usr/share/evmapy
endef

XENIA_POST_INSTALL_TARGET_HOOKS += XENIA_POST_PROCESS

# When rebuilding, if an existing version is cached a new version will not be downloaded as the filenames is the same.
# Delete existing version before building
define XENIA_REMOVE_SOURCE
	rm -rf $(DL_DIR)/$(XENIA_DL_SUBDIR)/$(XENIA_SOURCE)
endef
XENIA_PRE_DOWNLOAD_HOOKS += XENIA_REMOVE_SOURCE

$(eval $(generic-package))
