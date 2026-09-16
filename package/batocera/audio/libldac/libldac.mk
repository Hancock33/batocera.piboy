################################################################################
#
# libldac
#
################################################################################
# Version: Commits on Jun 27, 2026
LIBLDAC_VERSION = v2.0.2.6
LIBLDAC_SITE = https://github.com/EHfive/ldacBT.git
LIBLDAC_SITE_METHOD = git
LIBLDAC_GIT_SUBMODULES = YES
LIBLDAC_LICENSE = Apache-2.0 license
LIBLDAC_LICENSE_FILES = LICENSE
LIBLDAC_INSTALL_STAGING = YES

$(eval $(cmake-package))
