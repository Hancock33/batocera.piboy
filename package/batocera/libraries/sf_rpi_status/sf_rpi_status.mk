################################################################################
#
# sf_rpi_status
#
################################################################################
# Version: Commits on Oct 18, 2024
SF_RPI_STATUS_VERSION = c793d92ca0039f29ba1cc8e049ab59bc79b99258
SF_RPI_STATUS_SITE = $(call github,sunfounder,sf_rpi_status,$(SF_RPI_STATUS_VERSION))
SF_RPI_STATUS_SETUP_TYPE = setuptools
SF_RPI_STATUS_LICENSE = GPL-2.0
SF_RPI_STATUS_LICENSE_FILES = LICENSE

SF_RPI_STATUS_DEPENDENCIES = python-requests python-psutil

$(eval $(python-package))
