FROM dynverse/dynwrapr:v0.1.0

RUN apt-get update && apt-get -y install libudunits2-dev

RUN Rscript -e 'devtools::install_cran("udunits2", configure.args =  c(udunits2 = "--with-udunits2-include=/usr/include/udunits2"))'

RUN R -e "devtools::install_github('Albluca/ElPiGraph.R')"

COPY definition.yml run.R example.h5 /code/

ENTRYPOINT ["/code/run.R"]
