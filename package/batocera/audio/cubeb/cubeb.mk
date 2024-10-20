################################################################################
#
# cubeb
#
################################################################################
# Version: Commits on Oct 11, 2024
CUBEB_VERSION = ffd5184e47b1ca2fe4c3de17643c7695b9be463a
CUBEB_SITE = $(call github,mozilla,cubeb,$(CUBEB_VERSION))

CUBEB_LICENSE = ISC
CUBEB_SUPPORTS_IN_SOURCE_BUILD = NO
CUBEB_INSTALL_STAGING = YES
CUBEB_DEPENDENCIES = alsa-lib speex

CUBEB_CONF_OPTS += -DBUILD_TOOLS=no
CUBEB_CONF_OPTS += -DLAZY_LOAD_LIBS=no
CUBEB_CONF_OPTS += -DUSE_SANITIZERS=no

$(eval $(cmake-package))
