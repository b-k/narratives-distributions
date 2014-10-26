m4_divert(-1)
m4_changecom()
m4_changequote(`<|', `|>')

m4_define(<|define_blind|>, <|_define_blind(<|$1|>, <|$2|>, <|$|><|#|>, <|$|><|0|>)|>)
m4_define(<|_define_blind|>, <|m4_define(<|$1|>, <|m4_ifelse(<|$3|>, <|0|>, <|<|$4|>|>, <|$2|>)|>)|>)

define_blind(PAR, <|</P><P>|>)

define_blind(TeX, <||>)
define_blind(HTML, <|$*|>)
define_blind(Comment, <||>)

define_blind(mm, <|<div class="math">$*</div>|>)
define_blind(tt, <|<tt>$*</tt>|>)
define_blind(Tt, <|<tt>$*</tt>|>)
define_blind(sc, <|<sc>$*</sc>|>)
define_blind(bf, <|<bf>$*</bf>|>)
define_blind(em, <|<em>$*</em>|>)

define_blind(Chapter, <|<h1>$*</h1><p>|>)
define_blind(Section, <|<h2>$*</h2><p>|>)
define_blind(Subsection, <|<h3>$*</h3><p>|>)
define_blind(Paragraph, <|<h6>$*</h6><p>|>)
define_blind(Code, <|<pre><code>$*</code></pre>|>)
define_blind(Verbatim, <|<pre><code>$*</code></pre>|>)
define_blind(Block, <|<blockquote><p>$*</blockquote>|>)

define_blind(N2D, <|<div class="h2d"><a id="$2">Paragraph($1)</a>
        
Narrative: $3

Distribution: $4
</div>|>)

define_blind(Citet, <|<a href="#$1">$2</a>|>)
define_blind(Citep, <|(<a href="#$1">$1</a>)|>)

define_blind(Link, <|<a href="$1">m4_shift($*)</a>|>)

Produces a <ul></li> that has to be cut down by sed to <ul>
define_blind(Items,
<|<ul>m4_patsubst(<|$@|>, <|∙|>, <|</li>
<li>|>)
</li></ul>|>)

m4_divert(9)
</P>
m4_divert(0)
<P>
