% Original state
original_state(state(3,3,left,0,0)).

% Final state
final_state(state(0,0,right,3,3)).

% Two missionaries left to right.
move(state(CL,ML,left,CR,MR),state(CL,ML2,right,CR,MR2)) :-
	MR2 is MR + 2,
	ML2 is ML - 2.

% Two cannibals left to right.
move(state(CL, ML, left, CR, MR), state(CL2, ML, right, CR2, MR)):-	
	CR2 is CR+2,
	CL2 is CL-2.

% One missionary and one cannibal left to right.
move(state(CL,ML,left,CR,MR),state(CL2,ML2,right,CR2,MR2)):-
	CR2 is CR+1,
	CL2 is CL-1,
	MR2 is MR+1,
	ML2 is ML-1.

% One missionary left to right.
move(state(CL,ML,left,CR,MR),state(CL,ML2,right,CR,MR2)):-
	MR2 is MR+1,
	ML2 is ML-1.

% One cannibal left to right.
move(state(CL,ML,left,CR,MR),state(CL2,ML,right,CR2,MR)):-
	CR2 is CR+1,
	CL2 is CL-1.

% Two missionaries right to left.
move(state(CL,ML,right,CR,MR),state(CL,ML2,left,CR,MR2)):-
	MR2 is MR-2,
	ML2 is ML+2.

% Two cannibals right to left.
move(state(CL,ML,right,CR,MR),state(CL2,ML,left,CR2,MR)):-
	CR2 is CR-2,
	CL2 is CL+2.

%  One missionary and one cannibal right to left.
move(state(CL,ML,right,CR,MR),state(CL2,ML2,left,CR2,MR2)):-
	CR2 is CR-1,
	CL2 is CL+1,
	MR2 is MR-1,
	ML2 is ML+1.

% One missionary right to left.
move(state(CL,ML,right,CR,MR),state(CL,ML2,left,CR,MR2)):-
	MR2 is MR-1,
	ML2 is ML+1.

% One cannibal right to left.
move(state(CL,ML,right,CR,MR),state(CL2,ML,left,CR2,MR)) :-
	CR2 is CR-1,
	CL2 is CL+1.

 
% -------------------------------------------------------------------------------------- %

make_move(state(CL1, ML1, B1, CR1, MR1), state(CL2, ML2, B2, CR2, MR2)) :-
	move(state(CL1, ML1, B1, CR1, MR1), state(CL2, ML2, B2, CR2, MR2)), 
	isValid(CL2, ML2, CR2, MR2).

% Check if move is valid
isValid(CL, ML, CR, MR) :-
	% is this state valid?
	ML>=0, CL>=0, MR>=0, CR>=0,
	(ML>=CL ; ML=0),
	(MR>=CR ; MR=0).


% Recursive call to solve the problem
path(state(CL1, ML1, B1, CR1, MR1), state(CL2, ML2, B2, CR2, MR2), Explored, MovesList) :- 
	make_move(state(CL1, ML1, B1, CR1, MR1), state(CL3, ML3, B3, CR3, MR3)),
	\+ member(state(CL3, ML3, B3, CR3, MR3), Explored),
	path(state(CL3, ML3, B3, CR3, MR3), state(CL2, ML2, B2, CR2, MR2), [state(CL3, ML3, B3, CR3, MR3)|Explored],
		[[state(CL3, ML3, B3, CR3, MR3), state(CL1, ML1, B1, CR1, MR1)] | MovesList]).

% Solution
path(state(CL,ML,B,CR,MR), state(CL,ML,B,CR,MR), _, MovesList):- 
    print_paths(MovesList).

% Print
print_paths([]) :- nl. 
print_paths([[X,Y]|MovesList]) :- 
	print_paths(MovesList), 
   	write(Y), write(' -> '), write(X), nl.

% Run the program
run :- 
   path(state(3, 3, left, 0, 0), state(0, 0, right, 3, 3), [state(3, 3, left, 0, 0)], _).


/*  GOAL AND ANSWER

?- run.

state(3,3,left,0,0) -> state(1,3,right,2,0)
state(1,3,right,2,0) -> state(2,3,left,1,0)
state(2,3,left,1,0) -> state(0,3,right,3,0)
state(0,3,right,3,0) -> state(1,3,left,2,0)
state(1,3,left,2,0) -> state(1,1,right,2,2)
state(1,1,right,2,2) -> state(2,2,left,1,1)
state(2,2,left,1,1) -> state(2,0,right,1,3)
state(2,0,right,1,3) -> state(3,0,left,0,3)
state(3,0,left,0,3) -> state(1,0,right,2,3)
state(1,0,right,2,3) -> state(1,1,left,2,2)
state(1,1,left,2,2) -> state(0,0,right,3,3)
true . */
