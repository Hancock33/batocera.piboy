################################################################################
#
# xfont_encodings -- No description available
#
################################################################################

XFONT_ENCODINGS_VERSION = 1.0.2
XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.bz2
XFONT_ENCODINGS_SITE = http://xorg.freedesktop.org/releases/individual/font
XFONT_ENCODINGS_AUTORECONF = NO
XFONT_ENCODINGS_MAKE_OPT =

$(eval $(call AUTOTARGETS,package/x11r7,xfont_encodings))
