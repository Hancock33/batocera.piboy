################################################################################
#
# python-adafruit-circuitpython-ws2801
#
################################################################################

PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_VERSION = 0.10.14
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_SOURCE = adafruit-circuitpython-ws2801-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_SITE = https://files.pythonhosted.org/packages/d5/18/3d3856158bacca66cc37aa57cd0eb2d991b1bc2e607ae1a073cbceee48c9
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_LICENSE_FILES = LICENSE LICENSES/CC-BY-4.0.txt LICENSES/MIT.txt LICENSES/Unlicense.txt

$(eval $(python-package))
