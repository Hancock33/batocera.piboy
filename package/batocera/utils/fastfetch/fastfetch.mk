################################################################################
#
# fastfetch
#
################################################################################
# Version: Commits on Sept 01, 2026
FASTFETCH_VERSION = 2.68.1
FASTFETCH_SITE = $(call github,fastfetch-cli,fastfetch,$(FASTFETCH_VERSION))
FASTFETCH_LICENSE = MIT

$(eval $(cmake-package))
