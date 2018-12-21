SHELL := /bin/bash

all: install clean extract analyse

install:
	python3 -m venv virtualenv
	source ./virtualenv/bin/activate;\
	pip install -r requirements.txt
	Rscript -e "packrat::restore()"

analyse:
	Rscript -e "Sys.setenv(RSTUDIO_PANDOC='/Applications/RStudio.app/Contents/MacOS/pandoc');rmarkdown::render('./analysis/optimal_selection_players.Rmd')"

clean:
	rm -rf ./extract/csv/*
	rm -rf ./analysis/optimal_selection_players.html

extract: points_teams_top_users.csv formations_used_top_users.csv players.csv

points_teams_top_users.csv:
	source ./virtualenv/bin/activate;\
	python ./extract/code/points_teams_top_users.py
	
formations_used_top_users.csv:
	source ./virtualenv/bin/activate;\
	python ./extract/code/formations_used_top_users.py

players.csv:
	source ./virtualenv/bin/activate;\
	python ./extract/code/players.py 



	





