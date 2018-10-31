%Kaetochukwu Ndu, ndukaeto, 1000265955

bot sub [type, number, cat].
	type sub [verb, noun, pronoun].
	    verb sub [].
	    noun sub [].
	tense sub [sg, pl].
		sg sub [].
		pl sub [].    	
		pronoun sub [].
	cat sub [s, np, vp, pp, n, v, p].
		s sub [].
		n sub [] intro [num:tense].
			
		np sub [] intro [head:n, phrase:type].

		v sub [] intro [case:case, number:number, type:type].
		vp sub [].
		p sub [].
		pp sub [].
		det sub [].


% Lexical Entries
fido ---> (n, phrase:pronoun, num:pl)..
biscuits ---> (n, phrase:noun, num:pl).
feed ---> (v, phrase:verb, num:sg).
feeds ---> (v, phrase:verb, num:pl).
the ---> det.
dog ---> (n, phrase:noun, num:sg).
puppies ---> (n, phrase:noun, num:pl).
with ---> p.


S → NPsg VPsg
S → NPpl VPpl
VPsg → Vsg NP
VPpl → Vpl NP
PP → P NP

NPsg → NPRP
NPsg → Det Nsg


NPsg → Det Nsg PP
NPpl → Det Npl
NPpl → Det Npl PP
NPpl → Npl
NPpl → Npl PP
NP → NPsg
NP → NPpl

===>
% Grammar 1: S -> NPsg VPsg | NPpl VPpl
% Grammar 2: S -> NP VP
srule rule
s
===>
cat> (np, head:(case:nom)),




cat> (np, head:(case:nom)),
cat> (vp, obj_vp:(head:(case:acc))).




% Grammar 1: VP -> V NP | V PROacc
% Grammar 2: VP -> V NP
vp_rule rule
(vp, obj_vp:(head:(case:acc)))
===>
cat> v,
cat> (np, head:(case:acc)).


% Grammar 1: PP -> P NP | P PROacc
% Grammar 2: PP -> P NP
pp_rule rule
(pp, obj_pp:(head:(case:acc)))
===>
cat> p,
cat> (np, head:(case:acc)).


% Grammar 1: NP -> Npl | PROnom | PROacc
% Grammar 2: NP -> N
np_rule rule
(np, head:(number:plural, case:Case))
===>
cat> (n, number:plural, case:Case).
with ---> p.


% Grammar 1: NP -> Det Nsg | Det Npl
% Grammar 2: NP -> Det N
np_rule rule
(np, head:(type:noun))
===>
cat> det,
cat> (n, type:noun).


% Grammar 1: NP -> Det Nsg PP | Det Npl PP
% Grammar 2: NP -> Det N PP
np_rule rule
(np, head:(type:noun))
===>
cat> det,
cat> (n, type:noun),
cat> pp.

% Grammar 1: NP -> Npl PP
% Grammar 2: NP -> N PP
np_rule rule
(np, head:(number:plural, type:noun))
===>
cat> (n, number:plural, type:noun),
cat> pp.




