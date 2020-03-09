#!/usr/bin/racket
#lang racket

;; Recursive version
(define (recursive-f n)
  (if (< n 3)
      n
      (+ (recursive-f (- n 1))
         (* 2 (recursive-f (- n 2)))
         (* 3 (recursive-f (- n 3))))))

(recursive-f 10)
(recursive-f 6)

;; Iterative version
(define (iterative-f n)
  (define (iter a b c count)
    (if (= count 0)
        a
        (iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))
  (iter 0 1 2 n))
(iterative-f 10)
(iterative-f 6)
