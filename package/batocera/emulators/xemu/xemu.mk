################################################################################
#
# xemu
#
################################################################################
# Version: Commits on Sept 20, 2025
XEMU_VERSION = v0.8.103
XEMU_SITE = https://github.com/xemu-project/xemu.git
XEMU_SITE_METHOD = git
XEMU_GIT_SUBMODULES = YES
XEMU_LICENSE = GPLv2
XEMU_DEPENDENCIES = host-cmake host-meson host-pkgconf host-python-distlib host-python-pyyaml host-python3
XEMU_DEPENDENCIES += json-for-modern-cpp libcurl libepoxy libglib2 libgtk3 libpcap libsamplerate sdl2 slirp zlib

XEMU_EXTRA_DOWNLOADS = https://github.com/mborgerson/xemu-hdd-image/releases/download/1.0/xbox_hdd.qcow2.zip

XEMU_CONF_ENV += PATH="/$(BR2_ARCH)/host/$(BR2_ARCH)-buildroot-linux-gnu/sysroot/usr/bin:$$PATH"

XEMU_CONF_OPTS += --target-list=i386-softmmu
XEMU_CONF_OPTS += --cross-prefix="$(STAGING_DIR)"
XEMU_CONF_OPTS += --extra-cflags="-DXBOX=1"
XEMU_CONF_OPTS += --disable-werror
XEMU_CONF_OPTS += --enable-lto

# Vulkan
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86),y)
XEMU_DEPENDENCIES += vulkan-headers vulkan-loader
endif

# AVX2 is only available on x86_64_v3 or more
ifeq ($(BR2_x86_x86_64_v3),y)
XEMU_CONF_OPTS += --enable-avx2
else
XEMU_CONF_OPTS += --disable-avx2
endif

define XEMU_CONFIGURE_CMDS
	cd $(@D) && $(TARGET_CONFIGURE_OPTS) SSL_CERT_DIR=/etc/ssl/certs ./configure $(XEMU_CONF_OPTS)
endef

define XEMU_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		CC_FOR_BUILD="$(TARGET_CC)" GCC_FOR_BUILD="$(TARGET_CC)" \
		CXX_FOR_BUILD="$(TARGET_CXX)" LD_FOR_BUILD="$(TARGET_LD)" \
		CROSS_COMPILE="$(STAGING_DIR)/usr/bin/" \
		PREFIX="/$(BR2_ARCH)/host/$(BR2_ARCH)-buildroot-linux-gnu/sysroot/" \
		PKG_CONFIG="/$(BR2_ARCH)/host/$(BR2_ARCH)-buildroot-linux-gnu/sysroot/usr/bin/pkg-config" \
		$(MAKE) -C $(@D)
endef

