################################################################################
#
# python-adafruit-circuitpython-requests
#
################################################################################
# Version: Commits on Oct 20, 2025
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_VERSION = 4.1.14
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_SOURCE = adafruit_circuitpython_requests-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/5e/0c/b61ba2eb109e973c10a08845ad1ea7479d779ad605d8ef70bfeef87a548c
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_LICENSE_FILES = LICENSE
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_DEPENDENCIES += host-python-setuptools-scm
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_DEPENDENCIES += python-adafruit-circuitpython-connectionmanager

$(eval $(python-package))
