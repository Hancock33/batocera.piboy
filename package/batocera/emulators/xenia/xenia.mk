################################################################################
#
# xenia
#
################################################################################

# Version: Commits on Jan 24, 2022
XENIA_VERSION = cba4ca0e31b8bed3e0f05f176be42948b80c2671
XENIA_SITE = https://github.com/xenia-project/release-builds-windows/releases/download/$(XENIA_VERSION)-master
XENIA_LICENSE = BSD
XENIA_LICENSE_FILE = LICENSE

define XENIA_EXTRACT_CMDS
	mkdir -p $(@D) && cd $(@D) && $(UNZIP) -d $(@D) $(DL_DIR)/$(XENIA_DL_SUBDIR)/$(XENIA_SOURCE)
endef

define XENIA_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr
	cp -pr $(@D) $(TARGET_DIR)/usr/xenia
endef

define XENIA_POST_PROCESS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/xenia/xbox360.xenia.keys $(TARGET_DIR)/usr/share/evmapy
endef

XENIA_POST_INSTALL_TARGET_HOOKS += XENIA_POST_PROCESS

$(eval $(generic-package))
