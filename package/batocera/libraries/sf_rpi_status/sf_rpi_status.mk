################################################################################
#
# sf_rpi_status
#
################################################################################
# Version: Commits on Aug 30, 2024
SF_RPI_STATUS_VERSION = cc35a78908d0bde020535af0095f00020f3a8099
SF_RPI_STATUS_SITE = $(call github,sunfounder,sf_rpi_status,$(SF_RPI_STATUS_VERSION))
SF_RPI_STATUS_SETUP_TYPE = setuptools
SF_RPI_STATUS_LICENSE = GPL-2.0
SF_RPI_STATUS_LICENSE_FILES = LICENSE

SF_RPI_STATUS_DEPENDENCIES = python-requests python-psutil

$(eval $(python-package))
