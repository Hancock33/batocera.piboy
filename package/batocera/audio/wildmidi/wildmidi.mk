################################################################################
#
# wildmidi
#
################################################################################
# Version: Commits on Apr 11, 2024
WILDMIDI_VERSION = 345a6dd94e89dda34072f1d03eb75180c9bc994f
WILDMIDI_SITE =  $(call github,Mindwerks,wildmidi,$(WILDMIDI_VERSION))
WILDMIDI_LICENSE = LGPLv3
WILDMIDI_INSTALL_STAGING = YES

WILDMIDI_CONF_OPTS += -DBUILD_TESTING=OFF -DWANT_STATIC=ON -DWANT_PLAYER=OFF

$(eval $(cmake-package))
