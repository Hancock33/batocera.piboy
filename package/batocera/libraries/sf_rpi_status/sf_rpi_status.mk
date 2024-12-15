################################################################################
#
# sf_rpi_status
#
################################################################################
# Version: Commits on Dec 11, 2024
SF_RPI_STATUS_VERSION = 05c445e7ad7317f2587527eec61b5010eee50f8d
SF_RPI_STATUS_SITE = $(call github,sunfounder,sf_rpi_status,$(SF_RPI_STATUS_VERSION))
SF_RPI_STATUS_SETUP_TYPE = setuptools
SF_RPI_STATUS_LICENSE = GPL-2.0
SF_RPI_STATUS_LICENSE_FILES = LICENSE

SF_RPI_STATUS_DEPENDENCIES = python-requests python-psutil

$(eval $(python-package))
