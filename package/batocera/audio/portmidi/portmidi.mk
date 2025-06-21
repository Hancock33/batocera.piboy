################################################################################
#
# portmidi
#
################################################################################
# Version: Commits on Jun 19, 2025
PORTMIDI_VERSION = 07ae853a20c7484c7bde1893ed68c06a852dcf17
PORTMIDI_SITE = $(call github,PortMidi,portmidi,$(PORTMIDI_VERSION))
PORTMIDI_LICENSE = MIT
PORTMIDI_SUPPORTS_IN_SOURCE_BUILD = NO
PORTMIDI_INSTALL_STAGING = YES
PORTMIDI_DEPENDENCIES = alsa-lib

$(eval $(cmake-package))
