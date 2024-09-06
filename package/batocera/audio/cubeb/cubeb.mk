################################################################################
#
# cubeb
#
################################################################################
# Version: Commits on Aug 30, 2024
CUBEB_VERSION = 19d2f7bce6a4d0566a07f3187d2bc5f0ec95c1c4
CUBEB_SITE = $(call github,mozilla,cubeb,$(CUBEB_VERSION))

CUBEB_LICENSE = ISC
CUBEB_SUPPORTS_IN_SOURCE_BUILD = NO
CUBEB_INSTALL_STAGING = YES
CUBEB_DEPENDENCIES = alsa-lib speex

CUBEB_CONF_OPTS += -DBUILD_TOOLS=no
CUBEB_CONF_OPTS += -DLAZY_LOAD_LIBS=no
CUBEB_CONF_OPTS += -DUSE_SANITIZERS=no

$(eval $(cmake-package))
