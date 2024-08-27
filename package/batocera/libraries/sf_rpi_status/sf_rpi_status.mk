################################################################################
#
# sf_rpi_status
#
################################################################################
# Version: Commits on Aug 27, 2024
SF_RPI_STATUS_VERSION = a3d1f80b773c939de2b5dde9adb7a32cf5529c93
SF_RPI_STATUS_SITE = $(call github,sunfounder,sf_rpi_status,$(SF_RPI_STATUS_VERSION))
SF_RPI_STATUS_SETUP_TYPE = setuptools
SF_RPI_STATUS_LICENSE = GPL-2.0
SF_RPI_STATUS_LICENSE_FILES = LICENSE

SF_RPI_STATUS_DEPENDENCIES = python-requests python-psutil

$(eval $(python-package))
