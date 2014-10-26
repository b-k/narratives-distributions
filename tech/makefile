

pdf:
	mkdir -p out
	for f in ../ch* ; do \
		sed 's/,/<|,|>/g' $$f | sed 's/~~/,/g' | m4 -P textify.m4  - | sed -e 's/æ/\\ae{}/g' -e 's/ô/\\^o/g' \
	-e 's/…/.../g' -e 's/œ/\\oe{}/g' -e 's/&gt;/>/' -e 's/&lt;/</' > out/`basename $$f .tex`.tex ; done
	cp narratives.tex out
	cd out && pdflatex narratives
	cd out && bibtex narratives
	cd out && pdflatex narratives
	cd out && pdflatex narratives

HTMLout=~/tmp/narratives

html:
	mkdir -p out
	for f in ../ch* ; do \
		sed 's/,/<|,|>/g' $$f  | sed 's/~~/,/g' | m4 -P htmlify.m4  - | sed -e 's|<ul> *</li>|<ul>|' | insert_ps | \
        sed -e 's/<p><h6>/<h6>/' -e 's|</h6></p>|</h6>|' -e 's|<p></li>|</li>|g'\
        -e '$d' -e 's/``/“/g' -e 's/\\dots/…/g' -e 's/\\%/%/g' -e 's/\\#/#/g' -e 's/---/—/g'\
            |awk -f awk_cut > out/`basename $$f xx`.html; \
	done
	cd bib&&make
	echo "<h2>Bibliography</h2>" > out/xxx
	cat head.html out/ch*.html out/xxx  bib/bibshell.html tail.html > $(HTMLout)/index.html
	cp typical.css $(HTMLout)

push:
	cd $(HTMLout) && git commit -a -m "Another update." && git push origin gh-pages
