################################################################################
#
# opencv
#
################################################################################

OPENCV_VERSION = 3.0.0
OPENCV_SITE = $(call github,itseez,opencv,$(OPENCV_VERSION))
OPENCV_INSTALL_STAGING = YES
OPENCV_LICENSE = BSD-3c
OPENCV_LICENSE_FILES = LICENSE

# OpenCV component options
OPENCV_CONF_OPTS += \
	-DBUILD_DOCS=OFF \
	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),ON,OFF) \
	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF) \
	-DBUILD_WITH_DEBUG_INFO=OFF

ifeq ($(BR2_PACKAGE_OPENCV_BUILD_TESTS)$(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),)
OPENCV_CONF_OPTS += -DINSTALL_TEST=OFF
else
OPENCV_CONF_OPTS += -DINSTALL_TEST=ON
endif

# OpenCV build options
OPENCV_CONF_OPTS += \
	-DBUILD_WITH_STATIC_CRT=OFF \
	-DENABLE_COVERAGE=OFF \
	-DENABLE_FAST_MATH=ON \
	-DENABLE_IMPL_COLLECTION=OFF \
	-DENABLE_NOISY_WARNINGS=OFF \
	-DENABLE_OMIT_FRAME_POINTER=ON \
	-DENABLE_PRECOMPILED_HEADERS=OFF \
	-DENABLE_PROFILING=OFF \
	-DOPENCV_WARNINGS_ARE_ERRORS=OFF

# OpenCV link options
OPENCV_CONF_OPTS += \
	-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=OFF \
	-DCMAKE_SKIP_RPATH=OFF \
	-DCMAKE_USE_RELATIVE_PATHS=OFF

# OpenCV packaging options:
OPENCV_CONF_OPTS += \
	-DBUILD_PACKAGE=OFF \
	-DENABLE_SOLUTION_FOLDERS=OFF \
	-DINSTALL_CREATE_DISTRIB=OFF

# OpenCV module selection
# * Modules on:
#   - core: if not set, opencv does not build anything
#   - hal: core's dependency
# * Modules off:
#   - android*: android stuff
#   - apps: programs for training classifiers
#   - java: java bindings
#   - viz: missing VTK dependency
#   - world: all-in-one module
#
# * Contrib modules from [1] are disabled:
#   - opencv_contrib package is not available in Buildroot;
#   - OPENCV_EXTRA_MODULES_PATH is not set.
#
# [1] https://github.com/Itseez/opencv_contrib
OPENCV_CONF_OPTS += \
	-DBUILD_opencv_androidcamera=OFF \
	-DBUILD_opencv_apps=OFF \
	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_LIB_CALIB3D),ON,OFF) \
	-DBUILD_opencv_core=ON \
	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV_LIB_FEATURES2D),ON,OFF) \
	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV_LIB_FLANN),ON,OFF) \
	-DBUILD_opencv_hal=ON \
	-DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV_LIB_HIGHGUI),ON,OFF) \
	-DBUILD_opencv_imgcodecs=$(if $(BR2_PACKAGE_OPENCV_LIB_IMGCODECS),ON,OFF) \
	-DBUILD_opencv_imgproc=$(if $(BR2_PACKAGE_OPENCV_LIB_IMGPROC),ON,OFF) \
	-DBUILD_opencv_java=OFF \
	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV_LIB_ML),ON,OFF) \
	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF) \
	-DBUILD_opencv_python2=OFF \
	-DBUILD_opencv_python3=OFF \
	-DBUILD_opencv_shape=$(if $(BR2_PACKAGE_OPENCV_LIB_SHAPE),ON,OFF) \
	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV_LIB_SUPERRES),ON,OFF) \
	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF) \
	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF) \
	-DBUILD_opencv_videoio=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOIO),ON,OFF) \
	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB),ON,OFF) \
	-DBUILD_opencv_viz=OFF \
	-DBUILD_opencv_world=OFF

