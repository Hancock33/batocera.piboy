################################################################################
#
# python-cog
#
################################################################################
# Version: Commits on Nov 15, 2026
PYTHON_COG_VERSION = v3.6.1
PYTHON_COG_SITE = $(call github,nedbat,cog,$(PYTHON_COG_VERSION))
PYTHON_COG_SETUP_TYPE = setuptools
PYTHON_COG_LICENSE = MIT
PYTHON_COG_LICENSE_FILES = LICENSE.txt
PYTHON_COG_INSTALL_STAGING = YES

$(eval $(python-package))
$(eval $(host-python-package))
