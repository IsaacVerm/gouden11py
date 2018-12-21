# Goal

Find an optimal selection of players for Gouden 11.

# Makefile

The Makefile takes care of the orchestration of the files:

- install (dependencies)
- clean (remove any pre-existing data)
- extract (make requests to Gouden 11 and save to file)
- analysis (run the notebook)

In case anything goes wrong during the installation, below are the instructions how to manually install the dependencies.

## Python

To setup the environment create a virtual environment first.

`python3 -m venv whatever`

Activate the virtual environment.

`source whatever/bin/activate`

Install the packages required as defined in requirements.txt

`pip install -r`

The files to run are just separate scripts.

## R

In Python we used venv to handle packages, in R we use packrat.

When developing the [walkthrough](https://rstudio.github.io/packrat/walkthrough.html) explains what you need to do.

When trying to get the necessary packages first make sure you have packrat installed. Type this in the R console:

`install.packages("packrat")`

Now get the packages themselves.

`packrat::restore()`
