################################################################################
#
# fastfetch
#
################################################################################
# Version: Commits on Aug 06, 2026
FASTFETCH_VERSION = 2.67.0
FASTFETCH_SITE = $(call github,fastfetch-cli,fastfetch,$(FASTFETCH_VERSION))
FASTFETCH_LICENSE = MIT

$(eval $(cmake-package))
