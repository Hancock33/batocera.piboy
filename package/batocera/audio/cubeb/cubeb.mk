################################################################################
#
# cubeb
#
################################################################################
# Version: Commits on Oct 21, 2026
CUBEB_VERSION = dcd7cddafa4b95776cf5d117549ad58e17f23764
CUBEB_SITE = $(call github,mozilla,cubeb,$(CUBEB_VERSION))

CUBEB_LICENSE = Mozilla
CUBEB_SUPPORTS_IN_SOURCE_BUILD = NO
CUBEB_INSTALL_STAGING = YES
CUBEB_DEPENDENCIES += alsa-lib jack2 pulseaudio speex

CUBEB_CONF_OPTS += -DBUILD_RUST_LIBS=OFF
CUBEB_CONF_OPTS += -DBUILD_TOOLS=OFF
CUBEB_CONF_OPTS += -DLAZY_LOAD_LIBS=OFF
CUBEB_CONF_OPTS += -DUSE_SANITIZERS=OFF

ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
CUBEB_DEPENDENCIES += alsa-lib
endif

ifeq ($(BR2_PACKAGE_JACK2),y)
CUBEB_DEPENDENCIES += jack2
endif

ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
CUBEB_DEPENDENCIES += pulseaudio
endif

ifeq ($(BR2_PACKAGE_SPEEXDSP),y)
CUBEB_DEPENDENCIES += speexdsp
endif

$(eval $(cmake-package))
