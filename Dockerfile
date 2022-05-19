FROM rocker/r-ver:4.0.2
RUN apt-get update && apt-get install -y  libssl-dev pandoc pandoc-citeproc zlib1g-dev && rm -rf /var/lib/apt/lists/*
RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl', Ncpus = 4)" >> /usr/local/lib/R/etc/Rprofile.site
RUN R -e 'install.packages("remotes")'
RUN Rscript -e 'remotes::install_version("rmarkdown",upgrade="never", version = "2.13")'
RUN Rscript -e 'remotes::install_version("purrr",upgrade="never", version = "0.3.4")'
RUN Rscript -e 'remotes::install_version("lubridate",upgrade="never", version = "1.8.0")'
RUN Rscript -e 'remotes::install_version("knitr",upgrade="never", version = "1.37")'
RUN Rscript -e 'remotes::install_version("kableExtra",upgrade="never", version = "1.3.4")'
RUN Rscript -e 'remotes::install_version("tidyr",upgrade="never", version = "1.2.0")'
RUN Rscript -e 'remotes::install_version("shinythemes",upgrade="never", version = "1.2.0")'
RUN Rscript -e 'remotes::install_version("shinydashboard",upgrade="never", version = "0.7.2")'
RUN Rscript -e 'remotes::install_version("shiny",upgrade="never", version = "1.7.1")'
RUN Rscript -e 'remotes::install_version("shinipsum",upgrade="never", version = "0.1.0")'
RUN Rscript -e 'remotes::install_version("sampling",upgrade="never", version = "2.9")'
RUN Rscript -e 'remotes::install_version("rAmCharts",upgrade="never", version = "2.1.13")'
RUN Rscript -e 'remotes::install_version("questionr",upgrade="never", version = "0.7.7")'
RUN Rscript -e 'remotes::install_version("plotly",upgrade="never", version = "4.10.0")'
RUN Rscript -e 'remotes::install_version("golem",upgrade="never", version = "0.3.2")'
RUN Rscript -e 'remotes::install_version("ggthemes",upgrade="never", version = "4.2.4")'
RUN Rscript -e 'remotes::install_version("ggplot2",upgrade="never", version = "3.3.5")'
RUN Rscript -e 'remotes::install_version("GGally",upgrade="never", version = "2.1.2")'
RUN Rscript -e 'remotes::install_version("FactoMineR",upgrade="never", version = "2.4")'
RUN Rscript -e 'remotes::install_version("dygraphs",upgrade="never", version = "1.1.1.6")'
RUN Rscript -e 'remotes::install_version("DT",upgrade="never", version = "0.21")'
RUN Rscript -e 'remotes::install_version("dplyr",upgrade="never", version = "1.0.8")'
RUN Rscript -e 'remotes::install_version("data.table",upgrade="never", version = "1.14.2")'
RUN Rscript -e 'remotes::install_version("dashboardthemes",upgrade="never", version = "1.1.5")'
RUN Rscript -e 'remotes::install_version("config",upgrade="never", version = "0.3.1")'
RUN mkdir /build_zone
ADD . /build_zone
WORKDIR /build_zone
RUN R -e 'remotes::install_local(upgrade="never")'
RUN rm -rf /build_zone
EXPOSE 80
CMD R -e "options('shiny.port'=80,shiny.host='0.0.0.0');asta::run_app()"
