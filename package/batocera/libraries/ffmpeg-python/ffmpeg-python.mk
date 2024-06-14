################################################################################
#
# ffmpeg-python
#
################################################################################
# Version: Commits on Nov 20, 2017
FFMPEG_PYTHON_VERSION = v0.1.9
FFMPEG_PYTHON_SITE = $(call github,kkroening,ffmpeg-python,$(FFMPEG_PYTHON_VERSION))
FFMPEG_PYTHON_SETUP_TYPE = setuptools
FFMPEG_PYTHON_LICENSE_FILES = LICENSE

FFMPEG_PYTHON_DEPENDENCIES = python-future

$(eval $(python-package))
