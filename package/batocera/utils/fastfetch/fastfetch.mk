################################################################################
#
# fastfetch
#
################################################################################
# Version: Commits on Apr 23, 2026
FASTFETCH_VERSION = 2.62.1
FASTFETCH_SITE = $(call github,fastfetch-cli,fastfetch,$(FASTFETCH_VERSION))
FASTFETCH_LICENSE = MIT

$(eval $(cmake-package))
