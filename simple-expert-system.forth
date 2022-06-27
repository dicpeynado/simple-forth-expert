\ Simple expert system language
100 CONSTANT MAX_RULES
: question: create 0 c, 0 c, ;
: ans 1+ ;
: .question body> >name id. space ." (type y/n) " ;
: user-y/n key dup emit cr [char] y = ;
: ask ( q --  a ) 
	dup c@ 0= if dup .question user-y/n over ans c! -1 over c! then 
	ans c@ ;

create rules MAX_RULES cells allot
rules value nrules
: >rules nrules ! nrules cell+ to nrules ;
: rule: create here >rules ;
: ;rule , 0 , ;
: prove ( rule -- ) -1 begin over @ over and while over @ ask and swap cell+ swap repeat nip ;
: solve rules 0 
	begin over @ over 0= and while 
		over @ prove or swap cell+ swap 
	repeat
	cr if ." Answer: " cell - @ body> >name id. else drop ." Unknown" then ;

\ Database

question: slow-build-of-symptoms?
question: sore-throat?
question: runny-nose?
question: fever?
question: body-aches?
question: head-aches?
question: cough?
question: fatigue?
question: tiredness?
question: runny-nose?
question: no-loss-of-taste-or-smell?
question: congestion?
question: sore-throat?
question: cough?
question: immediate-onset-of-symptoms?

rule: covid-19(delta) 
	slow-build-of-symptoms? , 
	head-aches? , 
	sore-throat? , 
	runny-nose? , 
	fever? , 
	body-aches? 
;rule
rule: covid-19(omicron)
	slow-build-of-symptoms? ,
	cough? ,
	fatigue? ,
	tiredness? ,
	congestion? ,
	runny-nose? ,
	no-loss-of-taste-or-smell?
;rule
rule: common-cold
	slow-build-of-symptoms? ,
	runny-nose? ,
	congestion? ,
	cough? ,
	sore-throat?
;rule
