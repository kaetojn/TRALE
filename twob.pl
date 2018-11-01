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

    %thematic roles for object and subject
	theme_roles sub [agent, beneficiary, theme, none].
        agent sub [try_agent, promise_agent, expect_agent, appear_agent].
            try_agent sub [].
            promise_agent sub [].
            expect_agent sub [].
            appear_agent sub [].
            none sub [].
        beneficiary sub [promise_benefit].
            promise_benefit sub [].
            none sub [].
        theme sub [appear_theme, expect_theme, try_theme].
            appear_theme sub [].
            expect_theme sub []. 
            try_theme sub [].
            none sub [].
        experiencer sub [sleep_experience].
            sleep_experience sub [].
            none sub [].

	% semantics for verbs and nouns
	sem sub [v_sem, n_sem].

		% semantics for verbs
		v_sem sub [try, appear, promise, expect, sleep] intro [verbtense:tense, subject:theme_roles, object:theme_roles, objectpreposition:theme_roles].

			try sub [].
			appear sub [].
			promise sub [].
			expect sub [].
			sleep sub [].


		% semantics for nouns
		n_sem sub [student, teacher].
			student sub [].
			teacher sub [].

%Lexical Entries
tried ---> (v, vsem:(verbtense:past, subject:try_agent , object:try_theme , objectpreposition:try_agent)).
appeared ---> (v, vsem:(verbtense:past,  subject:appear_agent , object:appear_theme , objectpreposition:appear_theme)).
promised ---> (v, vsem:(verbtense:past,  subject:promise_agent, object:promise_benefit, objectpreposition:promise_agent)).
expected ---> (v, vsem:(verbtense:past,  subject:expect_agent , object:expect_theme, objectpreposition:expect_theme)).
sleep ---> (v, vsem:(verbtense:present, subject:sleep_experience, object:none, objectpreposition:none)).
the ---> det.
to ---> toinf.
student ---> (n, nsem:student).
teacher ---> (n, nsem:teacher).


%Grammar Rules
%--------------------------------------------
%S -> NP VP %"the student promised the student to sleep"
srule rule
s
===>
cat> np,
cat> (vp, vsem:(verbtense:past, subject:Subject , object:Object , objectpreposition:Gap)).
%--------------------------------------------


%--------------------------------------------
%NP -> Det N %"the student"
nprule rule
np
===>
cat> det,
cat> n.
%--------------------------------------------


%--------------------------------------------
%inf_clause -> toinf V %"to sleep"
inf_clause1 rule
inf_clause
===>
cat> toinf,
cat> (v, vsem:(verbtense:present)).
%--------------------------------------------

%--------------------------------------------
%inf_clause -> NP toinf V %"the teacher to sleep"
inf_clause2 rule
inf_clause
===>
cat> np,
cat> toinf,
cat> (v, vsem:(verbtense:present)).
%--------------------------------------------


%--------------------------------------------
%VP -> V NP %"promised the teacher" and "tried the teacher" 
vp1 rule
vp
===>
cat> (v, vsem:(verbtense:Tense)),
cat> np.
%--------------------------------------------


%--------------------------------------------
%VP -> V inf_clause %"appeared to sleep"
vp2 rule
vp
===>
cat> (v, vsem:(verbtense:Tense, subject:Subject, object:theme, objectpreposition:Gap)),
cat> (inf_clause, vsem:(verbtense:Tense, subject:Subject, object:theme, objectpreposition:Gap)).
%--------------------------------------------


%--------------------------------------------
%VP -> V NP inf_clause %"promised the student to sleep"
vp3 rule
vp
===>
cat> (v, vsem:(verbtense:Tense, subject:Subject, object:beneficiary, objectpreposition:Gap)),
cat> np,
cat> (inf_clause, vsem:(verbtense:Tense, subject:Subject, object:beneficiary, objectpreposition:Gap)).
%--------------------------------------------