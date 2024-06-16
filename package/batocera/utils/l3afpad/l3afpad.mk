################################################################################
#
# l3afpad
#
################################################################################
# Version: Commits on Feb 14, 2022
L3AFPAD_VERSION = 16f22222116b78b7f6a6fd83289937cdaabed624
L3AFPAD_SITE = $(call github,stevenhoneyman,l3afpad,$(L3AFPAD_VERSION))

L3AFPAD_DEPENDENCIES = libgtk3 host-intltool harfbuzz
L3AFPAD_LICENSE = GPL-2.0+
L3AFPAD_LICENSE_FILES = COPYING
L3AFPAD_AUTORECONF = YES

$(eval $(autotools-package))
