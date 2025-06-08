################################################################################
#
# python-adafruit-circuitpython-requests
#
################################################################################
# Version: Commits on Jun 02, 2025
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_VERSION = 4.1.12
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_SOURCE = adafruit_circuitpython_requests-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/66/93/0d39e35e87159c8c1be45e175ddc3cc2e81805d524d0d612b610e4f01f45
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_LICENSE_FILES = LICENSE
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_DEPENDENCIES += host-python-setuptools-scm
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_DEPENDENCIES += python-adafruit-circuitpython-connectionmanager

$(eval $(python-package))
