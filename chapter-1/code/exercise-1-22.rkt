#!/usr/bin/racket
#lang racket

(define (square n) (* n n))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (runtime) (current-inexact-milliseconds))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (when (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;; Calculate the smallest three prime numbers larger than 1000, 10000, 100000, and 1000000

(define (search-for-primes lower upper)
  (let ([prime-analysis (filter (lambda (elem) (eq? (prime? elem) #t))
                                (range lower upper))])
    (take prime-analysis 3)))

(search-for-primes 1000 10000)
(search-for-primes 10000 100000)
(search-for-primes 100000 1000000)
(search-for-primes 1000000 10000000)
