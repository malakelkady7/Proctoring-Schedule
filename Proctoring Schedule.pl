:- use_module(library(lists)).
availabe([],_,[]).
availabe([ta(Name,Day)|T],Dayname,[Name|R1]):- Dayname\==Day,availabe(T,Dayname,R1).
availabe([ta(_,Day)|T],Dayname,R1):- Dayname==Day,availabe(T,Dayname,R1).

checkdaysch(_,[],[]).
checkdaysch(K,[H|T],[R|RR1]):- checkdaysch2(K,H,R),checkdaysch(K,T,RR1).

checkdaysch2([],_,[]).
checkdaysch2(PresentTA, BusyTA, Res):- permutation(PresentTA,PresentTA1),PresentTA1 = [H|T],member(H,BusyTA), checkdaysch2(T,BusyTA,Res).
checkdaysch2(PresentTA, BusyTA, [H|Res]):-permutation(PresentTA,PresentTA1),PresentTA1 = [H|T], not(member(H,BusyTA)), checkdaysch2(T,BusyTA,Res).   

free_schedule(_,[],[]).
free_schedule(AllTAs,[day(Dayname,X)|T], [day(Dayname,D)|D1]):- availabe(AllTAs, Dayname, K),checkdaysch(K,X,D),
                                                                free_schedule(AllTAs,T,D1).

permuteInListN(List,N,Result) :-
    combination(N,List,Combination),
    permutation(Combination,Result).
combination(0,_,[]).
combination(N,[X|T],[X|Combination]) :-
    N>0,
    N1 is N-1,
    combination(N1,T,Combination).
combination(N,[_|T],Combination) :-
    N>0,
    combination(N,T,Combination).
findday(Day,[day(Day,X)|_],X).
findday(Day,[day(Dayname,_)|T],Daylist):- Day\=Dayname,findday(Day,T,Daylist).
findslot([H|_],Slot,Slot,H).
findslot([_|T],C,Slot,Seccion):- C<Slot,C1 is C+1,findslot(T,C1,Slot,Seccion).


assign_quiz(quiz(_, Day, Slot,Num), FreeSchedule,AssignedTAs):- findday(Day,FreeSchedule,Daylist),
                                                                findslot(Daylist,1,Slot,Seccion),length(Seccion,L),L>=Num,
																permuteInListN(Seccion,Num,AssignedTAs).															
 
assign_quizzes([], _, []).
assign_quizzes([quiz(Course, Day, Slot, Count)|T1], FreeSchedule, [proctors(quiz(Course, Day, Slot, Count), AssignedTAs)|T3]) :-
    assign_quiz(quiz(_, Day, Slot, Count), FreeSchedule, AssignedTAs),
	delused(AssignedTAs,quiz(_, Day, Slot, Count),FreeSchedule,NewF),
    assign_quizzes(T1,NewF,T3).

delused(AssignedTAs,quiz(_, Day, Slot,_),FreeSchedule,NewF):- findday(Day,FreeSchedule,X),findslot(X,1,Slot,L),
del(L, AssignedTAs,Finalslot),newsch(FreeSchedule,Finalslot,Day, Slot,NewF).

arrslots([],_,_,_,[]).
arrslots([H|T],Slot,C,Finalslot,[H|T1]):- C\=Slot,C1 is C+1,arrslots(T,Slot,C1,Finalslot,T1).
arrslots([_|T],C,C,Finalslot,[Finalslot|T1]):- C1 is C+1,arrslots(T,C,C1,Finalslot,T1).
 
newsch([],_,_,_,[]).
newsch([day(Day,X)|T],Finalslot,Day, Slot,[day(Day,Y)|T1]):- arrslots(X,Slot,1,Finalslot,Y),newsch(T,Finalslot,Day,Slot,T1).
newsch([day(Dayname,X)|T],Finalslot,Day, Slot,[day(Dayname,X)|T1]):- Dayname\==Day,newsch(T,Finalslot,Day,Slot,T1).
del([],_,[]).
del([H|T],A,F):- member(H,A),del(T,A,F).
del([H|T],A,[H|T1]):- \+member(H,A),del(T,A,T1).
 

assign_proctors(AllTAs, Quizzes, TeachingSchedule, ProctoringSchedule):- free_schedule(AllTAs, TeachingSchedule, FreeSchedule),!,
	      assign_quizzes(Quizzes, FreeSchedule, ProctoringSchedule).
 