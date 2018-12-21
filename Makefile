SHELL := /bin/bash

all: extract analyse

analyse:
	Rscript -e "Sys.setenv(RSTUDIO_PANDOC='/Applications/RStudio.app/Contents/MacOS/pandoc');rmarkdown::render('./analysis/optimal_selection_players.Rmd')"

clean:
	rm -rf ./extract/csv/*

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



	





