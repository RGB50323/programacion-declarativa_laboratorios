:- consult('hechos.pl').

/* PRIMERA REGLA
   Verifica si una zona tiene un nivel de peligro "alto".
   Cubre dos casos: zonas con peligro fijo (peligro/2, como cuevas),
   y zonas cuyo peligro depende del momento del dia (peligro/3, como superficie). */
zona_peligrosa(X) :- peligro(X, alto).
zona_peligrosa(X) :- peligro(X, _, alto).

/* SEGUNDA REGLA
   Verifica si un enemigo aparece en una zona que es peligrosa,
   combinando los hechos enemigos/1 y aparece/2 con la regla zona_peligrosa/1. */
enemigo_en_zona_peligrosa(X) :- enemigos(X), aparece(X, Z), zona_peligrosa(Z).

/* TERCERA REGLA
   Verifica si X es un recurso util para Eric: ya sea algo que el
   directamente tiene, o un material que se encuentra en la superficie. */
objeto_utilidad(X) :- tiene(eric, X) ; (material(X), encuentra(X, superficie)).