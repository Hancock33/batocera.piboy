################################################################################
#
# sf_rpi_status
#
################################################################################
# Version: Commits on Dec 18, 2025
SF_RPI_STATUS_VERSION = ae8cfa71f1fa1031958b4717dc475e012a79cba1
SF_RPI_STATUS_SITE = $(call github,sunfounder,sf_rpi_status,$(SF_RPI_STATUS_VERSION))
SF_RPI_STATUS_SETUP_TYPE = setuptools
SF_RPI_STATUS_LICENSE = GPL-2.0
SF_RPI_STATUS_LICENSE_FILES = LICENSE

SF_RPI_STATUS_DEPENDENCIES = python-requests python-psutil

$(eval $(python-package))
