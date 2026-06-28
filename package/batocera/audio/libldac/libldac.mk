################################################################################
#
# libldac
#
################################################################################
# Version: Commits on Jun 27, 2026
LIBLDAC_VERSION = 6579bd585a618f2e1612b3c1650d2b7fcfb1d43f
LIBLDAC_SITE = https://github.com/EHfive/ldacBT.git
LIBLDAC_SITE_METHOD = git
LIBLDAC_GIT_SUBMODULES = YES
LIBLDAC_LICENSE = Apache-2.0 license
LIBLDAC_LICENSE_FILES = LICENSE
LIBLDAC_INSTALL_STAGING = YES

$(eval $(cmake-package))
