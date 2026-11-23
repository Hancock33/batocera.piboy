################################################################################
#
# cubeb
#
################################################################################
# Version: Commits on Nov 22, 2026
CUBEB_VERSION = 131b2a057b999b64198a5761e4724da571706cd2
CUBEB_SITE = $(call github,mozilla,cubeb,$(CUBEB_VERSION))

CUBEB_LICENSE = ISC
CUBEB_LICENSE_FILES = LICENSE
CUBEB_SUPPORTS_IN_SOURCE_BUILD = NO
CUBEB_INSTALL_STAGING = YES
CUBEB_DEPENDENCIES += alsa-lib jack2 pulseaudio speex

CUBEB_CONF_OPTS += -DBUILD_RUST_LIBS=OFF
CUBEB_CONF_OPTS += -DBUILD_TOOLS=OFF
CUBEB_CONF_OPTS += -DLAZY_LOAD_LIBS=OFF
CUBEB_CONF_OPTS += -DUSE_SANITIZERS=OFF

ifeq ($(BR2_PACKAGE_SPEEXDSP),y)
CUBEB_DEPENDENCIES += speexdsp
endif

$(eval $(cmake-package))
