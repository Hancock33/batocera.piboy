################################################################################
#
# xemu
#
################################################################################
# Version: Commits on Jan 09, 2025
XEMU_VERSION = ebcacad78b496604291a168aa3bc64ac96823cf9
XEMU_SITE = https://github.com/xemu-project/xemu
XEMU_SITE_METHOD=git
XEMU_GIT_SUBMODULES=YES
XEMU_LICENSE = GPLv2
XEMU_DEPENDENCIES = libepoxy libgtk3 libpcap libsamplerate pixman sdl2 slirp

XEMU_EXTRA_DOWNLOADS = https://github.com/mborgerson/xemu-hdd-image/releases/download/1.0/xbox_hdd.qcow2.zip

XEMU_CONF_ENV += PATH="/x86_64/host/x86_64-buildroot-linux-gnu/sysroot/usr/bin:$$PATH"

XEMU_CONF_OPTS += --target-list=i386-softmmu
XEMU_CONF_OPTS += --cross-prefix="$(STAGING_DIR)"
XEMU_CONF_OPTS += --extra-cflags="-DXBOX=1 $(TARGET_OPTIMIZATION) -Wno-error=redundant-decls -Wno-error=unused-but-set-variable"
XEMU_CONF_OPTS += --extra-ldflags=""
XEMU_CONF_OPTS += --enable-sdl
XEMU_CONF_OPTS += --enable-opengl
XEMU_CONF_OPTS += --enable-trace-backends="nop"
XEMU_CONF_OPTS += --disable-kvm
XEMU_CONF_OPTS += --disable-xen
XEMU_CONF_OPTS += --disable-werror
XEMU_CONF_OPTS += --disable-curl
XEMU_CONF_OPTS += --disable-vnc
XEMU_CONF_OPTS += --disable-vnc-sasl
XEMU_CONF_OPTS += --disable-docs
XEMU_CONF_OPTS += --disable-tools
XEMU_CONF_OPTS += --disable-guest-agent
XEMU_CONF_OPTS += --disable-tpm
XEMU_CONF_OPTS += --disable-rdma
XEMU_CONF_OPTS += --disable-replication
XEMU_CONF_OPTS += --disable-capstone
XEMU_CONF_OPTS += --disable-libiscsi
XEMU_CONF_OPTS += --disable-spice
XEMU_CONF_OPTS += --disable-user
XEMU_CONF_OPTS += --disable-stack-protector
XEMU_CONF_OPTS += --disable-glusterfs
XEMU_CONF_OPTS += --disable-curses
XEMU_CONF_OPTS += --disable-gnutls
XEMU_CONF_OPTS += --disable-nettle
XEMU_CONF_OPTS += --disable-gcrypt
XEMU_CONF_OPTS += --disable-crypto-afalg
XEMU_CONF_OPTS += --disable-virglrenderer
XEMU_CONF_OPTS += --disable-vhost-net
XEMU_CONF_OPTS += --disable-vhost-crypto
XEMU_CONF_OPTS += --disable-vhost-user
XEMU_CONF_OPTS += --disable-virtfs
XEMU_CONF_OPTS += --disable-snappy
XEMU_CONF_OPTS += --disable-bzip2
XEMU_CONF_OPTS += --disable-vde
XEMU_CONF_OPTS += --disable-seccomp
XEMU_CONF_OPTS += --disable-numa
XEMU_CONF_OPTS += --disable-lzo
XEMU_CONF_OPTS += --disable-smartcard
XEMU_CONF_OPTS += --disable-usb-redir
XEMU_CONF_OPTS += --disable-bochs
XEMU_CONF_OPTS += --disable-cloop
XEMU_CONF_OPTS += --disable-dmg
XEMU_CONF_OPTS += --disable-vdi
XEMU_CONF_OPTS += --disable-vvfat
XEMU_CONF_OPTS += --disable-qcow1
XEMU_CONF_OPTS += --disable-qed
XEMU_CONF_OPTS += --disable-parallels
XEMU_CONF_OPTS += --disable-hvf
XEMU_CONF_OPTS += --disable-whpx
XEMU_CONF_OPTS += --with-default-devices
XEMU_CONF_OPTS += --disable-renderdoc
XEMU_CONF_OPTS += --enable-avx2

