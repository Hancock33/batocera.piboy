################################################################################
#
# python-cog
#
################################################################################
# Version: Commits on Jun 10, 2025
PYTHON_COG_VERSION = v3.5.1
PYTHON_COG_SITE = $(call github,nedbat,cog,$(PYTHON_COG_VERSION))
PYTHON_COG_SETUP_TYPE = setuptools
PYTHON_COG_LICENSE = MIT license
PYTHON_COG_LICENSE_FILES = LICENSE.txt
PYTHON_COG_INSTALL_STAGING = YES
#PYTHON_COG_DEPENDENCIES = liblgpio host-swig

$(eval $(python-package))
$(eval $(host-python-package))
