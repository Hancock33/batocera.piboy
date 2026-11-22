################################################################################
#
# rclone
#
################################################################################
# Version: Commits on Nov 06, 2026
RCLONE_VERSION = v1.76.0
RCLONE_SITE = $(call github,rclone,rclone,$(RCLONE_VERSION))
RCLONE_LICENSE = MIT
RCLONE_LICENSE_FILES = COPYING

define RCLONE_BUILD_CMDS
	cd $(@D) && $(HOST_GO_TARGET_ENV) CGO_ENABLED=0 $(GO_BIN) build -ldflags="-s -w"
endef

define RCLONE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/rclone $(TARGET_DIR)/usr/bin/rclone
endef

$(eval $(golang-package))
