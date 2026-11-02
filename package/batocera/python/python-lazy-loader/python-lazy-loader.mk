################################################################################
#
# python-lazy-loader
#
################################################################################
# Version: Commits on Sept 21, 2026
PYTHON_LAZY_LOADER_VERSION = 0.6
PYTHON_LAZY_LOADER_SOURCE = lazy_loader-$(PYTHON_LAZY_LOADER_VERSION).tar.gz
PYTHON_LAZY_LOADER_SITE = https://files.pythonhosted.org/packages/19/8c/0f2ff2a8b7513e68871a74740c17a504b0488c679b379e6445ebb7bd78dc
PYTHON_LAZY_LOADER_SETUP_TYPE = setuptools
PYTHON_LAZY_LOADER_LICENSE = BSD-3-Clause
PYTHON_LAZY_LOADER_LICENSE_FILES = LICENSE.md
PYTHON_LAZY_LOADER_DEPENDENCIES = python-packaging

$(eval $(python-package))
