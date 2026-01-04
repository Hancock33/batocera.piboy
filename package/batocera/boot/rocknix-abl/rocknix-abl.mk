################################################################################
#
# rocknix-abl
#
################################################################################

# Version: Commits on Jan 04, 2026
ROCKNIX_ABL_VERSION = ed836fed0d56dbd7c5d53182918e590789a66c53
ROCKNIX_ABL_SITE = $(call github,ROCKNIX,abl,$(ROCKNIX_ABL_VERSION))

# Handle sm8650 & sm6115 in future
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_SM8250),y)
ROCKNIX_ABL_MODEL = SM8250
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_SM8550),y)
ROCKNIX_ABL_MODEL = SM8550
endif

define ROCKNIX_ABL_INSTALL_TARGET_CMDS
	$(if $(ROCKNIX_ABL_MODEL), \
		mkdir -p $(TARGET_DIR)/usr/share/bootloader/rocknix_abl ; \
		$(INSTALL) -m 0644 $(@D)/abl_signed-$(ROCKNIX_ABL_MODEL).elf \
			$(TARGET_DIR)/usr/share/bootloader/rocknix_abl/ ; \
		$(INSTALL) -m 0644 $(@D)/abl_signed-$(ROCKNIX_ABL_MODEL).elf.sha256 \
			$(TARGET_DIR)/usr/share/bootloader/rocknix_abl/ ; \
		$(INSTALL) -D -m 0755 $(ROCKNIX_ABL_PKGDIR)/updateabl \
			$(TARGET_DIR)/usr/bin/updateabl
	)
endef

$(eval $(generic-package))
