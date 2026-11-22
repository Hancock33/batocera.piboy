################################################################################
#
# perfected
#
################################################################################
# Version: Commits on Jun 07, 2026
PERFECTED_VERSION = 0976ee154cf62d9fb01a5b8456020acf32ff92ac
PERFECTED_SITE = $(call github,dhewm,dhewm3-sdk,$(PERFECTED_VERSION))
PERFECTED_BRANCH = perfected
PERFECTED_LICENSE = GPL-3.0
PERFECTED_LICENSE_FILES = COPYING.txt

PERFECTED_DEPENDENCIES = dhewm3

define PERFECTED_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/lib/dhewm3 $(@D)/perfected*.so
endef

$(eval $(cmake-package))
