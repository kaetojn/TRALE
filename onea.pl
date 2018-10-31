%Kaetochukwu Ndu, ndukaeto, 1000265955

% Type Hierarchy

bot sub [s, npsg, nppl, vpsg, vppl, np, pp, p, n].  
s sub [].
vsg sub [].
vpl sub [].
vpsg sub [].
vppl sub [].
np sub [].
nsg sub [].
npl sub [].
npsg sub [].
nppl sub [].
nprp sub [].
pp sub [].
p sub [].
det sub [].

% Grammmar Rules
ssgrule rule
s
===>
cat> npsg,
cat> vpsg.

splrule rule
s
===>
cat> nppl,
cat> vppl.

vpsgrule rule
vpsg
===>
cat> vsg,
cat> np.

vpplrule rule
vppl
===>
cat> vpl,
cat> npl.

pprule rule
pp
===>
cat> p,
cat> np.

npsg1 rule
npsg
===>
cat> nprp.

npsg2 rule
npsg
===>
cat> det,
cat> nsg.

npsg3 rule
npsg
===>
cat> det,
cat> nsg,
cat> pp.

nppl1 rule
nppl
===>
cat> det,
cat> npl.

nppl2 rule
nppl
===>
cat> det,
cat> npl.
cat> pp.

nppl3 rule
nppl
===>
cat> npl.

nppl4 rule
nppl
===>
cat> npl,
cat> pp.

np1 rule
np
===>
cat> npsg.

np2 rule
np
===>
cat> nppl.

% Lexical Entries
fido ---> nprp.
biscuits ---> npl.
feed ---> vpl.
feeds ---> vsg.
the ---> det.
dog ---> nsg.
puppies ---> npl.
with ---> p.