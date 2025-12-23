################################################################################
#
# nghttp3
#
################################################################################
# Version: Commits on Dec 23, 2025
NGHTTP3_VERSION = v1.14.0
NGHTTP3_SITE = https://github.com/ngtcp2/nghttp3.git
NGHTTP3_SITE_METHOD = git
NGHTTP3_GIT_SUBMODULES = YES
NGHTTP3_LICENSE = MIT license
NGHTTP3_SUPPORTS_IN_SOURCE_BUILD = NO
NGHTTP3_INSTALL_STAGING = YES
NGHTTP3_INSTALL_TARGET = NO

$(eval $(cmake-package))
