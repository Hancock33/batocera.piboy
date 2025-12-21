################################################################################
#
# sf_rpi_status
#
################################################################################
# Version: Commits on Dec 19, 2025
SF_RPI_STATUS_VERSION = 47cad1136823b8377a85102024027e0d49f9b6df
SF_RPI_STATUS_SITE = $(call github,sunfounder,sf_rpi_status,$(SF_RPI_STATUS_VERSION))
SF_RPI_STATUS_SETUP_TYPE = setuptools
SF_RPI_STATUS_LICENSE = GPL-2.0
SF_RPI_STATUS_LICENSE_FILES = LICENSE

SF_RPI_STATUS_DEPENDENCIES = python-requests python-psutil

$(eval $(python-package))
