#lang racket

(define (calcular-deposito d)
  (cond
    [(<= d 40000) (* d 0.035)]
    [(<= d 260000) (* d 0.04)]
    [(> d 260000) (* d 0.045)]))