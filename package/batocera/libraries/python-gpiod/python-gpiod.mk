################################################################################
#
# python-gpiod
#
################################################################################
# Version: Commits on Nov 12, 2024
PYTHON_GPIOD_VERSION = 2.2.2
PYTHON_GPIOD_SOURCE = gpiod-$(PYTHON_GPIOD_VERSION).tar.gz
PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/5a/be/9876843be7d8d3e05582de8919077b9084beac5d9791b139653e3048e4fd
PYTHON_GPIOD_SETUP_TYPE = setuptools

$(eval $(python-package))
