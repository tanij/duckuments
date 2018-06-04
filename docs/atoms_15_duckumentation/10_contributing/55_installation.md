# Installation and compilation {#duckumentation-installing-docs-system status=ready}

In the following, we are going to assume that the documentation system is installed in `~/duckuments`. However, it can be installed anywhere.

We are also going to assume that you have setup a Github account with working public keys.

See: [Basic SSH config](#ssh-local-configuration).

See: [Key pair creation](#howto-create-key-pair).

See: [Adding public key on Github](#howto-add-pubkey-to-github).

### Download the `duckuments` repo

Download the `duckietown/duckuments` repository in the `~/duckuments` directory:

```
$ git clone --depth 11 git@github.com:duckietown/duckuments ~/duckuments
$ cd ~/duckuments
$ git submodule init
$ git submodule update --recursive 
```

Here, note we are using `git lfs clone` -- it's much faster, because it downloads the Git LFS files in parallel.

If it fails, it means that you do not have Git LFS installed. See [](#git-lfs).

The command `--depth 10` tells it we do not care about the whole history.

### Setup the virtual environment

Use this to install a virtual environment and dependencies:

```
$ cd ~/duckuments
$ make dependencies-ubuntu16
$ make install-ubuntu16
```

For other distributions, you might need to modify the `install-ubuntu16` Makefile recipe (e.g. use `venv` instead of `virtualenv`).

## Compiling the documentation   {#compiling-master}

### Compiling all the books

To compile everything from scratch, run:

```
$ make realclean all
```

To see the results, open the file

```
~/duckuments/duckuments-dist/index.html
```

If you want to do incremental compilation, you can omit the `clean` and just use:

```
$ make all
```

### Compiling a single book

After you have compiled all the books,  you can use one of the following commands to re-compile one single book:

```
$ make book-duckumentation
$ make book-the_duckietown_project
$ make book-opmanual_duckiebot_base
$ make book-opmanual_duckiebot_fancy
$ make book-opmanual_duckietown
$ make book-software_carpentry
$ make book-software_devel
$ make book-software_architecture
$ make book-class_fall2017
$ make book-class_fall2017_projects
$ make book-learning_materials
$ make book-exercises
$ make book-drafts
$ make book-guide_for_instructors
$ make book-deprecated
$ make book-preliminaries
```

The compilation is always incremental, but sometimes you might need to do a reset using:

```
$ make realclean
```

## Reporting problems

First, see the section [](#markduck-troubleshooting) for common problems and their resolution.

Please report problems with the duckuments using [the `duckuments` issue tracker][tracker].

[tracker]: https://github.com/duckietown/duckuments/issues

Special notes:

* If you have a problem with a generated PDF, please attach the offending PDF.
* If you say something like "This happens for Figure 3", then it is hard to know which figure you are referencing exactly, because numbering changes from commit to commit.
  If you want to refer to specific parts of the text, please commit all your work on your branch, and obtain the name of the commit using the following commands:

```
$ git -C ~/duckuments rev-parse HEAD      # commit for duckuments
$ git -C ~/duckuments/mcdp rev-parse HEAD # commit for mcdp
```
