################################################################################
#
# amlogic-common-drivers
#
################################################################################
# Version: Commits on Apr 27, 2026
AMLOGIC_COMMON_DRIVERS_VERSION = 3a11a86a02e759fc57fc79410215f7c0c3a0d8e0
AMLOGIC_COMMON_DRIVERS_SITE = $(call github,khadas,common_drivers,$(AMLOGIC_COMMON_DRIVERS_VERSION))
AMLOGIC_COMMON_DRIVERS_SITE_METHOD = git

$(eval $(generic-package))
