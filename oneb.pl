%Kaetochukwu Ndu, ndukaeto, 1000265955

tense sub [sg, pl].
	sg sub [].
	pl sub [].
type sub [noun, pronoun].
	noun sub [].
	pronoun sub [].
cat sub [s, np, vp, pp, n, v, p, det].
	s sub [].
	n sub [] intro [tense:tense, type:type].
	np sub [] intro [top:n].
	v sub [] intro [vtense:tense].
	vp sub [] intro [vpnp:np].
	p sub [].
	pp sub [] intro [ppnp:np].
	det sub [].

%---------------------------------
%Rule 1
%Grammar2 | (Grammar 1)
%S -> NP VP | NPsg VPsg | NPpl VPpl
srule rule
s
===>
cat> (np, top:(type:noun)),
cat> (vp, vpnp:(top:(type:noun))).
%---------------------------------

%---------------------------------
%Rule 2
%Grammar2 | (Grammar 1)
%S -> V NP | (Vsg NP | Vpl NP)
vprule rule
vp
===>
cat> v,
cat> (np, top:(type:noun)).
%---------------------------------

%---------------------------------
%Rule 3
%Grammar2 | (Grammar 1)
%P -> P NP | (P NPsg | P NPpl)
pprule rule
pp
===>
cat> p,
cat> np.
%---------------------------------

%---------------------------------
%Rule 4
%Grammar2 | (Grammar 1)
%NP -> N | (NPRP | Npl)
np1 rule
np
===>
cat> n.
%---------------------------------

%---------------------------------
%Rule 5
%Grammar2 | (Grammar 1)
%NP -> Det N | (Det Nsg | Det Npl) 
np2 rule
np
===>
cat> det,
cat> (n, type:noun). 
%---------------------------------

%---------------------------------
%Rule 6
%Grammar2 | (Grammar 1)
%NP -> Det N PP|(Det Nsg PP| Det Npl PP) 
np3 rule
np
===>
cat> det,
cat> (n, type:noun),
cat> pp.
%---------------------------------

%---------------------------------
%Rule 7
%Grammar2 | (Grammar 1)
%NP -> N PP| (Npl PP)
np4 rule
np
===>
cat> (n, tense:pl, type:noun),
cat> pp.
%---------------------------------


% Lexical Entries

biscuits ---> (n, tense:pl, type:noun).
dog ---> (n, tense:sg, type:noun).
feed ---> (v, vtense:sg).
feeds ---> (v, vtense:pl).
fido ---> (n, type:pronoun).
puppies ---> (n, tense:pl, type:noun).
the ---> det.
with ---> p.