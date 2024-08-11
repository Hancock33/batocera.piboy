################################################################################
#
# alllinuxfirmwares
#
################################################################################
# Version: Commits on Aug 11, 2024
ALLLINUXFIRMWARES_VERSION = 20240811
ALLLINUXFIRMWARES_SOURCE = linux-firmware-$(ALLLINUXFIRMWARES_VERSION).tar.gz
ALLLINUXFIRMWARES_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot

# exclude some dirs not required on batocera
ALLLINUXFIRMWARES_REMOVE_DIRS = $(@D)/bnx2* \
								$(@D)/cxgb4 \
								$(@D)/dpaa2 \
								$(@D)/liquidio \
								$(@D)/mellanox \
								$(@D)/mrvl/prestera \
								$(@D)/myri* \
								$(@D)/netronome \
								$(@D)/phanfw.bin \
								$(@D)/qcom \
								$(@D)/ql2* \
								$(@D)/qed \
								$(@D)/s5p-mfc* \
								$(@D)/ueagle-atm \
								$(@D)/LICENCE* \
								$(@D)/LICENSE*

ifeq ($(BR2_arm)$(BR2_aarch64),y)
	ALLLINUXFIRMWARES_REMOVE_DIRS += $(@D)/*-fw-usb-*.sbcf \
									$(@D)/amd \
									$(@D)/amdgpu \
									$(@D)/ath10k \
									$(@D)/ath11k \
									$(@D)/ath12k \
									$(@D)/c*.bin \
									$(@D)/cypress \
									$(@D)/i915 \
									$(@D)/intel \
									$(@D)/iwlwifi* \
									$(@D)/nvidia \
									$(@D)/q*.bin \
									$(@D)/qat_* \
									$(@D)/radeon
endif

ifeq ($(BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI)$(BR2_PACKAGE_EXTRALINUXFIRMWARES),y)
	ALLLINUXFIRMWARES_REMOVE_DIRS += $(@D)/brcm
endif

define ALLLINUXFIRMWARES_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/lib/firmware

	# exclude some dirs not required on batocera
	rm -rf $(ALLLINUXFIRMWARES_REMOVE_DIRS)

	# -n is mandatory while some other packages provides firmwares too
	# this is not ideal, but i don't know how to tell to buildroot to install this package first (and not worry about all packages installing firmwares)
	cp --remove-destination -prn $(@D)/* $(TARGET_DIR)/lib/firmware/

	# Some firmware are distributed as a symlink, for drivers to load them using a
	# defined name other than the real one. Since 9cfefbd7fbda ("Remove duplicate
	# symlinks") those symlink aren't distributed in linux-firmware but are created
	# automatically by its copy-firmware.sh script during the installation, which
	# parses the WHENCE file where symlinks are described. We follow the same logic
	# here, adding symlink only for firmwares installed in the target directory.
	cd $(TARGET_DIR)/lib/firmware ; \
	sed -r -e '/^Link: (.+) -> (.+)$$/!d; s//\1 \2/' $(@D)/WHENCE | \
	while read f d; do \
		if test -f $$(readlink -m $$(dirname "$$f")/$$d); then \
			if test -f $(TARGET_DIR)/lib/firmware/$$(dirname "$$f")/$$d; then \
				ln -sf $$d "$$f" || exit 1; \
			fi \
		fi ; \
	done
endef

define BATOCERA_STEAM_DECK_OLED_FW
	mkdir -p $(TARGET_DIR)/lib/firmware
	tar -xf $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/firmwares/alllinuxfirmwares/steamdeck-oled-firmware.tar.xz -C $(TARGET_DIR)/lib/firmware
endef

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_ANY),y)
	ALLLINUXFIRMWARES_POST_INSTALL_TARGET_HOOKS += BATOCERA_STEAM_DECK_OLED_FW
endif

$(eval $(generic-package))
