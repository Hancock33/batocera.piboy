#############################################################
#
# DataFlashBoot
#
#############################################################
DATAFLASHBOOT_VERSION:=1.05
DATAFLASHBOOT_NAME:=DataflashBoot-$(DATAFLASHBOOT_VERSION)
ATMEL_MIRROR:=$(call qstrip,$(BR2_ATMEL_MIRROR))
DATAFLASHBOOT_SITE:=$(ATMEL_MIRROR)
DATAFLASHBOOT_SOURCE:=$(DATAFLASHBOOT_NAME).tar.bz2
DATAFLASHBOOT_DIR:=$(BUILD_DIR)/$(DATAFLASHBOOT_NAME)
DATAFLASHBOOT_BINARY:=$(DATAFLASHBOOT_NAME).bin

$(DL_DIR)/$(DATAFLASHBOOT_SOURCE):
	 $(call DOWNLOAD,$(DATAFLASHBOOT_SITE),$(DATAFLASHBOOT_SOURCE))

$(DATAFLASHBOOT_DIR)/.unpacked: $(DL_DIR)/$(DATAFLASHBOOT_SOURCE)
	mkdir -p $(BUILD_DIR)
	ls $(DL_DIR)/$(DATAFLASHBOOT_SOURCE)
	$(BZCAT) $(DL_DIR)/$(DATAFLASHBOOT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	touch $(DATAFLASHBOOT_DIR)/.unpacked

$(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY): $(DATAFLASHBOOT_DIR)/.unpacked
	ls $(DATAFLASHBOOT_DIR)/.unpacked
	make -C $(DATAFLASHBOOT_DIR) CROSS_COMPILE=$(TARGET_CROSS)

DataflashBoot-clean:
	make -C $(DATAFLASHBOOT_DIR) clean

DataflashBoot-dirclean:
	rm -rf $(DATAFLASHBOOT_DIR)

dataflash:	 $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY)
	$(call COPY_FILE, $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY), $(TARGET_ATMEL_COPYTO),	$(BOARD_NAME)-$(DATAFLASHBOOT_BINARY))


#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(BR2_TARGET_DATAFLASHBOOT),y)
TARGETS+=dataflash
endif
