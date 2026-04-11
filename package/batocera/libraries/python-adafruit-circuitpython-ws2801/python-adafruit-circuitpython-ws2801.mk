################################################################################
#
# python-adafruit-circuitpython-ws2801
#
################################################################################
# Version: Commits on Mar 27, 2026
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_VERSION = 1.0.5
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_SOURCE = adafruit_circuitpython_ws2801-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_SITE = https://files.pythonhosted.org/packages/4c/c2/861a532827eb3660bcc0ec035d46e66c3ac961c79fa4689402110fd198d9
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_CIRCUITPYTHON_WS2801_DEPENDENCIES += host-python-setuptools-scm

$(eval $(python-package))
