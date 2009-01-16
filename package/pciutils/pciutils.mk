#############################################################
#
# pciutils
#
#############################################################
PCIUTILS_VERSION:=3.0.1
PCIUTILS_SOURCE:=pciutils-$(PCIUTILS_VERSION).tar.gz
PCIUTILS_CAT:=$(ZCAT)
PCIUTILS_SITE:=ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
PCIUTILS_DIR:=$(BUILD_DIR)/pciutils-$(PCIUTILS_VERSION)

# Yet more targets...
PCIIDS_SITE:=http://pciids.sourceforge.net/
PCIIDS_SOURCE:=pci.ids.bz2
PCIIDS_CAT:=$(BZCAT)

ifeq ($(BR2_PACKAGE_ZLIB),y)
PCIUTILS_HAVE_ZLIB=yes
PCIIDS_FILE=pci.ids.gz
PCIIDS_COMPRESSOR=gzip -9 -c
else
PCIUTILS_HAVE_ZLIB=no
PCIIDS_FILE=pci.ids
PCIIDS_COMPRESSOR=cat
endif

$(DL_DIR)/$(PCIUTILS_SOURCE):
	 $(call DOWNLOAD,$(PCIUTILS_SITE),$(PCIUTILS_SOURCE))

$(DL_DIR)/$(PCIIDS_SOURCE):
	$(call DOWNLOAD,$(PCIIDS_SITE),$(PCIIDS_SOURCE))

$(PCIUTILS_DIR)/.unpacked: $(DL_DIR)/$(PCIUTILS_SOURCE) $(DL_DIR)/$(PCIIDS_SOURCE)
	$(PCIUTILS_CAT) $(DL_DIR)/$(PCIUTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	$(PCIIDS_CAT) $(DL_DIR)/$(PCIIDS_SOURCE) | $(PCIIDS_COMPRESSOR) > $(PCIUTILS_DIR)/$(PCIIDS_FILE)
	toolchain/patch-kernel.sh $(PCIUTILS_DIR) package/pciutils pciutils-$(PCIUTILS_VERSION)\*.patch
	#$(CONFIG_UPDATE) $(@D)
	$(SED) 's/uname -s/echo Linux/' \
		-e 's/uname -r/echo $(LINUX_HEADERS_VERSION)/' \
		$(PCIUTILS_DIR)/lib/configure
	touch $@

$(PCIUTILS_DIR)/.compiled: $(PCIUTILS_DIR)/.unpacked
	$(MAKE1) CC="$(TARGET_CC)" OPT="$(TARGET_CFLAGS)" RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(PCIUTILS_DIR) \
		SHAREDIR="/usr/share/misc" \
		ZLIB=$(PCIUTILS_HAVE_ZLIB) \
		PREFIX=/usr
	touch $@

$(TARGET_DIR)/sbin/lspci: $(PCIUTILS_DIR)/.compiled
	$(INSTALL) $(PCIUTILS_DIR)/lspci $(TARGET_DIR)/sbin/lspci
	$(STRIPCMD) $(STRIP_STRIP_ALL) $@

$(TARGET_DIR)/sbin/setpci: $(PCIUTILS_DIR)/.compiled
	$(INSTALL) $(PCIUTILS_DIR)/setpci $(TARGET_DIR)/sbin/setpci
	$(STRIPCMD) $(STRIP_STRIP_ALL) $@

$(TARGET_DIR)/usr/share/misc/$(PCIIDS_FILE): $(PCIUTILS_DIR)/.unpacked
	$(INSTALL) -D $(PCIUTILS_DIR)/$(PCIIDS_FILE) $@

pciutils: uclibc $(if $(BR2_PACKAGE_ZLIB),zlib) $(TARGET_DIR)/sbin/setpci $(TARGET_DIR)/sbin/lspci $(TARGET_DIR)/usr/share/misc/$(PCIIDS_FILE)

pciutils-source: $(DL_DIR)/$(PCIUTILS_SOURCE) $(DL_DIR)/$(PCIIDS_SOURCE)

pciutils-clean:
	-$(MAKE) -C $(PCIUTILS_DIR) clean
	rm -f $(TARGET_DIR)/sbin/lspci $(TARGET_DIR)/sbin/setpci $(TARGET_DIR)/usr/share/misc/pci.ids*

pciutils-dirclean:
	rm -rf $(PCIUTILS_DIR)

#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(BR2_PACKAGE_PCIUTILS),y)
TARGETS+=pciutils
endif
