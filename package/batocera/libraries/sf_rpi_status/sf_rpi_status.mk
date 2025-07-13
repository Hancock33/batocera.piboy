################################################################################
#
# sf_rpi_status
#
################################################################################
# Version: Commits on Jul 11, 2025
SF_RPI_STATUS_VERSION = 0cd561532f031ab783f507c0c4f99b040a4b6939
SF_RPI_STATUS_SITE = $(call github,sunfounder,sf_rpi_status,$(SF_RPI_STATUS_VERSION))
SF_RPI_STATUS_SETUP_TYPE = setuptools
SF_RPI_STATUS_LICENSE = GPL-2.0
SF_RPI_STATUS_LICENSE_FILES = LICENSE

SF_RPI_STATUS_DEPENDENCIES = python-requests python-psutil

$(eval $(python-package))
