################################################################################
#
# rtmidi
#
################################################################################
# Version: Commits on Aug 03, 2023
RTMIDI_VERSION = 6.0.0
RTMIDI_SITE = $(call github,thestk,rtmidi,$(RTMIDI_VERSION))
RTMIDI_LICENSE = PROPRIETARY
RTMIDI_LICENSE_FILE = LICENSE

RTMIDI_INSTALL_STAGING = YES
RTMIDI_SUPPORTS_IN_SOURCE_BUILD = NO

RTMIDI_DEPENDENCIES =

RTMIDI_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
RTMIDI_CONF_OPTS += -DBUILD_SHARED_LIBS=ON
RTMIDI_CONF_OPTS += -DRTMIDI_BUILD_TESTING=OFF

ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
    RTMIDI_DEPENDENCIES += alsa-lib
    RTMIDI_CONF_OPTS += -DRTMIDI_API_ALSA=ON
    RTMIDI_CONF_ENV += LIBS=-lasound
endif

ifeq ($(BR2_PACKAGE_JACK2),y)
    RTMIDI_DEPENDENCIES += jack2
    RTMIDI_CONF_OPTS += -DRTMIDI_API_JACK=ON
endif

$(eval $(cmake-package))
