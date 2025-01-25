################################################################################
#
# python-adafruit-circuitpython-typing
#
################################################################################
# Version: Commits on Dec 02, 2024
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_VERSION = 1.11.2
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_SOURCE = adafruit_circuitpython_typing-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_SITE = https://files.pythonhosted.org/packages/24/80/8c280fa7d42a23dce40b2fe64f708d18fa32b384adbf6934955d2c2ebecf
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_CIRCUITPYTHON_TYPING_DEPENDENCIES += host-python-setuptools-scm

$(eval $(python-package))
