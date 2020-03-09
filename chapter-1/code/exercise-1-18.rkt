#!/usr/bin/racket
#lang racket

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (even? x)
  (= (remainder x 2) 0))

(define (* a b)
  (define (multiply a b value)
    (cond
      ((= b 0) value)
      ((even? b)
       (multiply (double a)
                 (halve b)
                 value))
      (else (multiply a
                      (- b 1)
                      (+ a value)))))
  (multiply a b 0))

(* 16 8)
(* 23 7)
