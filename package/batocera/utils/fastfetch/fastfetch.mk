################################################################################
#
# fastfetch
#
################################################################################
# Version: Commits on Oct 14, 2026
FASTFETCH_VERSION = 2.70.0
FASTFETCH_SITE = $(call github,fastfetch-cli,fastfetch,$(FASTFETCH_VERSION))
FASTFETCH_LICENSE = MIT

$(eval $(cmake-package))
