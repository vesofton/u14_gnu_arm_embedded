FROM drydock/u14:prod
MAINTAINER Henrico Brom <henricobrom@gmail.com>

ENV BOOST_ROOT=/usr/local/boost_1_63_0
ENV PATH="${PATH}:/usr/local/doxygen-1.8.13/bin"
ENV PATH="${PATH}:/usr/local/gcc-arm-none-eabi-4_9-2015q3/bin"

ADD . /u14_gnu_arm_embedded

# Set debconf to non-interactive to prevent lots of debconf warnings.
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN /u14_gnu_arm_embedded/install.sh

ENTRYPOINT ["/bin/bash"]
