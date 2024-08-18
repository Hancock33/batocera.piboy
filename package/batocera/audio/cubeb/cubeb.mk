################################################################################
#
# cubeb
#
################################################################################
# Version: Commits on Aug 15, 2024
CUBEB_VERSION = 8f6c9a01ddd7c1ac8360b9a31c54e24826ad073f
CUBEB_SITE = $(call github,mozilla,cubeb,$(CUBEB_VERSION))

CUBEB_LICENSE = ISC
CUBEB_SUPPORTS_IN_SOURCE_BUILD = NO
CUBEB_INSTALL_STAGING = YES
CUBEB_DEPENDENCIES = alsa-lib speex

CUBEB_CONF_OPTS += -DBUILD_TOOLS=no
CUBEB_CONF_OPTS += -DLAZY_LOAD_LIBS=no
CUBEB_CONF_OPTS += -DUSE_SANITIZERS=no

$(eval $(cmake-package))
