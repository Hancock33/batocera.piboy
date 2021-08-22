################################################################################
#
# gl4es
#
################################################################################
# Version.: Commits on Aug 04, 2021
GL4ES_VERSION = 2d3dc681ed3f54c76f626d9b674f836eef90f982
GL4ES_SITE = $(call github,ptitSeb,gl4es,$(GL4ES_VERSION))
GL4ES_LICENSE = MIT License

GL4ES_CONF_OPTS += -DODROID=1
GL4ES_CONF_OPTS += -DNOX11=ON

$(eval $(cmake-package))
