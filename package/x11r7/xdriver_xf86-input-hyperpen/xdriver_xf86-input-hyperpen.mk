################################################################################
#
# xdriver_xf86-input-hyperpen -- X.Org driver for hyperpen input devices
#
################################################################################

XDRIVER_XF86_INPUT_HYPERPEN_VERSION = 1.2.0
XDRIVER_XF86_INPUT_HYPERPEN_SOURCE = xf86-input-hyperpen-$(XDRIVER_XF86_INPUT_HYPERPEN_VERSION).tar.bz2
XDRIVER_XF86_INPUT_HYPERPEN_SITE = http://xorg.freedesktop.org/releases/individual/driver
XDRIVER_XF86_INPUT_HYPERPEN_AUTORECONF = NO
XDRIVER_XF86_INPUT_HYPERPEN_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
XDRIVER_XF86_INPUT_HYPERPEN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install

$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-hyperpen))
