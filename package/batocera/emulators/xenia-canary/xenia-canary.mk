################################################################################
#
# xenia-canary
#
################################################################################
# Version: Commits on Aug 15, 2024
XENIA_CANARY_VERSION = 49584ff66494070329f44949303cd6b7d4fa9b93
XENIA_CANARY_SOURCE = xenia_canary.zip
XENIA_CANARY_SITE = https://github.com/xenia-canary/xenia-canary/releases/download/"$(shell echo $(XENIA_CANARY_VERSION) | cut -c 1-7)"
XENIA_CANARY_LICENSE = BSD
XENIA_CANARY_LICENSE_FILE = LICENSE
XENIA_CANARY_DEPENDENCIES = python-toml

define XENIA_CANARY_EXTRACT_CMDS
	mkdir -p $(@D) && cd $(@D) && $(UNZIP) -d $(@D) $(DL_DIR)/$(XENIA_CANARY_DL_SUBDIR)/$(XENIA_CANARY_SOURCE)
endef

define XENIA_CANARY_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/xenia-canary
	cp -avr $(@D)/xenia_canary.exe $(TARGET_DIR)/usr/bin/xenia-canary
endef

define XENIA_CANARY_POST_PROCESS
	# get the latest patches
	mkdir -p $(TARGET_DIR)/usr/bin/xenia-canary/patches
	mkdir -p $(@D)/temp
	( cd $(@D)/temp && $(GIT) init && \
	  $(GIT) remote add origin https://github.com/xenia-canary/game-patches.git && \
	  $(GIT) config core.sparsecheckout true && \
	  echo "patches/*.toml" >> .git/info/sparse-checkout && \
	  $(GIT) pull --depth=1 origin main && \
	  mv -f patches/*.toml $(TARGET_DIR)/usr/bin/xenia-canary/patches \
	)

	# Clean up the temporary directory
	rm -rf $(@D)/temp

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
