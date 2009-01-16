#############################################################
#
# mrouted
#
#
#############################################################
MROUTED_VERSION:=3.9-beta3.orig
MROUTED_SOURCE:=mrouted_$(MROUTED_VERSION).tar.gz
MROUTED_SITE:=http://archive.debian.org/debian-archive/pool/non-free/m/mrouted/
MROUTED_DIR:=$(BUILD_DIR)/mrouted-$(MROUTED_VERSION)
MROUTED_CAT:=$(ZCAT)
MROUTED_PATCH:=mrouted_3.9-beta3-1.1.diff.gz
MROUTED_BINARY:=mrouted
MROUTED_TARGET_BINARY:=usr/sbin/mrouted

$(DL_DIR)/$(MROUTED_SOURCE):
	 $(call DOWNLOAD,$(MROUTED_SITE),$(MROUTED_SOURCE))

$(DL_DIR)/$(MROUTED_PATCH):
	 $(call DOWNLOAD,$(MROUTED_SITE),$(MROUTED_PATCH))

$(MROUTED_DIR)/.unpacked: $(DL_DIR)/$(MROUTED_SOURCE) $(DL_DIR)/$(MROUTED_PATCH)
	$(MROUTED_CAT) $(DL_DIR)/$(MROUTED_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	$(MROUTED_CAT) $(DL_DIR)/$(MROUTED_PATCH) | patch -p1 -d $(MROUTED_DIR)
	toolchain/patch-kernel.sh $(MROUTED_DIR) package/mrouted/ mrouted\*.patch
	touch $(MROUTED_DIR)/.unpacked

$(MROUTED_DIR)/$(MROUTED_BINARY): $(MROUTED_DIR)/.unpacked
	$(TARGET_CONFIGURE_OPTS) \
	$(MAKE) CC=$(TARGET_CC) -C $(MROUTED_DIR)

$(TARGET_DIR)/$(MROUTED_TARGET_BINARY): $(MROUTED_DIR)/$(MROUTED_BINARY)
	cp -a $(MROUTED_DIR)/$(MROUTED_BINARY) $(TARGET_DIR)/$(MROUTED_TARGET_BINARY)

mrouted: uclibc $(TARGET_DIR)/$(MROUTED_TARGET_BINARY)

mrouted-source: $(DL_DIR)/$(MROUTED_SOURCE) $(DL_DIR)/$(MROUTED_PATCH)

mrouted-unpacked: $(MROUTED_DIR)/.unpacked

mrouted-clean:
	rm -f $(TARGET_DIR)/$(MROUTED_TARGET_BINARY)
	-$(MAKE) -C $(MROUTED_DIR) clean

mrouted-dirclean:
	rm -rf $(MROUTED_DIR)

#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(BR2_PACKAGE_MROUTED),y)
TARGETS+=mrouted
endif
