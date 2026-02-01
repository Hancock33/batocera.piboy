################################################################################
#
# python-nfcpy
#
################################################################################
# Version: Commits on Mar 10, 2022
PYTHON_NFCPY_VERSION = v1.0.4
PYTHON_NFCPY_SITE = $(call github,nfcpy,nfcpy,$(PYTHON_NFCPY_VERSION))
PYTHON_NFCPY_DEPENDENCIES = libusb libusb-compat
PYTHON_NFCPY_SETUP_TYPE = setuptools
PYTHON_NFCPY_LICENSE = EUPL-1.1+
PYTHON_NFCPY_LICENSE_FILES = LICENSE

$(eval $(python-package))
