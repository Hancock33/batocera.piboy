FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386 && \
	apt-get update && \
	apt-get install -y -o APT::Immediate-Configure=0 libc6:i386 \
		libncurses6:i386 \
		libstdc++6:i386 \
		autoconf \
		automake \
		bc \
		bison \
		build-essential \
		cmake \
		cpio \
		curl \
		default-jre \
		device-tree-compiler \
		dosfstools \
		flex \
		g++-multilib \
		gcc-multilib \
		gettext \
		git \
		graphviz \
		imagemagick \
		libbz2-dev \
		libclang-dev \
		libglib2.0-dev \
		libgmock-dev \
		libgtest-dev \
		libncurses6 \
		libncurses-dev \
		libsodium-dev \
		libssl-dev \
		libtool \
		locales \
		mercurial \
		mtools \
		po4a \
		python3 \
		rsync \
		scons \
		smpq \
		spirv-tools \
		subversion \
		texinfo \
		u-boot-tools \
		wget \
		zip \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# Set locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
	locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV TZ Europe/Paris

# Workaround host-tar configure error
ENV FORCE_UNSAFE_CONFIGURE 1

# device-tree-compiler : required for device-trees-aml-s9xx
# libc6:i386 libncurses5:i386 libstdc++6:i386: required for mame2016
# gettext : required for buildstats.sh

RUN mkdir -p /build
WORKDIR /build

CMD ["/bin/bash"]
