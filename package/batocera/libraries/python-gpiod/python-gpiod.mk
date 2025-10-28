################################################################################
#
# python-gpiod
#
################################################################################
# Version: Commits on Oct 24, 2025
PYTHON_GPIOD_VERSION = 2.4.0
PYTHON_GPIOD_SOURCE = gpiod-$(PYTHON_GPIOD_VERSION).tar.gz
PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/0c/dc/5a6bd309345bd9cfa7e098174ab7e65367e408539b6c1998e4f267c673cd
PYTHON_GPIOD_SETUP_TYPE = setuptools

$(eval $(python-package))
