################################################################################
#
# libmysofa
#
################################################################################
# Version: Commits on Jul 19, 2026
LIBMYSOFA_VERSION = 6cc5b15a73e9bd97810d03767082edda7f315881
LIBMYSOFA_SITE = $(call github,hoene,libmysofa,$(LIBMYSOFA_VERSION))
LIBMYSOFA_LICENSE = BSD-3-Clause
LIBMYSOFA_LICENSE_FILES = LICENSE
LIBMYSOFA_DEPENDENCIES = libspatialaudio zlib
LIBMYSOFA_SUPPORTS_IN_SOURCE_BUILD = NO
LIBMYSOFA_INSTALL_STAGING = YES
LIBMYSOFA_INSTALL_TARGET = NO

LIBMYSOFA_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBMYSOFA_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
LIBMYSOFA_CONF_OPTS += -DBUILD_TESTS=OFF
LIBMYSOFA_CONF_OPTS += -DCMAKE_POSITION_INDEPENDENT_CODE=ON

$(eval $(cmake-package))
