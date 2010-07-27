#############################################################
#
# webkit
#
#############################################################
WEBKIT_VERSION = 1.2.3
WEBKIT_SOURCE = webkit-$(WEBKIT_VERSION).tar.gz
WEBKIT_SITE = http://www.webkitgtk.org

WEBKIT_INSTALL_STAGING = YES
WEBKIT_LIBTOOL_PATCH = NO

WEBKIT_DEPENDENCIES = host-flex host-gperf icu curl libxml2 libxslt	\
			libgtk2 sqlite enchant libsoup jpeg libgail

WEBKIT_CONF_ENV = ac_cv_path_icu_config=$(STAGING_DIR)/usr/bin/icu-config

ifeq ($(BR2_PACKAGE_XORG7),y)
	WEBKIT_CONF_OPT += --with-target=x11
	WEBKIT_DEPENDENCIES += xserver_xorg-server
endif

ifeq ($(BR2_PACKAGE_DIRECTFB),y)
	WEBKIT_CONF_OPT += --with-target=directfb
	WEBKIT_DEPENDENCIES += directfb
endif

WEBKIT_CONF_OPT += --disable-video

$(eval $(call AUTOTARGETS,package,webkit))
