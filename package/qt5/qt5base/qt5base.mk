#############################################################
#
# qt5base
#
#############################################################

QT5BASE_VERSION = 5.0.1
QT5BASE_SITE = http://releases.qt-project.org/qt5/$(QT5BASE_VERSION)/submodules_tar/
QT5BASE_SOURCE = qtbase-opensource-src-$(QT5BASE_VERSION).tar.xz

QT5BASE_DEPENDENCIES = host-pkgconf zlib pcre
QT5BASE_INSTALL_STAGING = YES

# A few comments:
#  * -no-pch to workaround the issue described at
#     http://comments.gmane.org/gmane.comp.lib.qt.devel/5933.
#  * -system-zlib because zlib is mandatory for Qt build, and we
#     want to use the Buildroot packaged zlib
#  * -system-pcre because pcre is mandatory to build Qt, and we
#    want to use the one packaged in Buildroot
QT5BASE_CONFIGURE_OPTS += \
	-optimized-qmake \
	-no-eglfs \
	-no-kms \
	-no-opengl \
	-no-glib \
	-no-cups \
	-no-nis \
	-no-libudev \
	-no-iconv \
	-no-openssl \
	-no-fontconfig \
	-no-gif \
	-no-libpng \
	-no-libjpeg \
	-no-icu \
	-no-dbus \
	-no-gstreamer \
	-no-gtkstyle \
	-system-zlib \
	-system-pcre \
	-no-pch

ifeq ($(BR2_ENABLE_DEBUG),y)
QT5BASE_CONFIGURE_OPTS += -debug
else
QT5BASE_CONFIGURE_OPTS += -release
endif

ifeq ($(BR2_LARGEFILE),y)
QT5BASE_CONFIGURE_OPTS += -largefile
else
QT5BASE_CONFIGURE_OPTS += -no-largefile
endif

ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
QT5BASE_LICENSE = LGPLv2.1 or GPLv3.0
QT5BASE_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
else
QT5BASE_LICENSE = Commercial license
QT5BASE_REDISTRIBUTE = NO
endif

# We have to use --enable-linuxfb, otherwise Qt thinks that -linuxfb
# is to add a link against the "inuxfb" library.
QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_GUI),-gui,-no-gui)
QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_WIDGETS),-widgets,-no-widgets)
QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_LINUXFB),--enable-linuxfb,-no-linuxfb)
QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),-directfb,-no-directfb)
QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),directfb)

ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
QT5BASE_CONFIGURE_OPTS += -xcb
QT5BASE_DEPENDENCIES   += \
	libxcb \
	xcb-util-wm \
	xcb-util-image \
	xcb-util-keysyms \
	xlib_libX11
else
QT5BASE_CONFIGURE_OPTS += -no-xcb
endif

# Build the list of libraries to be installed on the target
QT5BASE_INSTALL_LIBS_y                                 += Qt5Core
QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_NETWORK)    += Qt5Network
QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_CONCURRENT) += Qt5Concurrent
QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL)        += Qt5Sql
QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_TEST)       += Qt5Test
QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml

QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_GUI)          += Qt5Gui
QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_WIDGETS)      += Qt5Widgets
QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_PRINTSUPPORT) += Qt5PrintSupport

# Ideally, we could use -device-option to substitute variable values
# in our linux-buildroot-g++/qmake.config, but this mechanism doesn't
# nicely support variable values that contain spaces. So we use the
# good old sed solution here.
define QT5BASE_CONFIG_SET
	$(SED) 's%^$(1).*%$(1) = $(2)%g' $(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
endef

define QT5BASE_CONFIGURE_CMDS
	$(call QT5BASE_CONFIG_SET,CROSS_COMPILE,$(TARGET_CROSS))
	$(call QT5BASE_CONFIG_SET,COMPILER_CFLAGS,$(TARGET_CFLAGS))
	$(call QT5BASE_CONFIG_SET,COMPILER_CXXFLAGS,$(TARGET_CXXFLAGS))
	(cd $(@D); \
		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
		PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
		MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" \
		./configure \
		-v \
		-prefix /usr \
		-hostprefix $(HOST_DIR)/usr \
		-sysroot $(STAGING_DIR) \
		-plugindir /usr/lib/qt/plugins \
		-no-rpath \
		-nomake examples -nomake demos -nomake tests \
		-device buildroot \
		-no-c++11 \
		$(QT5BASE_CONFIGURE_OPTS) \
	)
endef

define QT5BASE_BUILD_CMDS
	$(MAKE) -C $(@D)
endef

define QT5BASE_INSTALL_STAGING_CMDS
	$(MAKE) -C $(@D) install
	$(QT5_LA_PRL_FILES_FIXUP)
endef

define QT5BASE_INSTALL_TARGET_LIBS
	for lib in $(QT5BASE_INSTALL_LIBS_y); do \
		cp -dpf $(STAGING_DIR)/usr/lib/lib$${lib}.so.* $(TARGET_DIR)/usr/lib ; \
	done
endef

define QT5BASE_INSTALL_TARGET_PLUGINS
	if [ -d $(STAGING_DIR)/usr/lib/qt/plugins/ ] ; then \
		mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins ; \
		cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins ; \
	fi
endef

define QT5BASE_INSTALL_TARGET_CMDS
	$(QT5BASE_INSTALL_TARGET_LIBS)
	$(QT5BASE_INSTALL_TARGET_PLUGINS)
endef

$(eval $(generic-package))
