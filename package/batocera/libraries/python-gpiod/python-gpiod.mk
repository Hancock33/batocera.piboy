################################################################################
#
# python-gpiod
#
################################################################################
# Version: Commits on Aug 01, 2024
PYTHON_GPIOD_VERSION = 2.2.1
PYTHON_GPIOD_SOURCE = gpiod-$(PYTHON_GPIOD_VERSION).tar.gz
PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/e6/6a/a8120a6c582099ea7fd3b46a7071f0b9dd32808d337dc9e3da05ef046e67
PYTHON_GPIOD_SETUP_TYPE = setuptools
PYTHON_GPIOD_LICENSE_FILES = LICENSE

$(eval $(python-package))
