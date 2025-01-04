################################################################################
#
# python-gpiod
#
################################################################################
# Version: Commits on Dec 20, 2024
PYTHON_GPIOD_VERSION = 2.2.3
PYTHON_GPIOD_SOURCE = gpiod-$(PYTHON_GPIOD_VERSION).tar.gz
PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/17/3f/774043a7328048e506a80425d8c114f8faf445cfc958f7a59dedc0fcaf36
PYTHON_GPIOD_SETUP_TYPE = setuptools

$(eval $(python-package))
