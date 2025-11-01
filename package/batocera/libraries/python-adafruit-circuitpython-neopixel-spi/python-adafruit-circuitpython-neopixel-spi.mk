################################################################################
#
# python-adafruit-circuitpython-neopixel-spi
#
################################################################################
# Version: Commits on Oct 20, 2025
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_VERSION = 1.0.14
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_SOURCE = adafruit_circuitpython_neopixel_spi-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_SITE = https://files.pythonhosted.org/packages/e8/68/3b81de3c5cb1890c5ae5fd6c411cdd2d4048bb252b866a1fa569b5afc46a
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_DEPENDENCIES += host-python-setuptools-scm
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_DEPENDENCIES += python-adafruit-circuitpython-pixelbuf
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_DEPENDENCIES += python-adafruit-circuitpython-busdevice

$(eval $(python-package))
