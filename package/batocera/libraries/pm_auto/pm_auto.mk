################################################################################
#
# pm_auto
#
################################################################################
# Version: Commits on Feb 28, 2025
PM_AUTO_VERSION = 49177931faa8b803146eb555cf6391a879432940
PM_AUTO_SITE = $(call github,sunfounder,pm_auto,$(PM_AUTO_VERSION))
PM_AUTO_SETUP_TYPE = setuptools
PM_AUTO_LICENSE = GPL-2.0
PM_AUTO_LICENSE_FILES = LICENSE

PM_AUTO_DEPENDENCIES += python-adafruit-circuitpython-neopixel-spi
PM_AUTO_DEPENDENCIES += python-smbus3 python-psutil python-lgpio
PM_AUTO_DEPENDENCIES += python-pillow python-gpiod python-gpiozero
PM_AUTO_DEPENDENCIES += python-adafruit-circuitpython-requests

$(eval $(python-package))
