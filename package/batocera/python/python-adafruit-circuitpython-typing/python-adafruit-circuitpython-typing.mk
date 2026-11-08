################################################################################
#
# python-adafruit-circuitpython-typing
#
################################################################################
# Version: Commits on Oct 20, 2026
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_VERSION = 1.13.0
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_SOURCE = adafruit_circuitpython_typing-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_SITE = https://files.pythonhosted.org/packages/9e/13/b66acdc7439bc8c03650d01d7f5a01f1a73d4a3cbde7e4d9ac8996dcb1b8
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_DEPENDENCIES += host-python-setuptools-scm

$(eval $(python-package))
