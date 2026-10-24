% REGLAS DE DERIVACIÓN

% Casos base
d(Var, C, 0)                  :- var(Var), number(C), !.
d(Var, Var, 1)                :- var(Var), !.
d(Var, K*Var, K)              :- var(Var), number(K), !.
d(Var, Var^N, N*Var^E)        :- var(Var), number(N),E is N - 1, !.
d(Var, K*Var^N, C*Var^E)      :- var(Var), number(K), number(N), C is K*N, E is N - 1, !.
d(Var, log(Var), 1/Var)       :- var(Var), !.
d(Var, A^Var, A^Var*log(A))   :- var(Var), number(A), !.
d(Var, sen(Var), cos(Var))    :- var(Var), !.
d(Var, cos(Var), -sen(Var))   :- var(Var), !.

d(Var, C, 0)                  :- atomic(Var), number(C), !.
d(Var, Var, 1)                :- atomic(Var), !.
d(Var, K*Var, K)              :- atomic(Var), number(K), !.
d(Var, Var^N, N*Var^E)        :- atomic(Var), number(N), E is N - 1, !.
d(Var, K*Var^N, C*Var^E)      :- atomic(Var), number(K), number(N), C is K*N, E is N - 1, !.
d(Var, log(Var), 1/Var)       :- atomic(Var), !.
d(Var, A^Var, A^Var*log(A))   :- atomic(Var), number(A), !.
d(Var, sen(Var), cos(Var))    :- atomic(Var), !.
d(Var, cos(Var), -sen(Var))   :- atomic(Var), !.


% Casos recursivos

d(Var, K*F, K*DF)              :- var(Var), number(K), d(Var, F, DF), !.
d(Var, F+G, DF+DG)             :- var(Var), d(Var, F, DF), d(Var, G, DG), !.
d(Var, F-G, DF-DG)             :- var(Var), d(Var, F, DF), d(Var, G, DG), !.
d(Var, F*G, DF*G + DG*F)       :- var(Var), d(Var, F, DF), d(Var, G, DG), !.
d(Var, F/G, (DF*G - DG*F)/G^2) :- var(Var), d(Var, F, DF), d(Var, G, DG), !.
d(Var, log(F), DF/F)           :- var(Var), d(Var, F, DF), !.
d(Var, A^F, A^F*log(A)*DF)     :- var(Var), number(A), d(Var, F, DF), !.

d(Var, K*F, K*DF)              :- atomic(Var), number(K), d(Var, F, DF), !.
d(Var, F+G, DF+DG)             :- atomic(Var), d(Var, F, DF), d(Var, G, DG), !.
d(Var, F-G, DF-DG)             :- atomic(Var), d(Var, F, DF), d(Var, G, DG), !.
d(Var, F*G, DF*G + DG*F)       :- atomic(Var), d(Var, F, DF), d(Var, G, DG), !.
d(Var, F/G, (DF*G - DG*F)/G^2) :- atomic(Var), d(Var, F, DF), d(Var, G, DG), !.
d(Var, log(F), DF/F)           :- atomic(Var), d(Var, F, DF), !.
d(Var, A^F, A^F*log(A)*DF)     :- atomic(Var), number(A), d(Var, F, DF), !.


% REGLAS DE INTEGRACIÓN

% Casos base
s(Var, C, C*Var)              :- var(Var), number(C), !.
s(Var, Var, 1/2*Var^2)        :- var(Var), !.
s(Var, K*Var, K/2*Var^2)      :- var(Var), number(K), !.
s(Var, Var^N, 1/M*Var^M)      :- var(Var), number(N), M is N + 1, !.
s(Var, K*Var^N, K/M*Var^M)    :- var(Var), number(K), number(N), M is N + 1, !.
s(Var, A^Var, A^Var/log(A))   :- var(Var), number(A), !.
s(Var, sen(Var), -cos(Var))   :- var(Var), !.
s(Var, cos(Var), sen(Var))    :- var(Var), !.

% Casos recursivos
s(Var, K*F, K*SF)  :- var(Var), number(K), s(Var, F, SF), !.
s(Var, F+G, SF+SG) :- var(Var), s(Var, F, SF), s(Var, G, SG), !.
s(Var, F-G, SF-SG) :- var(Var), s(Var, F, SF), s(Var, G, SG), !.

% Casos base
s(Var, C, C*Var)              :- atomic(Var), number(C), !.
s(Var, Var, 1/2*Var^2)        :- atomic(Var), !.
s(Var, K*Var, K/2*Var^2)      :- atomic(Var), number(K), !.
s(Var, Var^N, 1/M*Var^M)      :- atomic(Var), number(N), M is N + 1, !.
s(Var, K*Var^N, K/M*Var^M)    :- atomic(Var), number(K), number(N), M is N + 1, !.
s(Var, A^Var, A^Var/log(A))   :- atomic(Var), number(A), !.
s(Var, sen(Var), -cos(Var))   :- atomic(Var), !.
s(Var, cos(Var), sen(Var))    :- atomic(Var), !.

% Casos recursivos
s(Var, K*F, K*SF)  :- atomic(Var), number(K), s(Var, F, SF), !.
s(Var, F+G, SF+SG) :- atomic(Var), s(Var, F, SF), s(Var, G, SG), !.
s(Var, F-G, SF-SG) :- atomic(Var), s(Var, F, SF), s(Var, G, SG), !.

% EVALUACIÓN DE RESULTADOS SIMBÓLICOS

evaluar(X, Expr, Valor, Res) :-
    copy_term(X-Expr, Valor-Expr2),
    Res is Expr2.

valor_derivada(X, Func, X0, V) :-
    d(X, Func, R),
    evaluar(X, R, X0, V).

area(X, Func, A, B, Area) :-
    s(X, Func, R),
    evaluar(X, R, B, ELs),
    evaluar(X, R, A, ELi),
    Area is ELs - ELi.