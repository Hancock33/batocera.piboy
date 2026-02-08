################################################################################
#
# sf_rpi_status
#
################################################################################
# Version: Commits on Feb 06, 2026
SF_RPI_STATUS_VERSION = 06990abf5e72589257c74fe450012e02c253f59f
SF_RPI_STATUS_SITE = $(call github,sunfounder,sf_rpi_status,$(SF_RPI_STATUS_VERSION))
SF_RPI_STATUS_SETUP_TYPE = setuptools
SF_RPI_STATUS_LICENSE = GPL-2.0
SF_RPI_STATUS_LICENSE_FILES = LICENSE

SF_RPI_STATUS_DEPENDENCIES = python-requests python-psutil

$(eval $(python-package))
