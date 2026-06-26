################################################################################
#
# ryzen-smu
#
################################################################################
# Version: Commits on Jun 25, 2026
RYZEN_SMU_VERSION = 1be4fb1cd9d60b5ddefc2a4201a898766a731400
RYZEN_SMU_SITE = $(call github,amkillam,ryzen_smu,$(RYZEN_SMU_VERSION))
RYZEN_SMU_LICENSE = GPL-2.0
RYZEN_SMU_LICENSE_FILES = LICENSE

$(eval $(kernel-module))
$(eval $(generic-package))
