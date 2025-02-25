################################################################################
#
# python-adafruit-circuitpython-ws2801
#
################################################################################
# Version: Commits on Jan 16, 2025
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_VERSION = 1.0.1
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_SOURCE = adafruit_circuitpython_ws2801-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_SITE = https://files.pythonhosted.org/packages/6b/d3/8e7404de0ac9ead8f36c903338c7b7e3ae5be6945b1229fc34743b10ca50
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_DEPENDENCIES += host-python-setuptools-scm

$(eval $(python-package))