define XEMU_CONFIGURE_CMDS
	cd $(@D) && $(TARGET_CONFIGURE_OPTS) SSL_CERT_DIR=/etc/ssl/certs ./configure $(XEMU_CONF_OPTS)
endef

define XEMU_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		CC_FOR_BUILD="$(TARGET_CC)" GCC_FOR_BUILD="$(TARGET_CC)" \
		CXX_FOR_BUILD="$(TARGET_CXX)" LD_FOR_BUILD="$(TARGET_LD)" \
				CROSS_COMPILE="$(STAGING_DIR)/usr/bin/" \
				PREFIX="/x86_64/host/x86_64-buildroot-linux-gnu/sysroot/" \
				PKG_CONFIG="/x86_64/host/x86_64-buildroot-linux-gnu/sysroot/usr/bin/pkg-config" \
		$(MAKE) -C $(@D)
endef

define XEMU_INSTALL_TARGET_CMDS
	# Binaries
	cp $(@D)/build/qemu-system-i386 $(TARGET_DIR)/usr/bin/xemu

	# Xemu app data
	mkdir -p $(TARGET_DIR)/usr/share/xemu/data
	cp $(@D)/data/* $(TARGET_DIR)/usr/share/xemu/data/
	$(UNZIP) -ob $(XEMU_DL_DIR)/xbox_hdd.qcow2.zip xbox_hdd.qcow2 -d $(TARGET_DIR)/usr/share/xemu/data
endef

XEMU_SUBMODULES=berkeley-softfloat-3 berkeley-testfloat-3 cpp-httplib genconfig imgui implot keycodemapdb nv2a_vsh_cpu tomlplusplus
define XEMU_SUBMODULES_DL
	for set in $(XEMU_SUBMODULES); do \
		rm -rf $(@D)/subprojects/$$set; \
	done

	# Download submodules
	cd $(@D)/subprojects && git clone https://gitlab.com/qemu-project/berkeley-softfloat-3
	cd $(@D)/subprojects && git clone https://gitlab.com/qemu-project/berkeley-testfloat-3.git
	cd $(@D)/subprojects && git clone https://github.com/yhirose/cpp-httplib
	cd $(@D)/subprojects && git clone https://github.com/mborgerson/genconfig
	cd $(@D)/subprojects && git clone https://github.com/xemu-project/imgui
	cd $(@D)/subprojects && git clone https://github.com/xemu-project/implot
	cd $(@D)/subprojects && git clone https://gitlab.com/qemu-project/keycodemapdb
	cd $(@D)/subprojects && git clone https://github.com/xemu-project/nv2a_vsh_cpu
	cd $(@D)/subprojects && git clone https://github.com/marzer/tomlplusplus
	# Patch submodules
	cd $(@D)/subprojects/implot && git checkout 006a1c23e5706bbe816968163b4d589162257a57
	cp -a $(@D)/subprojects/packagefiles/berkeley-softfloat-3/* $(@D)/subprojects/berkeley-softfloat-3
	cp -a $(@D)/subprojects/packagefiles/berkeley-testfloat-3/* $(@D)/subprojects/berkeley-testfloat-3
endef

define XEMU_VERSION_DETAILS
	$(GIT) -C $(XEMU_DL_DIR)/git rev-parse HEAD 2>/dev/null | tr -d '\n' > $(@D)/XEMU_COMMIT
	$(GIT) -C $(XEMU_DL_DIR)/git symbolic-ref --short HEAD | cut -d'/' -f2- > $(@D)/XEMU_BRANCH
	$(GIT) -C $(XEMU_DL_DIR)/git describe --tags --match 'v*' | cut -c 2- | tr -d '\n' > $(@D)/XEMU_VERSION
endef

define XEMU_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/xemu/*.keys $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/xemu/xbox.xemu.keys $(TARGET_DIR)/usr/share/evmapy/chihiro.keys
endef

XEMU_POST_EXTRACT_HOOKS = XEMU_SUBMODULES_DL
XEMU_PRE_CONFIGURE_HOOKS = XEMU_VERSION_DETAILS
XEMU_POST_INSTALL_TARGET_HOOKS += XEMU_EVMAPY

$(eval $(autotools-package))
