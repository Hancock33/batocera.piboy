################################################################################
#
# alllinuxfirmwares
#
################################################################################
# Version: Commits on Nov 25, 2025
ALLLINUXFIRMWARES_VERSION = 20251125
ALLLINUXFIRMWARES_SOURCE = linux-firmware-$(ALLLINUXFIRMWARES_VERSION).tar.gz
ALLLINUXFIRMWARES_SITE = https://www.kernel.org/pub/linux/kernel/firmware

ifeq ($(BR2_PACKAGE_FIRMWARE_ARMBIAN),y)
ALLLINUXFIRMWARES_DEPENDENCIES += firmware-armbian
endif

ifeq ($(BR2_PACKAGE_FIRMWARE_ORANGEPI),y)
ALLLINUXFIRMWARES_DEPENDENCIES += firmware-orangepi
endif

# These folders contain massive blobs for 40Gb/100Gb SmartNICs and Mainframes.rs not required on batocera
ALLLINUXFIRMWARES_REMOVE_DIRS = $(@D)/bnx2* \
								$(@D)/cavium \
								$(@D)/cxgb4 \
								$(@D)/dpaa2 \
								$(@D)/liquidio \
								$(@D)/mellanox \
								$(@D)/mrvl/prestera \
								$(@D)/myri* \
								$(@D)/netronome \
								$(@D)/nfp \
								$(@D)/pensando \
								$(@D)/phanfw.bin \
								$(@D)/qcom \
								$(@D)/qed \
								$(@D)/ql2* \
								$(@D)/qlogic \
								$(@D)/s5p-mfc* \
								$(@D)/ti-keystone \
								$(@D)/ti-connectivity \
								$(@D)/ueagle-atm \
								$(@D)/LICENCE* \
								$(@D)/LICENSE*

# Remove strictly ARM/Mobile SoC components
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
ALLLINUXFIRMWARES_REMOVE_DIRS += $(@D)/airoha \
								$(@D)/amlogic \
								$(@D)/amphion \
								$(@D)/apple \
								$(@D)/arm \
								$(@D)/cadence \
								$(@D)/cis \
								$(@D)/cnm \
								$(@D)/dsp56k \
								$(@D)/imx \
								$(@D)/inside-secure \
								$(@D)/ixp4xx \
								$(@D)/meson \
								$(@D)/microchip \
								$(@D)/nvidia/tegra \
								$(@D)/nxp \
								$(@D)/powervr \
								$(@D)/rockchip \
								$(@D)/starfive \
								$(@D)/sun \
								$(@D)/sunxi \
								$(@D)/sxg \
								$(@D)/ti \
								$(@D)/v3d \
								$(@D)/vc4 \
								$(@D)/vicam
endif

