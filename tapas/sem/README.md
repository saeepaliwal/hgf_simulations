# README

aponteeduardo@gmail.com
copyright (C) 2015

# Introduction

This toolbox contains code for modeling of the antisaccade task as explained
in:

http://biorxiv.org/content/early/2017/02/17/109090

A running example can be found in

```
tapas/sem/examples/tapas_sem_example_inversion.m
```

# Installation

## Python Package

SERIA can be install as an usual python package using

```
python setup.py install
```

It's dependencies are:

```
numpy
scipy
Cython
```

It should be enough to run

```
pip install numpy
pip install scipy
pip install Cython
```

A further dependecy is gsl. In Ubuntu you woul need the dev version

```
sudo apt-get install libgsl0-dev 
```

To install in mac you will need to install gsl

```
brew install gsl
brew install clang-omp 
```
Currently we do not support openmp as clang doesn't support it. Apparently
it is possible to use openmp with clan. If you manage, then it's only
a matter to modify the setup.py scrip by deleting the darwin case.

We do not support windows but we suppect that it might work. Or not.

## Matlab package

We support the installation of SERIA in Linux and Mac. We have tested in a few
platforms and it has always worked. You will need a running matlab 
installation. In particular, the command line matlab should be able
to trigger matlab. The reason is that matlab is used to find out the 
matlabroot directory. If you don't have the matlab command (for whatever)
reason, it is still possible to hardcode the path in the configure.ac file.

To install the package it should be enough to go to

```
tapas/sem/src/
```

and type

```
./configure && make
```

The most likely problems you could face are the following:

Something with automake or aclocal. In that case please install automake

```
sudo apt-get install automake
```

Then in src type

```
autoreconf -ifv
```

Then try again

```
./configure && make
```

### Mac

It is possible to compile in mac after installing the gcc compiler that 
supports openmp. In theory it is enough to write 

```
CC=clang-omp ./configure && make
```

Please install first gls using

```
sudo port install gsl
```

Most likely config will fail for a number of reason. Please check the 
following:

Has config found gls's header? If not type 

```
export CFLAGS="$CFLAGS -I/opt/local/include"
```

Has config found gls's libraries? If not type

```
export LDFLAGS="$LDFLAGS -L/opt/local/lib/"
```

Has config found matlab? If not find the path of matlab and type

```
export PATH=$PATH:/usr/local/MATLAB/R2010b/bin/
```
This is an example path, please find the right one.


