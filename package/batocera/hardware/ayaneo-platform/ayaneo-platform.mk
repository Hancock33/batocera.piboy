################################################################################
#
# ayaneo-platform
#
################################################################################
# Version: Commits on Feb 09, 2026
AYANEO_PLATFORM_VERSION = eb849d5deabe70fde004f67349fa281af322a499
AYANEO_PLATFORM_SITE = $(call github,ShadowBlip,ayaneo-platform,$(AYANEO_PLATFORM_VERSION))
AYANEO_PLATFORM_LICENSE = GPL-3.0
AYANEO_PLATFORM_LICENSE_FILES = LICENSE

$(eval $(kernel-module))
$(eval $(generic-package))
