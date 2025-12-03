################################################################################
#
# ayaneo-platform
#
################################################################################
# Version: Commits on Nov 26, 2025
AYANEO_PLATFORM_VERSION = 9b2a602d1869b2b687c35845ab540012d54a933e
AYANEO_PLATFORM_SITE = $(call github,ShadowBlip,ayaneo-platform,$(AYANEO_PLATFORM_VERSION))
AYANEO_PLATFORM_LICENSE = GPL-3.0
AYANEO_PLATFORM_LICENSE_FILES = LICENSE

$(eval $(kernel-module))
$(eval $(generic-package))