# Hardware support options.
#
# * PowerPC support is turned off since its only effect is altering CFLAGS,
#   adding '-mcpu=G3 -mtune=G5' to them, which is already handled by Buildroot.
# * fma3 and popcnt support is disabled because according to gcc manual [2], it
#   is only available on x86_64 haswell, broadwell and knl architecture.
#
# [2] https://gcc.gnu.org/onlinedocs/gcc-5.1.0/gcc/x86-Options.html#x86-Options
OPENCV_CONF_OPTS += \
	-DENABLE_AVX=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF) \
	-DENABLE_AVX2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF) \
	-DENABLE_FMA3=OFF \
	-DENABLE_POPCNT=OFF \
	-DENABLE_POWERPC=OFF \
	-DENABLE_SSE=$(if $(BR2_X86_CPU_HAS_SSE),ON,OFF) \
	-DENABLE_SSE2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF) \
	-DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF) \
	-DENABLE_SSE41=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF) \
	-DENABLE_SSE42=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF) \
	-DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)

# Cuda stuff
OPENCV_CONF_OPTS += \
	-DBUILD_CUDA_STUBS=OFF \
	-DBUILD_opencv_cudaarithm=OFF \
	-DBUILD_opencv_cudabgsegm=OFF \
	-DBUILD_opencv_cudacodec=OFF \
	-DBUILD_opencv_cudafeatures2d=OFF \
	-DBUILD_opencv_cudafilters=OFF \
	-DBUILD_opencv_cudaimgproc=OFF \
	-DBUILD_opencv_cudalegacy=OFF \
	-DBUILD_opencv_cudaobjdetect=OFF \
	-DBUILD_opencv_cudaoptflow=OFF \
	-DBUILD_opencv_cudastereo=OFF \
	-DBUILD_opencv_cudawarping=OFF \
	-DBUILD_opencv_cudev=OFF \
	-DWITH_CUBLAS=OFF \
	-DWITH_CUDA=OFF \
	-DWITH_CUFFT=OFF

# NVidia stuff
OPENCV_CONF_OPTS += -DWITH_NVCUVID=OFF

# AMD stuff
OPENCV_CONF_OPTS += \
	-DWITH_OPENCLAMDBLAS=OFF \
	-DWITH_OPENCLAMDFFT=OFF

# Intel stuff
OPENCV_CONF_OPTS += \
	-DBUILD_WITH_DYNAMIC_IPP=OFF \
	-DWITH_INTELPERC=OFF \
	-DWITH_IPP=OFF \
	-DWITH_IPP_A=OFF \
	-DWITH_TBB=OFF

# Smartek stuff
OPENCV_CONF_OPTS += -DWITH_GIGEAPI=OFF

# Prosilica stuff
OPENCV_CONF_OPTS += -DWITH_PVAPI=OFF

# Ximea stuff
OPENCV_CONF_OPTS += -DWITH_XIMEA=OFF

# Non-Linux support (Android options) must remain OFF:
OPENCV_CONF_OPTS += \
	-DANDROID=OFF \
	-DBUILD_ANDROID_CAMERA_WRAPPER=OFF \
	-DBUILD_ANDROID_EXAMPLES=OFF \
	-DBUILD_ANDROID_SERVICE=OFF \
	-DBUILD_FAT_JAVA_LIB=OFF \
	-DINSTALL_ANDROID_EXAMPLES=OFF \
	-DWITH_ANDROID_CAMERA=OFF

# Non-Linux support (Mac OSX options) must remain OFF:
OPENCV_CONF_OPTS += \
	-DWITH_AVFOUNDATION=OFF \
	-DWITH_CARBON=OFF \
	-DWITH_QUICKTIME=OFF

# Non-Linux support (Windows options) must remain OFF:
OPENCV_CONF_OPTS += \
	-DWITH_CSTRIPES=OFF \
	-DWITH_DSHOW=OFF \
	-DWITH_MSMF=OFF \
	-DWITH_PTHREADS_PF=OFF \
	-DWITH_VFW=OFF \
	-DWITH_VIDEOINPUT=OFF \
	-DWITH_WIN32UI=OFF

# Software/3rd-party support options:
# - disable all examples
OPENCV_CONF_OPTS += \
	-DBUILD_EXAMPLES=OFF \
	-DBUILD_JASPER=OFF \
	-DBUILD_JPEG=OFF \
	-DBUILD_OPENEXR=OFF \
	-DBUILD_PNG=OFF \
	-DBUILD_TIFF=OFF \
	-DBUILD_ZLIB=OFF \
	-DINSTALL_C_EXAMPLES=OFF \
	-DINSTALL_PYTHON_EXAMPLES=OFF \
	-DINSTALL_TO_MANGLED_PATHS=OFF

