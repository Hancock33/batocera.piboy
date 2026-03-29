################################################################################
#
# rclone
#
################################################################################
# Version: Commits on Mar 23, 2026
RCLONE_VERSION = v1.73.3
RCLONE_SITE = $(call github,rclone,rclone,$(RCLONE_VERSION))
RCLONE_LICENSE = GPLv2
RCLONE_DEPENDENCIES =

define RCLONE_BUILD_CMDS
	cd $(@D) && $(HOST_GO_TARGET_ENV) CGO_ENABLED=0 $(GO_BIN) build -ldflags="-s -w"
endef

define RCLONE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin

	$(INSTALL) -D $(@D)/rclone $(TARGET_DIR)/usr/bin/rclone
endef

$(eval $(golang-package))
