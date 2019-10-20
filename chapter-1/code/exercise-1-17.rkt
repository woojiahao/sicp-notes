#!/usr/bin/racket
#lang racket

;; Linear multiplication
(define (linear-multiplication a b)
  (if (= b 0)
      0
    (+ a
       (linear-multiplication a
                              (- b 1)))))

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (even? x)
  (= (remainder x 2) 0))

;; Linear multiplication with iterative process
(define (linear-iterative-multiplication a b)
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

(linear-iterative-multiplication 7 9)
(linear-multiplication 13 5)

(define (log-multiply a b)
  (cond
   ((= b 0) 0)
   ((even? b)
    (double (* a
               (halve b))))
   (else (+ a
            (* a
               (- b 1))))))
