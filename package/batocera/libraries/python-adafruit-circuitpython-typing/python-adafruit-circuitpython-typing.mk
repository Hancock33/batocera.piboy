################################################################################
#
# python-adafruit-circuitpython-typing
#
################################################################################

PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_VERSION = 1.8.3
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_SOURCE = adafruit-circuitpython-typing-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_SITE = https://files.pythonhosted.org/packages/8a/f6/edbca0fe12e8a7bfa6026f420b09e6e541662040e62680eb98493803c87a
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_LICENSE_FILES = LICENSE LICENSES/CC-BY-4.0.txt LICENSES/MIT.txt LICENSES/Unlicense.txt

$(eval $(python-package))
