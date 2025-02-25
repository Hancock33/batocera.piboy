################################################################################
#
# python-adafruit-circuitpython-requests
#
################################################################################
# Version: Commits on Jan 16, 2025
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_VERSION = 4.1.9
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_SOURCE = adafruit_circuitpython_requests-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/6a/45/070129e6b77f801514cd974524c6b9fd502aa04dd5c2e45ab03e85c96cac
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_DEPENDENCIES += host-python-setuptools-scm
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_DEPENDENCIES += python-adafruit-circuitpython-connectionmanager

$(eval $(python-package))
