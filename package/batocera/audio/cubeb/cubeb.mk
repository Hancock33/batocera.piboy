################################################################################
#
# cubeb
#
################################################################################
# Version: Commits on Aug 11, 2026
CUBEB_VERSION = f0bd97db8cd33dc3e5a1d27b689eed2e3434b65c
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
