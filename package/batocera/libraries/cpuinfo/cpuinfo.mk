################################################################################
#
# cpuinfo
#
################################################################################
# Version: Commits on Jun 02, 2024
CPUINFO_VERSION = 05332fd802d9109a2a151ec32154b107c1e5caf9
CPUINFO_SITE = $(call github,pytorch,cpuinfo,$(CPUINFO_VERSION))

CPUINFO_LICENSE = BSD-2-Clause
CPUINFO_INSTALL_STAGING = YES
CPUINFO_SUPPORTS_IN_SOURCE_BUILD = NO

CPUINFO_CONF_OPTS += -DCPUINFO_BUILD_TOOLS=OFF
CPUINFO_CONF_OPTS += -DCPUINFO_BUILD_UNIT_TESTS=OFF
CPUINFO_CONF_OPTS += -DCPUINFO_BUILD_MOCK_TESTS=OFF
CPUINFO_CONF_OPTS += -DCPUINFO_BUILD_BENCHMARKS=OFF
CPUINFO_CONF_OPTS += -DUSE_SYSTEM_LIBS=ON

$(eval $(cmake-package))