# Disabled features (mostly because they are not available in Buildroot), but
# - eigen: OpenCV does not use it, not take any benefit from it.
OPENCV_CONF_OPTS += \
	-DWITH_1394=OFF \
	-DWITH_CLP=OFF \
	-DWITH_EIGEN=OFF \
	-DWITH_GDAL=OFF \
	-DWITH_GPHOTO2=OFF \
	-DWITH_OPENCL=OFF \
	-DWITH_OPENCL_SVM=OFF \
	-DWITH_OPENEXR=OFF \
	-DWITH_OPENGL=OFF \
	-DWITH_OPENMP=OFF \
	-DWITH_OPENNI2=OFF \
	-DWITH_OPENNI=OFF \
	-DWITH_UNICAP=OFF \
	-DWITH_VTK=OFF \
	-DWITH_WEBP=OFF \
	-DWITH_XINE=OFF

OPENCV_DEPENDENCIES += zlib

ifeq ($(BR2_PACKAGE_OPENCV_WITH_FFMPEG),y)
OPENCV_CONF_OPTS += -DWITH_FFMPEG=ON
OPENCV_DEPENDENCIES += ffmpeg bzip2
else
OPENCV_CONF_OPTS += -DWITH_FFMPEG=OFF
endif

ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER),y)
OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON -DWITH_GSTREAMER_0_10=ON
OPENCV_DEPENDENCIES += gstreamer gst-plugins-base
else
OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF -DWITH_GSTREAMER_0_10=OFF
endif

ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK),y)
OPENCV_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=ON
OPENCV_DEPENDENCIES += libgtk2
else
OPENCV_CONF_OPTS += -DWITH_GTK=OFF
endif

ifeq ($(BR2_PACKAGE_OPENCV_WITH_JASPER),y)
OPENCV_CONF_OPTS += -DWITH_JASPER=ON
OPENCV_DEPENDENCIES += jasper
else
OPENCV_CONF_OPTS += -DWITH_JASPER=OFF
endif

ifeq ($(BR2_PACKAGE_OPENCV_WITH_JPEG),y)
OPENCV_CONF_OPTS += -DWITH_JPEG=ON
OPENCV_DEPENDENCIES += jpeg
else
OPENCV_CONF_OPTS += -DWITH_JPEG=OFF
endif

ifeq ($(BR2_PACKAGE_OPENCV_WITH_PNG),y)
OPENCV_CONF_OPTS += -DWITH_PNG=ON
OPENCV_DEPENDENCIES += libpng
else
OPENCV_CONF_OPTS += -DWITH_PNG=OFF
endif

ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
OPENCV_CONF_OPTS += -DWITH_QT=4
OPENCV_DEPENDENCIES += qt
else
OPENCV_CONF_OPTS += -DWITH_QT=OFF
endif

ifeq ($(BR2_PACKAGE_OPENCV_WITH_TIFF),y)
OPENCV_CONF_OPTS += -DWITH_TIFF=ON
OPENCV_DEPENDENCIES += tiff
else
OPENCV_CONF_OPTS += -DWITH_TIFF=OFF
endif

ifeq ($(BR2_PACKAGE_OPENCV_WITH_V4L),y)
OPENCV_CONF_OPTS += \
	-DWITH_LIBV4L=$(if $(BR2_PACKAGE_LIBV4L),ON,OFF) \
	-DWITH_V4L=ON
OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBV4L),libv4l)
else
OPENCV_CONF_OPTS += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
endif

# Installation hooks:
define OPENCV_CLEAN_INSTALL_DOC
	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/doc
endef
OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_DOC

define OPENCV_CLEAN_INSTALL_CMAKE
	$(RM) -f $(TARGET_DIR)/usr/share/OpenCV/OpenCVConfig*.cmake
endef
OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_CMAKE

ifneq ($(BR2_PACKAGE_OPENCV_INSTALL_DATA),y)
define OPENCV_CLEAN_INSTALL_DATA
	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/haarcascades \
		$(TARGET_DIR)/usr/share/OpenCV/lbpcascades
endef
OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_DATA
endif

$(eval $(cmake-package))
