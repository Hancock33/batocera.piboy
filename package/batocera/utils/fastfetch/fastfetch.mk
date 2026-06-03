################################################################################
#
# fastfetch
#
################################################################################
# Version: Commits on Jun 03, 2026
FASTFETCH_VERSION = 2.64.0
FASTFETCH_SITE = $(call github,fastfetch-cli,fastfetch,$(FASTFETCH_VERSION))
FASTFETCH_LICENSE = MIT

$(eval $(cmake-package))
