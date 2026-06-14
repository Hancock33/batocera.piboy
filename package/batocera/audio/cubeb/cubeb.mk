################################################################################
#
# cubeb
#
################################################################################
# Version: Commits on Jun 10, 2026
CUBEB_VERSION = 42dac8a82fc83bf7e63a93704c7f621fb829d1e6
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
