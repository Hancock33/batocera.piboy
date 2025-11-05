################################################################################
#
# cubeb
#
################################################################################
# Version: Commits on Nov 04, 2025
CUBEB_VERSION = 1de1094b2af96318af4da6cdb6f340e3a06cefe2
CUBEB_SITE = $(call github,mozilla,cubeb,$(CUBEB_VERSION))

CUBEB_LICENSE = Mozilla
CUBEB_SUPPORTS_IN_SOURCE_BUILD = NO
CUBEB_INSTALL_STAGING = YES
CUBEB_DEPENDENCIES += alsa-lib jack2 pulseaudio speex

CUBEB_CONF_OPTS += -DBUILD_RUST_LIBS=OFF
CUBEB_CONF_OPTS += -DBUILD_TOOLS=OFF
CUBEB_CONF_OPTS += -DLAZY_LOAD_LIBS=OFF
CUBEB_CONF_OPTS += -DUSE_SANITIZERS=OFF

$(eval $(cmake-package))
