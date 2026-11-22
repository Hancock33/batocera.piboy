################################################################################
#
# dentonmod
#
################################################################################
# Version: Commits on Jun 07, 2026
DENTONMOD_VERSION = 9342a53e63e2b281735241f4bff67bcd7612a7b5
DENTONMOD_SITE = $(call github,dhewm,dhewm3-sdk,$(DENTONMOD_VERSION))
DENTONMOD_BRANCH = dentonmod
DENTONMOD_LICENSE = GPL-3.0
DENTONMOD_LICENSE_FILES = COPYING.txt

DENTONMOD_DEPENDENCIES = dhewm3

DENTONMOD_CONF_OPTS = -DBASE_NAME=dentonmod

define DENTONMOD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/lib/dhewm3 $(@D)/dentonmod*.so
endef

$(eval $(cmake-package))
