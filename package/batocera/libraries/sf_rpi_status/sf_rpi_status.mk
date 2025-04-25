################################################################################
#
# sf_rpi_status
#
################################################################################
# Version: Commits on Apr 25, 2025
SF_RPI_STATUS_VERSION = 6fe51538a9082e61a982c085f539f1d31c7c72e3
SF_RPI_STATUS_SITE = $(call github,sunfounder,sf_rpi_status,$(SF_RPI_STATUS_VERSION))
SF_RPI_STATUS_SETUP_TYPE = setuptools
SF_RPI_STATUS_LICENSE = GPL-2.0
SF_RPI_STATUS_LICENSE_FILES = LICENSE

SF_RPI_STATUS_DEPENDENCIES = python-requests python-psutil

$(eval $(python-package))
