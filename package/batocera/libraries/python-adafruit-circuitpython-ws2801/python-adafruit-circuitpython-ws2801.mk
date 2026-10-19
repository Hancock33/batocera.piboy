################################################################################
#
# python-adafruit-circuitpython-ws2801
#
################################################################################
# Version: Commits on Apr 23, 2026
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_VERSION = 1.0.6
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_SOURCE = adafruit_circuitpython_ws2801-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_SITE = https://files.pythonhosted.org/packages/cb/ab/80cbbac94c6eca8cfd3603da8550ca09f248762d4e25a6c0adfdee5079f2
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_DEPENDENCIES += host-python-setuptools-scm

$(eval $(python-package))
