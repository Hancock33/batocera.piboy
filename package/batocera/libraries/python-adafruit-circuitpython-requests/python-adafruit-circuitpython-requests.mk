################################################################################
#
# python-adafruit-circuitpython-requests
#
################################################################################
# Version: Commits on Jul 08, 2024
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_VERSION = 4.1.4
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_SOURCE = adafruit_circuitpython_requests-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/6e/b0/afc5600f34105002f76ffa9afa5668ca3a4bce51ee6124cd3bcd1fd27128
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_LICENSE_FILES = LICENSE LICENSES/CC-BY-4.0.txt LICENSES/MIT.txt LICENSES/Unlicense.txt

PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_DEPENDENCIES = python-adafruit-circuitpython-connectionmanager

$(eval $(python-package))

