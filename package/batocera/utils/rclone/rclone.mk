################################################################################
#
# rclone
#
################################################################################
# Version: Commits on Jul 09, 2025
RCLONE_VERSION = v1.70.3
RCLONE_SITE = $(call github,rclone,rclone,$(RCLONE_VERSION))
RCLONE_LICENSE = GPLv2
RCLONE_DEPENDENCIES =

define RCLONE_BUILD_CMDS
	cd $(@D) && $(HOST_GO_TARGET_ENV) $(GO_BIN) build
endef

define RCLONE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin

	$(INSTALL) -D $(@D)/rclone $(TARGET_DIR)/usr/bin/rclone
endef

$(eval $(golang-package))
