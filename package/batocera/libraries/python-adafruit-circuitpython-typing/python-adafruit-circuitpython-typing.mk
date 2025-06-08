################################################################################
#
# python-adafruit-circuitpython-typing
#
################################################################################
# Version: Commits on May 30, 2025
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_VERSION = 1.12.1
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_SOURCE = adafruit_circuitpython_typing-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_SITE = https://files.pythonhosted.org/packages/77/d6/cb9a842dd89afcc53d21327cef5d3ee0149cfd3d90677c9dd68274b0bfae
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_DEPENDENCIES += host-python-setuptools-scm

$(eval $(python-package))
