% Caso base
almacenar(0, []).

% Recursión
almacenar(N, L) :-
  N > 0,
  D is N mod 10,
  N1 is N // 10,
  almacenar(N1, L1),
  L = [D | L1].