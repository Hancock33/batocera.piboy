################################################################################
#
# sf_rpi_status
#
################################################################################
# Version: Commits on Oct 29, 2024
SF_RPI_STATUS_VERSION = 39680acbc051c877d4f57f55ec27d4194240f115
SF_RPI_STATUS_SITE = $(call github,sunfounder,sf_rpi_status,$(SF_RPI_STATUS_VERSION))
SF_RPI_STATUS_SETUP_TYPE = setuptools
SF_RPI_STATUS_LICENSE = GPL-2.0
SF_RPI_STATUS_LICENSE_FILES = LICENSE

SF_RPI_STATUS_DEPENDENCIES = python-requests python-psutil

$(eval $(python-package))
