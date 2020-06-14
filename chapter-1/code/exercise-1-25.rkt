#!/usr/bin/racket
#lang racket

(define (square x)
  (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

;;;; Original expmod

;; The exp is the only value that changes in expmod
;; n is the number to test
;; base is randomly generated
;; If the exp == 0, return 1 to start the calculations
;; If the exp is even, square the result of the previous expmod calculation and divide it by m. The remainder of the division is the next calculation.
;; If the exp is odd, multiply the base (random number) to the result of the previous expmod calculation and divide it by m. The remainder of the division is the next calculation.
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                    m))))

;; For the test, we will generate a random number that is less than the target number
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

;; To calculate if the value is a prime number, we will attempt the fermat test several times (n) and if all pass the test, then we return true
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(expmod 2 3 1)

;;;; Updated version

(define (expmod_ base exp m)
  (remainder (fast-expt base exp) m))

(define (fermat-test_ n)
  (define (try-it a)
    (= (expmod_ a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(expmod_ 10 11 11)
(fermat-test_ 11)
(fermat-test_ 14)
(fermat-test_ 17)
(fermat-test_ 121)
