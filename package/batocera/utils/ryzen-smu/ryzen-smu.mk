################################################################################
#
# ryzen-smu
#
################################################################################
# Version: Commits on Oct 22, 2025
RYZEN_SMU_VERSION = 21c1e2c51832dccfac64981b345745ce0cccf524
RYZEN_SMU_SITE = $(call github,amkillam,ryzen_smu,$(RYZEN_SMU_VERSION))
RYZEN_SMU_LICENSE = GPL-2.0
RYZEN_SMU_LICENSE_FILES = LICENSE

$(eval $(kernel-module))
$(eval $(generic-package))
