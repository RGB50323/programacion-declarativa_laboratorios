% Ejercicio 2: Dado un numero N, sumar N con todos los numeros anteriores hasta llegar a 1.

% Caso base
suma(1, 1).

% Caso recursivo
suma(N, R) :- N > 1, N1 is N - 1, suma(N1, R1), R is N + R1.