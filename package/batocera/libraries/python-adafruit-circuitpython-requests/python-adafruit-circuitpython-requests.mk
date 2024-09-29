################################################################################
#
# python-adafruit-circuitpython-requests
#
################################################################################
# Version: Commits on Jul 29, 2024
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_VERSION = 4.1.6
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_SOURCE = adafruit_circuitpython_requests-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/e4/ff/23d24a663c168e53ee22ee4648f2584164be05893677a469534ba2cc3553
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_LICENSE_FILES = LICENSE LICENSES/CC-BY-4.0.txt LICENSES/MIT.txt LICENSES/Unlicense.txt

PYTHON_ADAFRUIT_CIRCUITPYTHON_REQUESTS_DEPENDENCIES = python-adafruit-circuitpython-connectionmanager

$(eval $(python-package))
