################################################################################
#
# fastfetch
#
################################################################################
# Version: Commits on Jul 10, 2026
FASTFETCH_VERSION = 2.66.0
FASTFETCH_SITE = $(call github,fastfetch-cli,fastfetch,$(FASTFETCH_VERSION))
FASTFETCH_LICENSE = MIT

$(eval $(cmake-package))
