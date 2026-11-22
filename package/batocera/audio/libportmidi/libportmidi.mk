################################################################################
#
# libportmidi
#
################################################################################
# Version: Commits on Dec 02, 2025
LIBPORTMIDI_VERSION = v2.0.8
LIBPORTMIDI_SITE = $(call github,PortMidi,portmidi,$(LIBPORTMIDI_VERSION))
LIBPORTMIDI_LICENSE = MIT
LIBPORTMIDI_SUPPORTS_IN_SOURCE_BUILD = NO
LIBPORTMIDI_INSTALL_STAGING = YES
LIBPORTMIDI_DEPENDENCIES = alsa-lib

$(eval $(cmake-package))
