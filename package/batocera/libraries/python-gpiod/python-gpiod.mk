################################################################################
#
# python-gpiod
#
################################################################################
# Version: Commits on Feb 19, 2025
PYTHON_GPIOD_VERSION = 2.3.0
PYTHON_GPIOD_SOURCE = gpiod-$(PYTHON_GPIOD_VERSION).tar.gz
PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/8f/74/cb43c6e2fe74cf1567160ccbf54db176f72481e5ac58567684a262672c7c
PYTHON_GPIOD_SETUP_TYPE = setuptools

$(eval $(python-package))
