#!/usr/bin/racket
#lang racket

(define (expt base power)
  (expt-iter base power 1))

(define (expt-iter base power product)
  (cond
   ((= power 0) product)
   ((even? power)
    (expt-iter (square base)
               (/ power 2)
               product))
   (else (expt-iter base
                    (- power 1)
                    (* product base)))))

(define (square n)
  (* n n))
