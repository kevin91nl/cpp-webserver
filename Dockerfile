FROM ubuntu:latest
RUN apt-get -y update && apt-get install -y
RUN apt-get -y install clang make cmake
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY Makefile CMakeLists.txt ./
RUN make init-linux
COPY source ./source
RUN mkdir build && cd build && cmake .. . && make
EXPOSE 18080
ENTRYPOINT [ "build/DemoServer" ]