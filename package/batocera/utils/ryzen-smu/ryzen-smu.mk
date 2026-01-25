################################################################################
#
# ryzen-smu
#
################################################################################
# Version: Commits on Jan 24, 2026
RYZEN_SMU_VERSION = d3bfbe97623a2a26c46c5b88b2053cfa2b08e91a
RYZEN_SMU_SITE = $(call github,amkillam,ryzen_smu,$(RYZEN_SMU_VERSION))
RYZEN_SMU_LICENSE = GPL-2.0
RYZEN_SMU_LICENSE_FILES = LICENSE

$(eval $(kernel-module))
$(eval $(generic-package))
