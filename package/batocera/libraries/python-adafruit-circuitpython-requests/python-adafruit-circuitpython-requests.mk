################################################################################
#
# python-adafruit-circuitpython-requests
#
################################################################################
# Version: Commits on Oct 07, 2024
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_VERSION = 4.1.8
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_SOURCE = adafruit_circuitpython_requests-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/90/62/26f092fbd003e800e41e7edf0a4f7b3b828a23370d8e68e9a9a482eb50db
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_DEPENDENCIES += host-python-setuptools-scm
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_DEPENDENCIES += python-adafruit-circuitpython-connectionmanager

$(eval $(python-package))
