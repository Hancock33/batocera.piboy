################################################################################
#
# sf_rpi_status
#
################################################################################
# Version: Commits on Jun 27, 2024
SF_RPI_STATUS_VERSION = 35e6566414f00f2e18a19430d898aed4a8e97357
SF_RPI_STATUS_SITE = $(call github,sunfounder,sf_rpi_status,$(SF_RPI_STATUS_VERSION))
SF_RPI_STATUS_SETUP_TYPE = setuptools
SF_RPI_STATUS_LICENSE = GPL-2.0
SF_RPI_STATUS_LICENSE_FILES = LICENSE

SF_RPI_STATUS_DEPENDENCIES = python-requests python-psutil

$(eval $(python-package))
