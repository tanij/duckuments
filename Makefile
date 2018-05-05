

tex-symbols=docs/symbols.tex
duckietown-software=duckietown

all:
	# make update-software
	ONLY_FOR_REFS=1 make books
	make books
	make summaries

summaries:
	cp misc/frames.html duckuments-dist/index.html
	. deploy/bin/activate && python make_index.py duckuments-dist/summary.html duckuments-dist/all_crossref.html

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
	virtualenv --system-site-packages --no-site-packages deploy
	$(MAKE) update-software

update-software:
	git submodule sync --recursive
	git submodule update --init --recursive
	. deploy/bin/activate && pip install -r mcdp/requirements.txt && pip install numpy matplotlib MySQL-python

	. deploy/bin/activate && cd mcdp && python setup.py develop

builds:
	cp misc/jquery* builds/
	python -m mcdp_docs.sync_from_circle duckietown duckuments builds builds/duckuments.html


checks: check-programs
	. deploy/bin/activate && python download_wordpress.py > db.related.yaml
	cat db.related.yaml

check-programs-pdf:
	@which  pdftk >/dev/null || ( \
		echo "You need to install pdftk."; \
		exit 1)

check-programs:
	(\
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
	duckumentation \
	the_duckietown_project \
	opmanual_duckiebot \
	opmanual_duckietown \
	software_carpentry \
	software_devel \
	software_architecture \
	class_fall2017 \
	class_fall2017_projects \
	learning_materials \
	exercises \
	drafts \
	guide_for_instructors \
	deprecated \
	preliminaries \
	AI_driving_olympics

guide_for_instructors: checks
	. deploy/bin/activate && ./run-book $@ docs/atoms_12_guide_for_instructors

deprecated: checks
	./run-book $@ docs/atoms_98_deprecated

AI_driving_olympics:
	./run-book $@ docs/atoms_16_driving_olympics

code_docs: check-duckietown-software checks
	./run-book $@ duckietown/catkin_ws/src/

class_fall2017: checks
	./run-book $@ docs/atoms_80_fall2017_info

drafts: checks
	./run-book $@ docs/atoms_99_drafts

preliminaries: checks
	./run-book $@ docs/atoms_29_preliminaries

learning_materials: checks
	./run-book $@ docs/atoms_30_learning_materials

exercises: checks
	./run-book $@ docs/atoms_40_exercises

duckumentation: checks
	./run-book $@ docs/atoms_15_duckumentation

the_duckietown_project: checks
	./run-book $@ docs/atoms_10_the_duckietown_project

opmanual_duckiebot: checks
	./run-book $@ docs/atoms_17_opmanual_duckiebot

opmanual_duckietown: checks
	./run-book $@ docs/atoms_18_setup_duckietown

software_carpentry: checks
	./run-book $@ docs/atoms_60_software_reference

software_devel: checks
	./run-book $@ docs/atoms_70_software_devel_guide

software_architecture: checks
	./run-book $@ docs/atoms_80_duckietown_software

class_fall2017_projects: checks
	./run-book $@ docs/atoms_85_fall2017_projects

clean:
	rm -rf out
#
#fall2017: checks
#
#	DISABLE_CONTRACTS=1 mcdp-render-manual \
#		--src $(src) \
#		--stylesheet v_manual_split \
#		--no_resolve_references \
#		--symbols $(tex-symbols) \
#		--compose fall2017.version.yaml \
#		-o out/fall2017\
#		--output_file duckuments-dist/fall2017/duckiebook.html \
#		--split duckuments-dist/fall2017/duckiebook/ \
#		--pdf duckuments-dist/fall2017/duckiebook.pdf \
#		 -c "config echo 1; rparmake"
#
#fall2017-clean:
#	rm -rf out/fall2017

duckuments-bot:
	python misc/slack_message.py

clean-tmp:
	find /mnt/tmp/mcdp_tmp_dir-duckietown -type d -ctime +10 -exec rm -rf {} \;
