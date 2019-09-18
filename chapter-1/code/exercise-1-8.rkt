#!/usr/bin/racket
#lang racket
; The formula used to determine an approximation is:
; ((x / sq(y)) + 2y) / 3
; (3x / sq(y)) + 6y

(define (cube-root x)
  (cube-root-iter 1.0 x))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)))

(define (improve guess x)
  (+ 
    (/ 
      (* 3 x) 
      (square guess)) 
    (* 6 guess)))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) x))
      (* guess 0.001)))

(define (square x) 
  (* x x))