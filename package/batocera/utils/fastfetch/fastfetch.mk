################################################################################
#
# fastfetch
#
################################################################################
# Version: Commits on Jun 28, 2026
FASTFETCH_VERSION = 2.65.2
FASTFETCH_SITE = $(call github,fastfetch-cli,fastfetch,$(FASTFETCH_VERSION))
FASTFETCH_LICENSE = MIT

$(eval $(cmake-package))
