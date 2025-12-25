################################################################################
#
# sf_rpi_status
#
################################################################################
# Version: Commits on Dec 25, 2025
SF_RPI_STATUS_VERSION = da40b056a080cc490c011fcc9f9dc771dbbe7706
SF_RPI_STATUS_SITE = $(call github,sunfounder,sf_rpi_status,$(SF_RPI_STATUS_VERSION))
SF_RPI_STATUS_SETUP_TYPE = setuptools
SF_RPI_STATUS_LICENSE = GPL-2.0
SF_RPI_STATUS_LICENSE_FILES = LICENSE

SF_RPI_STATUS_DEPENDENCIES = python-requests python-psutil

$(eval $(python-package))
