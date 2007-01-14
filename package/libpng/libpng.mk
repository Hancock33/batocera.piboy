#############################################################
#
# libpng (Portable Network Graphic library)
#
#############################################################
# Copyright (C) 2001-2003 by Erik Andersen <andersen@codepoet.org>
# Copyright (C) 2002 by Tim Riker <Tim@Rikers.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU Library General Public License as
# published by the Free Software Foundation; either version 2 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# Library General Public License for more details.
#
# You should have received a copy of the GNU Library General Public
# License along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
# USA

LIBPNG_VER:=1.2.12
LIBPNG_DIR:=$(BUILD_DIR)/libpng-$(LIBPNG_VER)
LIBPNG_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
LIBPNG_SOURCE:=libpng-$(LIBPNG_VER).tar.bz2
LIBPNG_CAT:=$(BZCAT)

$(DL_DIR)/$(LIBPNG_SOURCE):
	 $(WGET) -P $(DL_DIR) $(LIBPNG_SITE)/$(LIBPNG_SOURCE)

libpng-source: $(DL_DIR)/$(LIBPNG_SOURCE)

$(LIBPNG_DIR)/.unpacked: $(DL_DIR)/$(LIBPNG_SOURCE)
	$(LIBPNG_CAT) $(DL_DIR)/$(LIBPNG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	touch $(LIBPNG_DIR)/.unpacked

$(LIBPNG_DIR)/.configured: $(LIBPNG_DIR)/.unpacked
	(cd $(LIBPNG_DIR); rm -rf config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		ac_cv_func_memcmp_working=yes \
		ac_cv_have_decl_malloc=yes \
		gl_cv_func_malloc_0_nonnull=yes \
		ac_cv_func_malloc_0_nonnull=yes \
		ac_cv_func_calloc_0_nonnull=yes \
		ac_cv_func_realloc_0_nonnull=yes \
		./configure \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--prefix=/usr \
		--exec-prefix=/usr \
		--bindir=/usr/bin \
		--sbindir=/usr/sbin \
		--libdir=/lib \
		--libexecdir=/usr/lib \
		--sysconfdir=/etc \
		--datadir=/usr/share \
		--localstatedir=/var \
		--includedir=/include \
		--mandir=/usr/man \
		--infodir=/usr/info \
		--without-libpng-compat \
		--without-x \
	);
	touch $(LIBPNG_DIR)/.configured

$(LIBPNG_DIR)/.compiled: $(LIBPNG_DIR)/.configured
	$(MAKE) -C $(LIBPNG_DIR)
	touch $(LIBPNG_DIR)/.compiled

$(STAGING_DIR)/lib/libpng.so: $(LIBPNG_DIR)/.compiled
	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBPNG_DIR) install;
	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libpng12.la
	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)\',g" \
		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/include/libpng12\',g" \
		"s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" \
		$(STAGING_DIR)/usr/bin/libpng12-config
	touch -c $(STAGING_DIR)/lib/libpng.so

$(TARGET_DIR)/usr/lib/libpng.so: $(STAGING_DIR)/lib/libpng.so
	cp -dpf $(STAGING_DIR)/lib/libpng*.so* $(TARGET_DIR)/usr/lib/
	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libpng.so

png libpng: uclibc zlib pkgconfig $(TARGET_DIR)/usr/lib/libpng.so

libpng-clean:
	-$(MAKE) -C $(LIBPNG_DIR) clean

libpng-dirclean:
	rm -rf $(LIBPNG_DIR)

#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(strip $(BR2_PACKAGE_LIBPNG)),y)
TARGETS+=libpng
endif
