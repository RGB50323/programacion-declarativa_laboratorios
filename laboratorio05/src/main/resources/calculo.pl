suma(A, B, R) :- number(A), number(B), R is A + B.
resta(A, B, R) :- number(A), number(B), R is A - B.
multiplicacion(A, B, R) :- number(A), number(B), R is A * B.
division(A, B, R) :- number(A), number(B), B =\= 0, R is A / B.