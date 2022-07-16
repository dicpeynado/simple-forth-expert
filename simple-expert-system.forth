\ Simple expert system language
create rules 100 cells allot
rules value rule		\ rule pointer
rules @ value q			\ question pointer
: ?@ dup if @ then ; 		\ check if end of questions or rules (0) before fetch
: .sym dup 0<> if wordbyaddr type else drop ." Unknown" then ;
: question: create 0 , ;	\ question data type y=-1,n=1 
: nextr ( -- addr ) rule cell+ dup to rule ;
: rule: create here rule ! nextr cell+ 0 swap ! ; : ;rule , 0 , ;
: nextq ( -- addr ) q 
	begin dup ?@ ?@ dup while
		 1 = if drop nextr @ else cell+ then 
	repeat drop dup to q ;
: ask .sym ."  (type y/n)" ;
: result ." Answer: " rule @ .sym ;
: respond nextq ?@ dup if ask else drop result then ;
\ User words
: y -1 q @ ! respond ;
: n 1 q @ ! respond ;
: solve rules dup to rule @ to q respond ;

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