# This removes strictly ARM/RISC-V SoC components while preserving all Wi-Fi/BT.
ifeq ($(BR2_arm)$(BR2_aarch64),y)
ALLLINUXFIRMWARES_REMOVE_DIRS += $(@D)/*-fw-usb-*.sbcf \
								$(@D)/3com \
								$(@D)/acenic \
								$(@D)/adaptec \
								$(@D)/advansys \
								$(@D)/amd-ucode \
								$(@D)/amd* \
								$(@D)/apple \
								$(@D)/ath10k \
								$(@D)/ath11k \
								$(@D)/ath12k \
								$(@D)/c*.bin \
								$(@D)/cis \
								$(@D)/dsp56k \
								$(@D)/HP \
								$(@D)/i915 \
								$(@D)/intel \
								$(@D)/iwlwifi* \
								$(@D)/LENOVO \
								$(@D)/matrox \
								$(@D)/nvidia \
								$(@D)/q*.bin \
								$(@D)/qat_* \
								$(@D)/radeon \
								$(@D)/xe \
								$(@D)/yamaha
	# Prune other ARM SoC vendors if building a specific ARM target
	ifneq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3588)$(BR2_PACKAGE_BATOCERA_TARGET_AMLOGIC_ANY),y)
		ALLLINUXFIRMWARES_REMOVE_DIRS += \
		$(@D)/rockchip $(@D)/amlogic $(@D)/meson $(@D)/sunxi \
		$(@D)/nxp $(@D)/imx $(@D)/starfive $(@D)/powervr \
		$(@D)/airoha $(@D)/amphion $(@D)/cadence $(@D)/ar3k
	endif
endif

# Remove Broadcom if RPi/External firmware is already handling it
ifeq ($(BR2_PACKAGE_EXTRALINUXFIRMWARES),y)
    ALLLINUXFIRMWARES_REMOVE_DIRS += $(@D)/brcm
endif

# Remove qualcomm firmware if not buidling Qualcomm Board
ifneq ($(BR2_PACKAGE_BATOCERA_TARGET_ODIN)$(BR2_PACKAGE_BATOCERA_TARGET_QCS6490)$(BR2_PACKAGE_BATOCERA_TARGET_SM8250)$(BR2_PACKAGE_BATOCERA_TARGET_SM8550),y)
    ALLLINUXFIRMWARES_REMOVE_DIRS += $(@D)/qcom
endif

# Remove amlogic firmware if not building an Amlogic board
ifneq ($(BR2_PACKAGE_BATOCERA_TARGET_AMLOGIC_ANY),y)
    ALLLINUXFIRMWARES_REMOVE_DIRS += $(@D)/amlogic
endif

define ALLLINUXFIRMWARES_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/lib/firmware

	# Exclude defined directories
	rm -rf $(ALLLINUXFIRMWARES_REMOVE_DIRS)

	# RK3588 specific: Keep only Bluetooth 'ibt-*' from the Intel folder
	if [ "$BR2_PACKAGE_BATOCERA_TARGET_RK3588" = "y" ] || [ "$BR2_PACKAGE_BATOCERA_TARGET_RK3588_SDIO" = "y" ]; then \
		find $(@D)/intel -type f ! -name 'ibt-*' -delete; \
	fi

	# -n is mandatory while some other packages provides firmwares too
	# this is not ideal, but i don't know how to tell to buildroot to install this package first
	# (and not worry about all packages installing firmwares)
	rsync -au --checksum $(@D)/ $(TARGET_DIR)/lib/firmware/

	# Logic for X86_64: Prune ARM blobs inside folders used by both
	if [ "$(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY)" = "y" ]; then \
		rm -rf $(TARGET_DIR)/lib/firmware/mediatek/mt81*; \
		rm -rf $(TARGET_DIR)/lib/firmware/mediatek/sof*; \
		rm -rf $(TARGET_DIR)/lib/firmware/mrvl/cpt*; \
		rm -f $(TARGET_DIR)/lib/firmware/a300_*.fw; \
		rm -f $(TARGET_DIR)/lib/firmware/*.inp; \
		rm -f $(TARGET_DIR)/lib/firmware/lt9611uxc_fw.bin; \
	fi

	# Logic for ARM SM8250: Prune other QCOM SoCs, keep only sm8250 folder
	if [ "$(BR2_PACKAGE_BATOCERA_TARGET_SM8250)" = "y" ]; then \
		find $(TARGET_DIR)/lib/firmware/qcom -maxdepth 1 -type d ! -name "sm8250" ! -name "qcom" -exec rm -rf {} +; \
		rm -f $(TARGET_DIR)/lib/firmware/a300_*.fw; \
		rm -f $(TARGET_DIR)/lib/firmware/a420_*.fw; \
		rm -f $(TARGET_DIR)/lib/firmware/a530_*.fw; \
		rm -f $(TARGET_DIR)/lib/firmware/yamato_*.fw; \
		rm -f $(TARGET_DIR)/lib/firmware/leia_*.fw; \
	fi


	# Some firmware are distributed as a symlink, for drivers to load them using a
	# defined name other than the real one. Since 9cfefbd7fbda ("Remove duplicate
	# symlinks") those symlink aren't distributed in linux-firmware but are created
	# automatically by its copy-firmware.sh script during the installation, which
	# parses the WHENCE file where symlinks are described. We follow the same logic
	# here, adding symlink only for firmwares installed in the target directory.
	cd $(TARGET_DIR)/lib/firmware ; \
	sed -r -e '/^Link: (.+) -> (.+)$$/!d; s//\1 \2/' $(@D)/WHENCE | \
	while read -r f d; do \
		if test -f "$$(readlink -m "$$(dirname "$$f")/$${d}")"; then \
			mkdir -p "$$(dirname "$$f")" && \
			ln -sf "$$d" "$$f" || exit 1; \
		fi ; \
	done
endef

# symlink AMD GPU firmware for 890M devices
define ALLLINUXFIRMWARES_FIX_AMD_890M
	ln -sf /lib/firmware/amdgpu/isp_4_1_1.bin $(TARGET_DIR)/lib/firmware/amdgpu/isp_4_1_0.bin
endef

# symlink Bee-Link SER9 for a BIOS / firmware bug
define ALLLINUXFIRMWARES_FIX_SER9
	mkdir -p $(TARGET_DIR)/usr/share/batocera/firmware
	mkdir -p $(TARGET_DIR)/etc/init.d
	mkdir -p $(TARGET_DIR)/usr/share/batocera/firmware
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/firmwares/alllinuxfirmwares/dcn_3_5_dmcub.bin $(TARGET_DIR)/usr/share/batocera/firmware/dcn_3_5_dmcub.bin
	$(INSTALL) -m 0755 -D $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/firmwares/alllinuxfirmwares/S03firmware $(TARGET_DIR)/etc/init.d/
endef

# Realtek BT symlinks for RK3588 kernel compatibility
define ALLLINUXFIRMWARES_LINK_RTL_BT
    ln -sf /lib/firmware/rtl_bt/rtl8852bu_fw.bin $(TARGET_DIR)/lib/firmware/rtl8852bu_fw
    ln -sf /lib/firmware/rtl_bt/rtl8852bu_config.bin $(TARGET_DIR)/lib/firmware/rtl8852bu_config
endef

# Apply hooks based on architecture
ifeq ($(BR2_x86_64),y)
    ALLLINUXFIRMWARES_POST_INSTALL_TARGET_HOOKS += ALLLINUXFIRMWARES_FIX_AMD_890M
    ALLLINUXFIRMWARES_POST_INSTALL_TARGET_HOOKS += ALLLINUXFIRMWARES_FIX_SER9
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3588)$(BR2_PACKAGE_BATOCERA_TARGET_RK3588_SDIO),y)
    ALLLINUXFIRMWARES_POST_INSTALL_TARGET_HOOKS += ALLLINUXFIRMWARES_LINK_RTL_BT
endif

$(eval $(generic-package))
