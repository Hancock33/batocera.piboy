################################################################################
#
# sockpp
#
################################################################################
# Version: Commits on Dec 17, 2023
SOCKPP_VERSION = v1.0.0
SOCKPP_SITE = $(call github,fpagliughi,sockpp,$(SOCKPP_VERSION))
SOCKPP_LICENSE = BSD-3-Clause
SOCKPP_LICENSE_FILES = LICENSE
SOCKPP_DEPENDENCIES =
SOCKPP_SUPPORTS_IN_SOURCE_BUILD = NO
SOCKPP_INSTALL_STAGING = YES

$(eval $(cmake-package))
