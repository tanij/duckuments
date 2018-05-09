

tex-symbols=docs/symbols.tex
duckietown-software=duckietown
RUNBOOK=misc/run-book.sh

all:
	# make update-software
	ONLY_FOR_REFS=1 make books
	make books
	make summaries

summaries:
#	cp misc/frames.html duckuments-dist/index.html
	. deploy/bin/activate && python misc/make_index.py \
		duckuments-dist/index.html \
		duckuments-dist/all_crossref.html \
		duckuments-dist/errors_and_warnings.pickle

realclean: clean
	rm -rf duckuments-dist

.PHONY: checks check-duckietown-software check-programs

.PHONY: builds install update-software

dependencies-ubuntu16:
	sudo apt install -y \
		libxml2-dev \
		libxslt1-dev \
		libffi6\
		libffi-dev\
		python-dev\
		python-numpy\
		python-matplotlib\
		virtualenv\
		bibtex2html\
		pdftk\
		imagemagick\
		python-dev\
		libmysqlclient-dev

install-ubuntu16:
	git submodule init
	virtualenv --system-site-packages --no-site-packages deploy
	$(MAKE) install-fonts
	$(MAKE) update-software

install-fonts:
	sudo cp -R misc/fonts /usr/share/fonts/my-fonts
	sudo fc-cache -f -v


update-software:
	git submodule sync --recursive
	git submodule update --init --recursive
	. deploy/bin/activate && pip install -r mcdp/requirements.txt && pip install numpy matplotlib MySQL-python

	. deploy/bin/activate && cd mcdp && python setup.py develop

builds:
	cp misc/jquery* builds/
	python -m mcdp_docs.sync_from_circle duckietown duckuments builds builds/duckuments.html

db.related.yaml:
	. deploy/bin/activate && misc/download_wordpress.py > $@

checks: check-programs db.related.yaml

check-programs-pdf:
	@which  pdftk >/dev/null || ( \
		echo "You need to install pdftk."; \
		exit 1)

check-programs:
	@(\
	. deploy/bin/activate; \
	\
	which  bibtex2html >/dev/null || ( \
		echo "You need to install bibtex2html."; \
		exit 2); \
	\
	which  mcdp-render >/dev/null  || ( \
		echo "The program mcdp-render is not found"; \
		echo "You are not in the virtual environment."; \
		exit 3); \
	\
	which  mcdp-split >/dev/null  || ( \
		echo "The program mcdp-split is not found"; \
		echo "You need to run 'python setup.py develop' from mcdp/."; \
		exit 4); \
	\
	which  convert >/dev/null  || ( \
		echo "You need to install ImageMagick"; \
		exit 2); \
	\
	which  gs >/dev/null  || ( \
		echo "You need to install Ghostscript (used by ImageMagick)."; \
		exit 2); \
	)

	@echo All programs installed.

check-duckietown-software:
	@if [ -d $(duckietown-software) ] ; \
	then \
	     echo '';\
	else \
		echo 'Please create a link "$(duckietown-software)" to the Software repository.'; \
		echo '(This is used to include the package documentation)'; \
		echo ''; \
		echo 'Assuming the usual layout, this is:'; \
		echo '      ln -s  ~/duckietown $(duckietown-software)'; \
		echo ''; \
		exit 1; \
	fi;

generated_figs=docs/generated_pdf_fig

inkscape2=/Applications/Inkscape.app/Contents/Resources/bin/inkscape

process-svg-clean:
	-rm -f $(generated_figs)/*pdf

process-svg:
	@which  inkscape >/dev/null || which $(inkscape2) || ( \
		echo "You need to install inkscape."; \
		exit 2)
	@which  pdfcrop >/dev/null || (echo "You need to install pdfcrop."; exit 1)
	@which  pdflatex >/dev/null || (echo "You need to install pdflatex."; exit 1)

	python -m mcdp_docs.process_svg docs/ $(generated_figs) $(tex-symbols)


books: \
	book-duckumentation \
	book-the_duckietown_project \
	book-opmanual_duckiebot \
	book-opmanual_duckietown \
	book-software_carpentry \
	book-software_devel \
	book-software_architecture \
	book-class_fall2017 \
	book-class_fall2017_projects \
	book-learning_materials \
	book-exercises \
	book-drafts \
	book-guide_for_instructors \
	book-deprecated \
	book-preliminaries \
	book-AI_driving_olympics

book-guide_for_instructors: checks
	. deploy/bin/activate && $(RUNBOOK) guide_for_instructors docs/atoms_12_guide_for_instructors

book-deprecated: checks
	$(RUNBOOK) deprecated docs/atoms_98_deprecated

book-AI_driving_olympics:
	$(RUNBOOK) AI_driving_olympics docs/atoms_16_driving_olympics

book-code_docs: check-duckietown-software checks
	$(RUNBOOK) code_docs duckietown/catkin_ws/src/

book-class_fall2017: checks
	$(RUNBOOK) class_fall2017 docs/atoms_80_fall2017_info

book-drafts: checks
	$(RUNBOOK) drafts docs/atoms_99_drafts

book-preliminaries: checks
	$(RUNBOOK) preliminaries docs/atoms_29_preliminaries

book-learning_materials: checks
	$(RUNBOOK) learning_materials docs/atoms_30_learning_materials

book-exercises: checks
	$(RUNBOOK) exercises docs/atoms_40_exercises

book-duckumentation: checks
	$(RUNBOOK) duckumentation docs/atoms_15_duckumentation

book-the_duckietown_project: checks
	$(RUNBOOK) the_duckietown_project docs/atoms_10_the_duckietown_project

book-opmanual_duckiebot: checks
	$(RUNBOOK) opmanual_duckiebot docs/atoms_17_opmanual_duckiebot

book-opmanual_duckietown: checks
	$(RUNBOOK) opmanual_duckietown docs/atoms_18_setup_duckietown

book-software_carpentry: checks
	$(RUNBOOK) software_carpentry docs/atoms_60_software_reference

book-software_devel: checks
	$(RUNBOOK) software_devel docs/atoms_70_software_devel_guide

book-software_architecture: checks
	$(RUNBOOK) software_architecture docs/atoms_80_duckietown_software

book-class_fall2017_projects: checks
	$(RUNBOOK) class_fall2017_projects docs/atoms_85_fall2017_projects

clean:
	rm -rf out

duckuments-bot:
	python misc/slack_message.py

clean-tmp:
	find /mnt/tmp/mcdp_tmp_dir-duckietown -type d -ctime +10 -exec rm -rf {} \;

package-artifacts:
	bash misc/package-art.sh out/package.tgz
