################################################################################
#
# fastfetch
#
################################################################################
# Version: Commits on Oct 09, 2022
FASTFETCH_VERSION = v1.0.1
FASTFETCH_SITE = $(call github,fastfetch-cli,fastfetch,$(FASTFETCH_VERSION))
FASTFETCH_LICENSE = MIT

$(eval $(cmake-package))
