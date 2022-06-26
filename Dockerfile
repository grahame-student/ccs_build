FROM ubuntu:20.04


# Add Code Composer Studio
ENV INSTALLER_URL=https://software-dl.ti.com/ccs/esd/CCSv11/CCS_11_0_0/exports/CCS11.0.0.00012_web_linux-x64.tar.gz
ENV INSTALLER_TAR=CCS11.0.0.00012_web_linux-x64.tar.gz
ENV INSTALLER_PATH=ccs_setup_11.0.0.00012.run

RUN ln -fs /usr/share/zoneinfo/Europe/London /etc/localtime
RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list
RUN apt-get update && \
    apt-get --yes upgrade
RUN apt-get install --yes --no-install-recommends libc6-i386=2.27-3ubuntu1.6 \
                                                  libusb-0.1-4 \
                                                  libgconf-2-4=3.2.6-4ubuntu1 \
                                                  libncurses5 \
                                                  libpython2.7 \
                                                  libtinfo5 \
                                                  apt-utils=1.6.14 \
                                                  autoconf=2.69-11 \
                                                  libtool=2.4.6-2 \
                                                  build-essential=12.4ubuntu1 \
                                                  libc6-i386=2.27-3ubuntu1.6 \
                                                  software-properties-common=0.96.24.32.18 \
                                                  curl=7.58.0-2ubuntu3.18 \
                                                  unzip=6.0-21ubuntu1.1 \
                                                  wget=1.19.4-1ubuntu2.2
                                                  
RUN apt-get clean


RUN mkdir /root/Downloads
RUN curl -L ${INSTALLER_URL} --output /root/Downloads/${INSTALLER_TAR} --silent && \
    tar xf /root/Downloads/${INSTALLER_TAR} --directory /root/Downloads/
RUN ls -l /root/Downloads
RUN chmod +x /root/Downloads/${INSTALLER_PATH} && \
    /root/Downloads/${INSTALLER_PATH} --mode unattended --enable-components PF_MSP430 --prefix /opt/ti/ccs1100
RUN rm /root/Downloads/${INSTALLER_PATH}
RUN rm /root/Downloads/${INSTALLER_TAR}
RUN mkdir -p /home/build/workspace && \
    /opt/ti/ccs1100/ccs/eclipse/eclipse -noSplash -data /home/build/workspace -application com.ti.common.core.initialize -rtsc.productDiscoveryPath "/opt/ti/ccs1100;/opt/ti/"
CMD ["/bin/bash"]

# workspace area for CCS
RUN mkdir /workspace

# Area for ccs project
VOLUME  /workdir
WORKDIR /workdir

# Copy the script used to build a CCS project to the filesystem path `/` of the container
COPY build_project.sh /build_project.sh

# Code file to execute when the docker container starts up (`build_project.sh`)
ENTRYPOINT ["/build_project.sh"]
