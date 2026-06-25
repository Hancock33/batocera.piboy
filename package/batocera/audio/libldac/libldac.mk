################################################################################
#
# libldac
#
################################################################################
# Version: Commits on Jun 24, 2026
LIBLDAC_VERSION = 385dc306a0d490b2ff569769d71350b1e0fc6acb
LIBLDAC_SITE = https://github.com/EHfive/ldacBT.git
LIBLDAC_SITE_METHOD = git
LIBLDAC_GIT_SUBMODULES = YES
LIBLDAC_LICENSE = Apache-2.0 license
LIBLDAC_LICENSE_FILES = LICENSE
LIBLDAC_INSTALL_STAGING = YES

$(eval $(cmake-package))
