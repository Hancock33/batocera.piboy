################################################################################
#
# ryzen-smu
#
################################################################################
# Version: Commits on Apr 25, 2026
RYZEN_SMU_VERSION = 0bb95d961664c7a0ac180f849fa16fe7da71922d
RYZEN_SMU_SITE = $(call github,amkillam,ryzen_smu,$(RYZEN_SMU_VERSION))
RYZEN_SMU_LICENSE = GPL-2.0
RYZEN_SMU_LICENSE_FILES = LICENSE

$(eval $(kernel-module))
$(eval $(generic-package))
