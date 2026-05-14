################################################################################
#
# fastfetch
#
################################################################################
# Version: Commits on May 13, 2026
FASTFETCH_VERSION = 2.63.1
FASTFETCH_SITE = $(call github,fastfetch-cli,fastfetch,$(FASTFETCH_VERSION))
FASTFETCH_LICENSE = MIT

$(eval $(cmake-package))
