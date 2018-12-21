# Goal

- find out what are the most valuable players
- compare the points scored by the best team possible with teams found in the wild
- see what players are used by top ranking users

# Python

To setup the environment create a virtual enviroment first.

`python3 -m venv whatever`

Activate the virtual environment.

`source whatever/bin/activate`

Install the packages required as defined in requirements.txt

`pip install -r`

The files to run are just separate scripts.

# R

In Python we used venv to handle packages, in R we use packrat.

When developing the [walkthrough](https://rstudio.github.io/packrat/walkthrough.html) explains what you need to do.

When trying to get the necessary packages first make sure you have packrat installed. Type this in the R console:

`install.packages("packrat")`

Now get the packages themselves.

`packrat::restore()`
