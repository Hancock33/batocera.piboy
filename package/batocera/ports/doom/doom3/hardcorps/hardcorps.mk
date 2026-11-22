################################################################################
#
# hardcorps
#
################################################################################
# Version: Commits on Jun 07, 2026
HARDCORPS_VERSION = b767e8cf42428e9aa32817cc4456f5bfe8ed8262
HARDCORPS_SITE = $(call github,dhewm,dhewm3-sdk,$(HARDCORPS_VERSION))
HARDCORPS_BRANCH = hardcorps
HARDCORPS_LICENSE = GPL-3.0
HARDCORPS_LICENSE_FILES = COPYING.txt

HARDCORPS_DEPENDENCIES = dhewm3

define HARDCORPS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/lib/dhewm3 $(@D)/hardcorps*.so
endef

$(eval $(cmake-package))
