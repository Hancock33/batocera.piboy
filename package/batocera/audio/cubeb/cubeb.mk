################################################################################
#
# cubeb
#
################################################################################
# Version: Commits on Sept 04, 2026
CUBEB_VERSION = 80dd0a2e9bb01319938b57fb92dcbb94212bbb76
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
