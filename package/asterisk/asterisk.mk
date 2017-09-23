################################################################################
#
# asterisk
#
################################################################################

ASTERISK_VERSION = 14.5.0
# Use the github mirror: it's an official mirror maintained by Digium, and
# provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))

ASTERISK_SOUNDS_BASE_URL = http://downloads.asterisk.org/pub/telephony/sounds/releases
ASTERISK_EXTRA_DOWNLOADS = \
	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-core-sounds-en-gsm-1.5.tar.gz \
	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-moh-opsound-wav-2.03.tar.gz

ASTERISK_LICENSE = GPL-2.0, BSD-3c (SHA1, resample), BSD-4c (db1-ast)
ASTERISK_LICENSE_FILES = \
	COPYING \
	main/sha1.c \
	codecs/speex/speex_resampler.h \
	utils/db1-ast/include/db.h

# For patches 0001, 0003 and 0004
ASTERISK_AUTORECONF = YES
ASTERISK_AUTORECONF_OPTS = -Iautoconf -Ithird-party -Ithird-party/pjproject

ASTERISK_DEPENDENCIES = \
	host-asterisk \
	jansson \
	libcurl \
	libxml2 \
	ncurses \
	sqlite \
	util-linux

# Asterisk wants to run its menuselect tool (a highly tweaked derivative of
# kconfig), but builds it using the target tools. So we build it in the host
# variant (see below), and copy the full build tree of menuselect.
define ASTERISK_COPY_MENUSELECT
	rm -rf $(@D)/menuselect
	cp -a $(HOST_ASTERISK_DIR)/menuselect $(@D)/menuselect
endef
ASTERISK_PRE_CONFIGURE_HOOKS += ASTERISK_COPY_MENUSELECT

ASTERISK_CONF_OPTS = \
	--disable-xmldoc \
	--disable-internal-poll \
	--disable-asteriskssl \
	--disable-rpath \
	--without-bfd \
	--without-bluetooth \
	--without-cap \
	--without-cpg \
	--without-curses \
	--without-dahdi \
	--without-gtk2 \
	--without-gmime \
	--without-h323 \
	--without-hoard \
	--without-ical \
	--without-iconv \
	--without-iksemel \
	--without-imap \
	--without-inotify \
	--without-iodbc \
	--without-isdnnet \
	--without-jack \
	--without-uriparser \
	--without-kqueue \
	--without-ldap \
	--without-libedit \
	--without-libxslt \
	--without-ltdl \
	--without-lua \
	--without-misdn \
	--without-mysqlclient \
	--without-nbs \
	--without-neon \
	--without-neon29 \
	--without-netsnmp \
	--without-newt \
	--without-ogg \
	--without-openr2 \
	--without-opus \
	--without-osptk \
	--without-oss \
	--without-postgres \
	--without-pjproject \
	--without-popt \
	--without-portaudio \
	--without-pri \
	--without-pwlib \
	--without-radius \
	--without-resample \
	--without-sdl \
	--without-SDL_image \
	--without-spandsp \
	--without-ss7 \
	--without-speex \
	--without-speexdsp \
	--without-sqlite \
	--without-srtp \
	--without-suppserv \
	--without-tds \
	--without-termcap \
	--without-timerfd \
	--without-tinfo \
	--without-tonezone \
	--without-unbound \
	--without-unixodbc \
	--without-vorbis \
	--without-vpb \
	--without-x11 \
	--with-crypt \
	--with-jansson \
	--with-libcurl \
	--with-ilbc \
	--with-libxml2 \
	--with-ncurses="$(STAGING_DIR)/usr" \
	--with-sqlite3="$(STAGING_DIR)/usr" \
	--with-sounds-cache=$(BR2_DL_DIR)

# avcodec are from ffmpeg. There is virtually zero chance this could
# even work; asterisk is looking for ffmpeg/avcodec.h which has not
# been installed in this location since early 2007 (~10 years ago at
# the time of this writing).
ASTERISK_CONF_OPTS += --without-avcodec

ASTERISK_CONF_ENV = \
	ac_cv_path_CONFIG_LIBXML2=$(STAGING_DIR)/usr/bin/xml2-config

ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
ASTERISK_CONF_OPTS += --with-execinfo
else
ASTERISK_CONF_OPTS += --without-execinfo
endif

ifeq ($(BR2_PACKAGE_LIBGSM),y)
ASTERISK_DEPENDENCIES += libgsm
ASTERISK_CONF_OPTS += --with-gsm
else
ASTERISK_CONF_OPTS += --without-gsm
endif

ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
ASTERISK_DEPENDENCIES += alsa-lib
ASTERISK_CONF_OPTS += --with-asound
else
ASTERISK_CONF_OPTS += --without-asound
endif

ifeq ($(BR2_PACKAGE_OPENSSL),y)
ASTERISK_DEPENDENCIES += openssl
ASTERISK_CONF_OPTS += --with-ssl
else
ASTERISK_CONF_OPTS += --without-ssl
endif

ifeq ($(BR2_PACKAGE_ZLIB),y)
ASTERISK_DEPENDENCIES += zlib
ASTERISK_CONF_OPTS += --with-z
else
ASTERISK_CONF_OPTS += --without-z
endif

ASTERISK_DIRS = \
	ASTVARLIBDIR="/usr/lib/asterisk" \
	ASTDATADIR="/usr/lib/asterisk" \
	ASTKEYDIR="/usr/lib/asterisk" \
	ASTDBDIR="/usr/lib/asterisk"

ASTERISK_MAKE_OPTS = $(ASTERISK_DIRS)

# We want to install sample configuration files, too.
ASTERISK_INSTALL_TARGET_OPTS = \
	$(ASTERISK_DIRS) \
	DESTDIR=$(TARGET_DIR) \
	LDCONFIG=true \
	install samples

$(eval $(autotools-package))

#-------------------------------------------------------------------------------
# This part deals with building the menuselect tool as a host package

HOST_ASTERISK_DEPENDENCIES = host-pkgconf host-libxml2 host-ncurses
HOST_ASTERISK_SUBDIR = menuselect

HOST_ASTERISK_LICENSE = GPL-2.0
HOST_ASTERISK_LICENSE_FILES = COPYING

# No need to autoreconf for the host variant,
# so do not inherit the target setup.
HOST_ASTERISK_AUTORECONF = NO

HOST_ASTERISK_CONF_ENV = CONFIG_LIBXML2=$(HOST_DIR)/usr/bin/xml2-config

HOST_ASTERISK_CONF_OPTS = \
	--without-newt \
	--without-curses \
	--with-ncurses=$(HOST_DIR)/usr

# Even though menuselect is an autotools package, it is *not* installed,
# as asterisk does expect it to be in a sub-directory of its source tree,
# which do by copying the full menuselect build tree as a pre-configure
# hook in the target variant.
define HOST_ASTERISK_INSTALL_CMDS
	@:
endef

$(eval $(host-autotools-package))
