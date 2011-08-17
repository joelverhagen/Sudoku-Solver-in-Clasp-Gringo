% Author: Joel Verhagen

% define the set of numbers
number(1..9).

% define that a square is a pair of two numbers
square(R, C) :- number(R), number(C).

1 { paint(R, C, P) : number(P) } 1 :- square(R, C).

rowCubeColor(R, S, P)    :- S := (((C - 1) / 3) + (3 * ((R - 1) / 3))), paint(R, C, P).
columnCubeColor(C, S, P) :- S := (((C - 1) / 3) + (3 * ((R - 1) / 3))), paint(R, C, P).

% same colors may not share row or column
:- paint(R, C1, P), paint(R, C2, P), C1 != C2.
:- paint(R1, C, P), paint(R2, C, P), R1 != R2.

% don't allow a color in the same cube but different row
:- rowCubeColor(R1, S, P), rowCubeColor(R2, S, P), R1 != R2.

% don't allow a color in the same cube but different column
:- columnCubeColor(C1, S, P), columnCubeColor(C2, S, P), C1 != C2.

#hide.
#show paint/3.
