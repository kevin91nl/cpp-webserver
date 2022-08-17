init:
	# Setup the dependencies folder
	mkdir -p dependencies

	# Install git
	-${INSTALLER} install git

	# Install asio
	-${INSTALLER} install ${LIB_ASIO}

	# Install Crow (REST API)
	-git clone https://github.com/CrowCpp/Crow.git dependencies/crow
	cd dependencies/crow && mkdir -p build && cd build && cmake .. -DCROW_BUILD_EXAMPLES=OFF -DCROW_BUILD_TESTS=OFF && make install

init-macos: INSTALLER = brew
init-macos: LIB_ASIO = asio
init-macos: init

init-linux: INSTALLER = apt-get -y
init-linux: LIB_ASIO = libasio-dev
init-linux: init
