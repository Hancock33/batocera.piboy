################################################################################
#
# ayaneo-platform
#
################################################################################
# Version: Commits on Feb 09, 2026
AYANEO_PLATFORM_VERSION = v0.3.5
AYANEO_PLATFORM_SITE = $(call github,ShadowBlip,ayaneo-platform,$(AYANEO_PLATFORM_VERSION))
AYANEO_PLATFORM_LICENSE = GPL-3.0
AYANEO_PLATFORM_LICENSE_FILES = LICENSE

$(eval $(kernel-module))
$(eval $(generic-package))
