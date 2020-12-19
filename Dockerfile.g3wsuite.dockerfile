FROM g3wsuite/g3w-suite-deps-ltr:dev

LABEL maintainer="Gis3W" Description="This image is used to install python requirements and code for g3w-suite deployment" Vendor="Gis3W" Version="1.0"
# Based on main CI Docker from  g3w-suite, checkout code + caching,
# custom settings file
RUN apt install git -y

# Override settings
ADD requirements_rl.txt /requirements_rl.txt

ADD scripts /scripts
RUN chmod +x /scripts/*.sh

RUN /scripts/setup.sh \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD echo "Base image for g3w-suite-dev" && tail -f /dev/null

ENTRYPOINT /scripts/docker-entrypoint.sh