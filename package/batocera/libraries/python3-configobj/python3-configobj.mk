################################################################################
#
# python3-configobj
#
################################################################################
# Version: Commits on Sept 21, 2024
PYTHON3_CONFIGOBJ_VERSION = v5.0.9
PYTHON3_CONFIGOBJ_SOURCE = configobj-$(subst v,,$(PYTHON3_CONFIGOBJ_VERSION)).tar.gz
PYTHON3_CONFIGOBJ_SITE = https://github.com/DiffSK/configobj/releases/download/$(PYTHON3_CONFIGOBJ_VERSION)
PYTHON3_CONFIGOBJ_SETUP_TYPE = setuptools
PYTHON3_CONFIGOBJ_LICENSE_FILES = LICENSE

$(eval $(python-package))
