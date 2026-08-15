################################################################################
#
# ryzen-smu
#
################################################################################
# Version: Commits on Aug 15, 2026
RYZEN_SMU_VERSION = d2983668300dd2a598e5a7dc40e71ce0678cc270
RYZEN_SMU_SITE = $(call github,amkillam,ryzen_smu,$(RYZEN_SMU_VERSION))
RYZEN_SMU_LICENSE = GPL-2.0
RYZEN_SMU_LICENSE_FILES = LICENSE

$(eval $(kernel-module))
$(eval $(generic-package))
