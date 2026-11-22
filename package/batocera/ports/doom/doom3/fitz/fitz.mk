################################################################################
#
# fitz
#
################################################################################
# Version: Commits on Jun 07, 2026
FITZ_VERSION = 81ca7a947a3a4996094be25a3be2f3a25a62c34b
FITZ_SITE = $(call github,dhewm,dhewm3-sdk,$(FITZ_VERSION))
FITZ_BRANCH = fitz
FITZ_LICENSE = GPL-3.0
FITZ_LICENSE_FILES = COPYING.txt

FITZ_DEPENDENCIES = dhewm3

define FITZ_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/lib/dhewm3 $(@D)/fitz*.so
endef

$(eval $(cmake-package))
