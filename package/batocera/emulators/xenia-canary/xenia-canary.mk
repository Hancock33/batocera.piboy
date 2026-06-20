################################################################################
#
# xenia-canary
#
################################################################################
# Version: Commits on Jun 19, 2026
XENIA_CANARY_VERSION = e7d0e45095776f7de5312977d2e5b5f3ca5ab2f6
XENIA_CANARY_SOURCE = xenia_canary_windows.zip
XENIA_CANARY_SITE = https://github.com/xenia-canary/xenia-canary/releases/download/"$(shell echo $(XENIA_CANARY_VERSION) | cut -c 1-7)"
XENIA_CANARY_LICENSE = BSD
XENIA_CANARY_LICENSE_FILE = LICENSE
XENIA_CANARY_EMULATOR_INFO = xenia-canary.emulator.yml
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
	( cd $(@D)/temp && git init && \
	  git remote add origin https://github.com/xenia-canary/game-patches.git && \
	  git config core.sparsecheckout true && \
	  echo "patches/*.toml" >> .git/info/sparse-checkout && \
	  git pull --depth=1 origin main && \
	  mv -f patches/*.toml $(TARGET_DIR)/usr/bin/xenia-canary/patches \
	)

	# Clean up the temporary directory
	rm -rf $(@D)/temp
endef

XENIA_CANARY_POST_INSTALL_TARGET_HOOKS += XENIA_CANARY_POST_PROCESS

# If a version is already cached, rebuilding wont fetch a new one because the filename doesnt change.
# Delete the existing cached version before starting the build.
define XENIA_CANARY_REMOVE_SOURCE
	rm -rf $(DL_DIR)/$(XENIA_CANARY_DL_SUBDIR)/$(XENIA_CANARY_SOURCE)
endef
XENIA_CANARY_PRE_DOWNLOAD_HOOKS += XENIA_CANARY_REMOVE_SOURCE

$(eval $(generic-package))
$(eval $(emulator-info-package))
