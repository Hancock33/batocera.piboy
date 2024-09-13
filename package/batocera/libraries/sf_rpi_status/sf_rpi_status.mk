################################################################################
#
# sf_rpi_status
#
################################################################################
# Version: Commits on Sept 13, 2024
SF_RPI_STATUS_VERSION = cae0ed28012c72bb0927d42280f07acae77cad48
SF_RPI_STATUS_SITE = $(call github,sunfounder,sf_rpi_status,$(SF_RPI_STATUS_VERSION))
SF_RPI_STATUS_SETUP_TYPE = setuptools
SF_RPI_STATUS_LICENSE = GPL-2.0
SF_RPI_STATUS_LICENSE_FILES = LICENSE

SF_RPI_STATUS_DEPENDENCIES = python-requests python-psutil

$(eval $(python-package))
