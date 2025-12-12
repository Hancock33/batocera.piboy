################################################################################
#
# python-adafruit-circuitpython-requests
#
################################################################################
# Version: Commits on Nov 03, 2025
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_VERSION = 4.1.15
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_SOURCE = adafruit_circuitpython_requests-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/f5/ae/ec54c3e224a012d620997604fdd6abdbff1b945df3b4aef43d780fd1d5c3
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_LICENSE_FILES = LICENSE
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_DEPENDENCIES += host-python-setuptools-scm
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_DEPENDENCIES += python-adafruit-circuitpython-connectionmanager

$(eval $(python-package))
