################################################################################
#
# python-adafruit-circuitpython-pixelbuf
#
################################################################################
# Version: Commits on Aug 14, 2026
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_VERSION = 2.1.0
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_SOURCE = adafruit_circuitpython_pixelbuf-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_SITE = https://files.pythonhosted.org/packages/55/96/cffcc48ccf8132491e8c6acddc54fd88e6be7bd449ce5aa9fbddcd8af451
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
