### Miniconda installation

* Check if `~/apps/tmp` folder exists, if not create the nested folder and download `Miniconda` installer bash script.
* To download the installer, run `wget -P ~/apps/tmp https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh`
* Install by running `bash ~/apps/tmp/Miniconda3-latest-Linux-x86_64.sh`

### Mambaforge installation

* Download the file by running `wget -P ~/apps/tmp https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh`
* Run the bas file `bash ~/apps/tmp/Mambaforge-Linux-x86_64.sh`

### Export env with only packages
`conda env export --from-history | cut -f 1 -d '=' | grep -v "prefix" > environment.yml`