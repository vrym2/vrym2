# Custom build shell scripts

## Linux distribution - Ubuntu 22.04.2 LTS

### Python Kernel
To check your linux distribution, type `$ lsb_release -a` in CLI. It is of vital importance to install necessary package version for the project to run successfully and not let the code break. The packages and applications in this project depends on various versions of `python`. Hence, all the required `python` versions are recommended to be installed. Current latest version as of this writing is `python3.10`, but this project won't be utilising this version but `python3.9`. To installed desired python packages in the kernel, and after installation, to verify, run `$ whereis python3.9` and replace version with desired versions
```
$ sudo add-apt-repository ppa:deadsnakes/ppa
$ sudo apt-get update
$ sudo apt-get install python3.9 # Replace with desired version
```

### Miniconda distribution
To install miniconda distribution in linux for python3.9, run the following commands
```
$ cd
$ cd /apps/tmp # create dirs if not created
$ wget https://repo.anaconda.com/miniconda/Miniconda3-py39_23.1.0-1-Linux-x86_64.sh
$ sudo chmod +x Miniconda3-py39_23.1.0-1-Linux-x86_64.sh
$ bash Miniconda3-py39_23.1.0-1-Linux-x86_64.sh
```

`mamba` installation in `base`
```
$ conda install mamba -n base -c conda-forge
$ mamba init
```

### Required packages
Creating a virtual environment with `mamba`
```
$ mamba create -n <venv name>
$ mamba init
$ mamba activate <venv name> 
```
