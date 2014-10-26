

pdf:
	for f in ../ch* ; do \
		sed 's/,/<|,|>/g' $$f | sed 's/~~/,/g' | m4 -P textify.m4  - | sed -e 's/æ/\\ae{}/g' -e 's/ô/\\^o/g' \
	-e 's/…/.../g' -e 's/œ/\\oe{}/g' -e 's/&gt;/>/' -e 's/&lt;/</' > `basename $$f .tex`.tex ; done
	pdflatex ppim
	bibtex ppim
	pdflatex ppim
	pdflatex ppim

HTMLout=~/tmp/narratives

html:
	for f in ../ch* ; do \
		sed 's/,/<|,|>/g' $$f  | sed 's/~~/,/g' | m4 -P htmlify.m4  - | sed -e 's|<ul> *</li>|<ul>|' | insert_ps | \
        sed -e 's/<p><h6>/<h6>/' -e 's|</h6></p>|</h6>|' -e 's|<p></li>|</li>|g'\
        -e '$d' -e 's/``/“/g' -e 's/\\dots/…/g' -e 's/\\%/%/g' -e 's/\\#/#/g' -e 's/---/—/g'\
            |awk -f awk_cut > `basename $$f xx`.html; \
	done
	cd bib&&make
	echo "<h2>Bibliography</h2>" > xxx
	cat head.html ch*.html xxx  bib/bibshell.html tail.html > $(HTMLout)/index.html
	rm xxx
	cp typical.css $(HTMLout)

push:
	cd $(HTMLout) && git commit -a -m "Another update." && git push origin gh-pages
