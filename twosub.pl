:- ale_flag(subtypecover,_,off).
:- discontiguous sub/2,intro/2.

bot sub [mood, tense, sem, cat, pos, verbal, nominal, theme_roles].

	% parts of speech
        pos sub [n,p,v,det,toinf].
		toinf sub [].	% infinitival to
                n sub [].
                v sub [].
                p sub [].
                det sub [].
                
	% phrasal categories
	cat sub [vproj,np].
		vproj sub [inf_clause,s,vp] intro [mood:mood].
			s intro [mood:indicative].
                        inf_clause intro [mood:infinitive].
			vp intro [mood:indicative].
		np sub [].

        verbal sub [v,vproj] intro [vsem:v_sem].
        nominal sub [n,np] intro [nsem:n_sem].
	
	% mood and tense for verbs
	tense sub [past, present].
		past sub [].	
		present sub [].
        mood sub [indicative,infinitive].
                indicative intro [tense:tense].
                infinitive sub [].

    %thematic roles for object and subject as in PART A
	theme_roles sub [agent, beneficiary, theme, type].
        agent sub [try_agent, promise_agent, expect_agent].
            try_agent sub [].
            promise_agent sub [].
            expect_agent sub [].
        beneficiary sub [promise_benefit].
            promise_benefit sub [].
        theme sub [appear_theme, expect_theme, try_theme].
            appear_theme sub [].
            expect_theme sub [].
            try_theme sub [].
       	type sub [object, subject].
			object sub [].
			subject sub [].


	% semantics for verbs and nouns
	sem sub [v_sem, n_sem].

		% semantics for verbs
		v_sem sub [try, appear, promise, expect, sleep] intro [verbtense:tense, agent:agent, beneficiary:beneficiary, theme:theme, type:type].

			try sub [].
			appear sub [].

			promise sub [] intro [verbtense:past, agent:n_sem, beneficiary:n_sem, theme:theme, type:subject].
			expect sub []  intro [verbtense:past, agent:n_sem, theme:theme, ben:none, type:object].
			sleep sub [] intro [verbtense:past, agent:none, theme:none, ben:none, exp:n_sem, type:none].


		% semantics for nouns
		n_sem sub [student, teacher].
			student sub [].
			teacher sub [].

%Lexical Entries
tried ---> (v).
appeared ---> (v).
promised ---> (v).
expected ---> (v).
sleep ---> (v).
the ---> det.
to ---> toinf.
student ---> (n, nsem:student).
teacher ---> (n, nsem:teacher).

%Grammar Rules
%--------------------------------------------
%S -> NP VP
%"the student promised the student to sleep"
srule rule
s
===>
cat> np,
cat> n.
%--------------------------------------------


%--------------------------------------------
%NP -> Det N
%"the student"
nprule rule
np
===>
cat> det,
cat> n.
%--------------------------------------------


%--------------------------------------------
%inf_clause -> toinf V
%"to sleep"
srule rule
s
===>
cat> toinf,
cat> np.
%--------------------------------------------

%--------------------------------------------
%inf_clause -> NP toinf V
%"the teacherto sleep"
srule rule
s
===>
cat> np,
cat> toinf,
cat> np.
%--------------------------------------------


%--------------------------------------------
%VP -> V NP
%"promised the teacher"
vp rule
vp
===>
cat> det,
cat> n.
%--------------------------------------------


%--------------------------------------------
%VP -> V inf_clause
%"appeared to" "tried to" "expected to"
vp rule
vp
===>
cat> det,
cat> n.
%--------------------------------------------


%--------------------------------------------
%VP -> V NP inf_clause
%"promised the student to sleep"
vp rule
vp
===>
cat> det,
cat> det,
cat> n.
%--------------------------------------------


