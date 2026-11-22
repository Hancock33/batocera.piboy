################################################################################
#
# amlogic-common-drivers
#
################################################################################
# Version: Commits on Apr 27, 2026
AMLOGIC_COMMON_DRIVERS_VERSION = $(or $(call qstrip,$(BR2_PACKAGE_AMLOGIC_COMMON_DRIVERS_VERSION)),3a11a86a02e759fc57fc79410215f7c0c3a0d8e0)
AMLOGIC_COMMON_DRIVERS_SITE = $(or $(call qstrip,$(BR2_PACKAGE_AMLOGIC_COMMON_DRIVERS_REPOSITORY)),https://github.com/khadas/common_drivers.git)
AMLOGIC_COMMON_DRIVERS_SITE_METHOD = git
AMLOGIC_COMMON_DRIVERS_LICENSE = GPL-2.0

$(eval $(generic-package))
