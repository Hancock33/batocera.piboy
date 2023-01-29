################################################################################
#
# python-hidapi
#
################################################################################

PYTHON_HIDAPI_VERSION = 0.13.1
PYTHON_HIDAPI_SOURCE = hidapi-$(PYTHON_HIDAPI_VERSION).tar.gz
PYTHON_HIDAPI_SETUP_TYPE = setuptools
PYTHON_HIDAPI_SITE = https://files.pythonhosted.org/packages/78/0a/d71f35a8dcbe88dab21cd668a62b688ea6dd45872feba45a97efd0452c19
PYTHON_HIDAPI_LICENSE = GPLv3
PYTHON_HIDAPI_LICENSE_FILES = LICENSE-gpl3.txt
PYTHON_HIDAPI_DEPENDENCIES = libusb udev

define PYTHON_HIDAPI_UPDATE_INCLUDE_PATH
	sed -i "s+/usr/include/+$(STAGING_DIR)/usr/include/+g" $(@D)/setup.py
endef
PYTHON_HIDAPI_PRE_CONFIGURE_HOOKS += PYTHON_HIDAPI_UPDATE_INCLUDE_PATH

$(eval $(python-package))