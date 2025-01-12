################################################################################
#
# sf_rpi_status
#
################################################################################
# Version: Commits on Jan 07, 2025
SF_RPI_STATUS_VERSION = ff3ed1c236979bfd708395e35b110ff9cbe7e385
SF_RPI_STATUS_SITE = $(call github,sunfounder,sf_rpi_status,$(SF_RPI_STATUS_VERSION))
SF_RPI_STATUS_SETUP_TYPE = setuptools
SF_RPI_STATUS_LICENSE = GPL-2.0
SF_RPI_STATUS_LICENSE_FILES = LICENSE

SF_RPI_STATUS_DEPENDENCIES = python-requests python-psutil

$(eval $(python-package))
