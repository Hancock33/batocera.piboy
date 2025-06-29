################################################################################
#
# sf_rpi_status
#
################################################################################
# Version: Commits on Jun 25, 2025
SF_RPI_STATUS_VERSION = a9d02133e799bc5b9d4244bc7f931b2379ff63dc
SF_RPI_STATUS_SITE = $(call github,sunfounder,sf_rpi_status,$(SF_RPI_STATUS_VERSION))
SF_RPI_STATUS_SETUP_TYPE = setuptools
SF_RPI_STATUS_LICENSE = GPL-2.0
SF_RPI_STATUS_LICENSE_FILES = LICENSE

SF_RPI_STATUS_DEPENDENCIES = python-requests python-psutil

$(eval $(python-package))