define XEMU_INSTALL_TARGET_CMDS
	# Binaries
	cp $(@D)/build/qemu-system-i386 $(TARGET_DIR)/usr/bin/xemu

	# XEmu app data
	mkdir -p $(TARGET_DIR)/usr/share/xemu/data
	cp $(@D)/data/* $(TARGET_DIR)/usr/share/xemu/data/
	$(UNZIP) -ob $(XEMU_DL_DIR)/xbox_hdd.qcow2.zip xbox_hdd.qcow2 -d $(TARGET_DIR)/usr/share/xemu/data
endef

define XEMU_VERSION_DETAILS
	git -C $(XEMU_DL_DIR)/git rev-parse HEAD 2>/dev/null | tr -d '\n' > $(@D)/XEMU_COMMIT
	git -C $(XEMU_DL_DIR)/git symbolic-ref --short HEAD | cut -d'/' -f2- > $(@D)/XEMU_BRANCH
	git -C $(XEMU_DL_DIR)/git describe --tags --match 'v*' | cut -c 2- | tr -d '\n' > $(@D)/XEMU_VERSION
endef

# details in the .wrap files
define XEMU_GET_SUBMODULES
	# imgui
	mkdir -p $(@D)/subprojects/imgui
	$(eval REVISION = $(shell grep -Po '(?<=^revision=).+' $(@D)/subprojects/imgui.wrap))
	curl -L -o imgui.tar.gz \
		https://github.com/xemu-project/imgui/archive/$(REVISION).tar.gz
	$(TAR) -xzf imgui.tar.gz --strip-components=1 -C $(@D)/subprojects/imgui
	rm imgui.tar.gz

	# implot
	mkdir -p $(@D)/subprojects/implot
	$(eval REVISION = $(shell grep -Po '(?<=^revision=).+' $(@D)/subprojects/implot.wrap))
	curl -L -o implot.tar.gz \
		https://github.com/xemu-project/implot/archive/$(REVISION).tar.gz
	$(TAR) -xzf implot.tar.gz --strip-components=1 -C $(@D)/subprojects/implot
	rm implot.tar.gz

	# genconfig
	mkdir -p $(@D)/subprojects/genconfig
	$(eval REVISION = $(shell grep -Po '(?<=^revision=).+' $(@D)/subprojects/genconfig.wrap))
	curl -L -o genconfig.tar.gz \
		https://github.com/mborgerson/genconfig/archive/$(REVISION).tar.gz
	$(TAR) -xzf genconfig.tar.gz --strip-components=1 -C $(@D)/subprojects/genconfig
	rm genconfig.tar.gz

	# tomlplusplus
	mkdir -p $(@D)/subprojects/tomlplusplus
	curl -L -o tomlplusplus.tar.gz \
		https://github.com/marzer/tomlplusplus/archive/refs/tags/v3.4.0.tar.gz
	$(TAR) -xzf tomlplusplus.tar.gz --strip-components=1 -C $(@D)/subprojects/tomlplusplus
	rm tomlplusplus.tar.gz

	# glslang
	mkdir -p $(@D)/subprojects/glslang
	curl -L -o glslang.tar.gz \
		https://github.com/KhronosGroup/glslang/archive/refs/tags/15.4.0.tar.gz
	$(TAR) -xzf glslang.tar.gz --strip-components=1 -C $(@D)/subprojects/glslang
	rm glslang.tar.gz

	# xxhash
	mkdir -p $(@D)/subprojects/xxHash-0.8.3
	curl -L -o xxhash.tar.gz \
		http://github.com/mesonbuild/wrapdb/releases/download/xxhash_0.8.3-1/xxHash-0.8.3.tar.gz
	$(TAR) -xzf xxhash.tar.gz --strip-components=1 -C $(@D)/subprojects/xxHash-0.8.3
	rm xxhash.tar.gz

	# xxhash patch
	curl -L -o xxhash_0.8.3-1_patch.zip \
		https://wrapdb.mesonbuild.com/v2/xxhash_0.8.3-1/get_patch
	$(UNZIP) -o xxhash_0.8.3-1_patch.zip -d $(@D)/subprojects
	rm xxhash_0.8.3-1_patch.zip

	# keycodemapdb - revision variation
	mkdir -p $(@D)/subprojects/keycodemapdb
	$(eval REVISION = $(shell grep -Po '(?<=^revision = ).+' $(@D)/subprojects/keycodemapdb.wrap))
	curl -L -o keycodemapdb.tar.gz \
		https://gitlab.com/qemu-project/keycodemapdb/-/archive/$(REVISION)/$(REVISION).tar.gz
	$(TAR) -xzf keycodemapdb.tar.gz --strip-components=1 -C $(@D)/subprojects/keycodemapdb
	rm keycodemapdb.tar.gz

	# nv2a_vsh_cpu
	mkdir -p $(@D)/subprojects/nv2a_vsh_cpu
	$(eval REVISION = $(shell grep -Po '(?<=^revision=).+' $(@D)/subprojects/nv2a_vsh_cpu.wrap))
	curl -L -o nv2a_vsh_cpu.tar.gz \
		https://github.com/xemu-project/nv2a_vsh_cpu/archive/$(REVISION).tar.gz
	$(TAR) -xzf nv2a_vsh_cpu.tar.gz --strip-components=1 -C $(@D)/subprojects/nv2a_vsh_cpu
	rm nv2a_vsh_cpu.tar.gz

	# berkeley-softfloat-3 - revision variation
	mkdir -p $(@D)/subprojects/berkeley-softfloat-3
	curl -L -o berkeley-softfloat-3.tar.gz \
		https://gitlab.com/qemu-project/berkeley-softfloat-3/-/archive/master/berkeley-softfloat-3-master.tar.gz
	$(TAR) -xzf berkeley-softfloat-3.tar.gz --strip-components=1 -C $(@D)/subprojects/berkeley-softfloat-3
	cp $(@D)/subprojects/packagefiles/berkeley-softfloat-3/* $(@D)/subprojects/berkeley-softfloat-3
	rm berkeley-softfloat-3.tar.gz

	# berkeley-testfloat-3 - revision variation
	mkdir -p $(@D)/subprojects/berkeley-testfloat-3
	$(eval REVISION = $(shell grep -Po '(?<=^revision = ).+' $(@D)/subprojects/berkeley-testfloat-3.wrap))
	curl -L -o berkeley-testfloat-3.tar.gz \
		https://gitlab.com/qemu-project/berkeley-testfloat-3/-/archive/$(REVISION)/$(REVISION).tar.gz
	$(TAR) -xzf berkeley-testfloat-3.tar.gz --strip-components=1 -C $(@D)/subprojects/berkeley-testfloat-3
	cp $(@D)/subprojects/packagefiles/berkeley-testfloat-3/* $(@D)/subprojects/berkeley-testfloat-3
	rm berkeley-testfloat-3.tar.gz

	# volk
	mkdir -p $(@D)/subprojects/volk
	curl -L -o volk.tar.gz \
		https://github.com/zeux/volk/archive/refs/tags/vulkan-sdk-1.4.321.0.tar.gz
	$(TAR) -xzf volk.tar.gz --strip-components=1 -C $(@D)/subprojects/volk
	rm volk.tar.gz

	# SPIRV-Reflect
	mkdir -p $(@D)/subprojects/SPIRV-Reflect
	curl -L -o SPIRV-Reflect.tar.gz \
	https://github.com/KhronosGroup/SPIRV-Reflect/archive/refs/tags/vulkan-sdk-1.4.321.0.tar.gz
	$(TAR) -xzf SPIRV-Reflect.tar.gz --strip-components=1 -C $(@D)/subprojects/SPIRV-Reflect
	rm SPIRV-Reflect.tar.gz

	# VulkanMemoryAllocator
	mkdir -p $(@D)/subprojects/VulkanMemoryAllocator
	curl -L -o VulkanMemoryAllocator.tar.gz \
	https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator/archive/refs/tags/v3.3.0.tar.gz
	$(TAR) -xzf VulkanMemoryAllocator.tar.gz --strip-components=1 -C $(@D)/subprojects/VulkanMemoryAllocator
	rm VulkanMemoryAllocator.tar.gz
endef

XEMU_PRE_CONFIGURE_HOOKS = XEMU_VERSION_DETAILS
XEMU_PRE_CONFIGURE_HOOKS += XEMU_GET_SUBMODULES

$(eval $(autotools-package))
