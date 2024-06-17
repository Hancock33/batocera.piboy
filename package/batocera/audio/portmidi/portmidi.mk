################################################################################
#
# portmidi
#
################################################################################
# Version: Commits on Jun 17, 2024
PORTMIDI_VERSION = 8efac0cfe6c245aeb2ce5122aa2b82fb79e91463
PORTMIDI_SITE = $(call github,PortMidi,portmidi,$(PORTMIDI_VERSION))
PORTMIDI_LICENSE = MIT
PORTMIDI_SUPPORTS_IN_SOURCE_BUILD = NO
PORTMIDI_INSTALL_STAGING = YES
PORTMIDI_DEPENDENCIES = alsa-lib

$(eval $(cmake-package))
