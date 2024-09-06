FROM condaforge/mambaforge:latest
LABEL description = "Dockerfile for the #NNNN NBIS support project" \
    author = "Lokeshwaran Manoharan" \
    email = "lokeshwaran.manoharan@nbis.se"


# Use bash as shell
SHELL ["/bin/bash", "-c"]

# Set working directory
WORKDIR /project

# Copy and install the Conda environment
COPY environment.yml ./
COPY code/taxa_counts.py ./
RUN conda config --set channel_priority strict \
    && mamba env update --name base --file environment.yml \
    && mamba clean --all --force-pkgs-dirs --yes
# Start Bash shell by default
CMD /bin/bash
