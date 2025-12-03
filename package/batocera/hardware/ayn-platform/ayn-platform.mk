################################################################################
#
# ayn-platform
#
################################################################################
# Version: Commits on Sept 16, 2024
AYN_PLATFORM_VERSION = 9813128ddac097f8e11a92d64b33de7b70154989
AYN_PLATFORM_SITE = $(call github,ShadowBlip,ayn-platform,$(AYN_PLATFORM_VERSION))
AYN_PLATFORM_LICENSE = GPL-3.0
AYN_PLATFORM_LICENSE_FILES = LICENSE

$(eval $(kernel-module))
$(eval $(generic-package))
