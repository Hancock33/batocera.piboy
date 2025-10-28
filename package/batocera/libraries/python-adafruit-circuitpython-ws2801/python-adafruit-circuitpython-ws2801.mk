################################################################################
#
# python-adafruit-circuitpython-ws2801
#
################################################################################
# Version: Commits on Oct 20, 2025
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_VERSION = 1.0.4
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_SOURCE = adafruit_circuitpython_ws2801-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_SITE = https://files.pythonhosted.org/packages/88/4e/b711402fcf6113b276f0b2407769c05b9d32b984fc67de9f7064221a5f64
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_DEPENDENCIES += host-python-setuptools-scm

$(eval $(python-package))
