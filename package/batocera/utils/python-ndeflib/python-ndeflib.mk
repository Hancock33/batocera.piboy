################################################################################
#
# python-ndeflib
#
################################################################################
# Version: Commits on May 27, 2019
PYTHON_NDEFLIB_VERSION = v0.3.3
PYTHON_NDEFLIB_SITE = $(call github,nfcpy,ndeflib,$(PYTHON_NDEFLIB_VERSION))
PYTHON_NDEFLIB_DEPENDENCIES =
PYTHON_NDEFLIB_SETUP_TYPE = setuptools
PYTHON_NDEFLIB_LICENSE = EUPL-1.1+
PYTHON_NDEFLIB_LICENSE_FILES = LICENSE

$(eval $(python-package))
