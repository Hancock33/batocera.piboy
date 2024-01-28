################################################################################
#
# cubeb
#
################################################################################
# Version: Commits on Jan 15, 2024
CUBEB_VERSION = dd8a91f98260d2c6171a7cf8a73f8fd4bdbb5337
CUBEB_SITE = $(call github,mozilla,cubeb,$(CUBEB_VERSION))

CUBEB_LICENSE = ISC
CUBEB_SUPPORTS_IN_SOURCE_BUILD = NO
CUBEB_INSTALL_STAGING = YES
CUBEB_DEPENDENCIES = alsa-lib speex

CUBEB_CONF_OPTS += -DBUILD_TOOLS=no
CUBEB_CONF_OPTS += -DLAZY_LOAD_LIBS=no
CUBEB_CONF_OPTS += -DUSE_SANITIZERS=no

$(eval $(cmake-package))
