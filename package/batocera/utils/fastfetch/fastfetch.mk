################################################################################
#
# fastfetch
#
################################################################################
# Version: Commits on Sept 25, 2026
FASTFETCH_VERSION = 2.69.0
FASTFETCH_SITE = $(call github,fastfetch-cli,fastfetch,$(FASTFETCH_VERSION))
FASTFETCH_LICENSE = MIT

$(eval $(cmake-package))
