FROM tercen/dartrusttidy:1.0.7

USER root
WORKDIR /operator

RUN apt-get install libudunits2-dev
RUN apt-get update
RUN apt-get install libgdal-dev

RUN git clone https://github.com/tercen/shiny_operator2.git

WORKDIR /operator/shiny_operator2

RUN echo 0.10.0 && git pull
RUN git checkout 0.10.0

RUN R -e "renv::restore(confirm=FALSE)"

ENV TERCEN_SERVICE_URI https://tercen.com

COPY start.R /start.R

ENTRYPOINT [ "R","--no-save","--no-restore","--no-environ","--slave","-f","/start.R"]



FROM tercen/dartrusttidy:1.0.7

RUN apt-get install -y libudunits2-dev
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
  
USER root
WORKDIR /operator

RUN git clone https://github.com/tercen/shiny_worldmap_operator.git

WORKDIR /operator/shiny_worldmap_operator

RUN echo 0.0.4 && git pull
RUN git checkout 0.0.4

RUN R -e "renv::restore(confirm=FALSE)"

RUN rm -rf /tmp/* /var/tmp/* /usr/local/cargo/registry/* /usr/local/cargo/git/* && \
rm -rf /root/.local/share/renv/cache/v4/R-3.5/x86_64-pc-linux-gnu/BH/* && \
strip --strip-debug /root/.local/share/renv/cache/*/*/*/*/*/*/*/libs/*.so

ENTRYPOINT [ "R","--no-save","--no-restore","--no-environ","--slave","-f","main.R", "--args"]
CMD [ "--taskId", "someid", "--serviceUri", "https://tercen.com", "--token", "sometoken"]
