################################################################################
#
# nlohmann-json
#
################################################################################
# Version: Commits on Oct 02, 2022
NLOHMANN_JSON_VERSION = a3e6e26dc83a726b292f5be0492fcc408663ce55
NLOHMANN_JSON_SITE = https://github.com/nlohmann/json.git
NLOHMANN_JSON_SITE_METHOD=git
NLOHMANN_JSON_GIT_SUBMODULES=YES
NLOHMANN_JSON_LICENSE = GPLv2
NLOHMANN_JSON_INSTALL_STAGING = YES

NLOHMANN_JSON_CONF_OPTS += -DJSON_BuildTests=OFF

$(eval $(cmake-package))
