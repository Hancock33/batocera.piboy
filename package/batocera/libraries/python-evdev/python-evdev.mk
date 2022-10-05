################################################################################
#
# python-evdev
#
################################################################################
# Version: Commits on Jul 17, 2022
PYTHON_EVDEV_VERSION = 3cd7fbf222dbf3b4ca277d5138eabdb1819faa66
PYTHON_EVDEV_SITE =  $(call github,gvalkov,python-evdev,$(PYTHON_EVDEV_VERSION))
PYTHON_EVDEV_SETUP_TYPE = setuptools

define PYTHON_EVDEV_UPDATE_LINUX_PATH
	sed -i "s+/usr/include/linux/+$(STAGING_DIR)/usr/include/linux/+g" $(@D)/setup.py $(@D)/evdev/genecodes.py
endef
PYTHON_EVDEV_PRE_CONFIGURE_HOOKS += PYTHON_EVDEV_UPDATE_LINUX_PATH

$(eval $(python-package))
