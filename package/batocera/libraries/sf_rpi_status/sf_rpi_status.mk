################################################################################
#
# sf_rpi_status
#
################################################################################
# Version: Commits on Sept 14, 2024
SF_RPI_STATUS_VERSION = cccdf5e1a793638ad290e2d6c355b6a4c0e70863
SF_RPI_STATUS_SITE = $(call github,sunfounder,sf_rpi_status,$(SF_RPI_STATUS_VERSION))
SF_RPI_STATUS_SETUP_TYPE = setuptools
SF_RPI_STATUS_LICENSE = GPL-2.0
SF_RPI_STATUS_LICENSE_FILES = LICENSE

SF_RPI_STATUS_DEPENDENCIES = python-requests python-psutil

$(eval $(python-package))
