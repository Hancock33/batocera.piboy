################################################################################
#
# cdoom
#
################################################################################
# Version: Commits on Jun 07, 2026
CDOOM_VERSION = 60f24e4fe4bf758fe92010654f633572fcbcec9d
CDOOM_SITE = $(call github,dhewm,dhewm3-sdk,$(CDOOM_VERSION))
CDOOM_BRANCH = cdoom
CDOOM_LICENSE = GPL-3.0
CDOOM_LICENSE_FILES = COPYING.txt

CDOOM_DEPENDENCIES = dhewm3

define CDOOM_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/lib/dhewm3 $(@D)/cdoom*.so
endef

$(eval $(cmake-package))
