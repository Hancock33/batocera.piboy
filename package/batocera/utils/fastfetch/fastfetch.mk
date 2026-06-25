################################################################################
#
# fastfetch
#
################################################################################
# Version: Commits on Jun 24, 2026
FASTFETCH_VERSION = 2.65.1
FASTFETCH_SITE = $(call github,fastfetch-cli,fastfetch,$(FASTFETCH_VERSION))
FASTFETCH_LICENSE = MIT

$(eval $(cmake-package))
