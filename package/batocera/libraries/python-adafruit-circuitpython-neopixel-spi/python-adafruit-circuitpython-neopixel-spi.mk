################################################################################
#
# python-adafruit-circuitpython-neopixel-spi
#
################################################################################
# Version: Commits on Oct 07, 2024
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_VERSION = 1.0.10
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_SOURCE = adafruit_circuitpython_neopixel_spi-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_SITE = https://files.pythonhosted.org/packages/1c/9d/70e1352338269bfbd634fa76267c8831467373c14325860a4bd11aca6bf1
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_DEPENDENCIES += host-python-setuptools-scm
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_DEPENDENCIES += python-adafruit-circuitpython-pixelbuf
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_DEPENDENCIES += python-adafruit-circuitpython-busdevice

$(eval $(python-package))
