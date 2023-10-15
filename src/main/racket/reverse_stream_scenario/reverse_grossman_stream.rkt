#lang racket

(require "../hw4/hw4.rkt")

; NOTE: destream is a thunk and stream warmup problem
(define (stream-first s)
    (let 
        ([pr (destream s)])
        (car pr)))

(define (stream-rest s)
    (let 
        ([pr (destream s)])
        (cdr pr)))

; NOTE: cons-with-thunk-check-on-next-stream is a thunk and stream warmup problem
(define powers-of-two-stream
  (letrec ([create-stream-starting-from (lambda (x)
                                           (thunk-that (cons-with-thunk-check-on-next-stream x (create-stream-starting-from (* x 2)))))])

;  (local ((define (create-stream-starting-from x)
 ;          (thunk-that (cons-with-thunk-check-on-next-stream x (create-stream-starting-from (* x 2))))))
     (create-stream-starting-from 1)))

(stream-first powers-of-two-stream)
(stream-first (stream-rest powers-of-two-stream))
(stream-first (stream-rest (stream-rest powers-of-two-stream)))

(define (stream-first-and-rest s)
    (let 
        ([pr (destream s)])
        (values (car pr) (cdr pr))))

(define-values (one two-on-stream) (stream-first-and-rest powers-of-two-stream))
one

(define-values (two four-on-stream) (stream-first-and-rest two-on-stream))
two

(define-values (four eight-on-stream) (stream-first-and-rest four-on-stream))
four

; NOTE: hw4 problem
(stream-for-n-steps powers-of-two-stream 10)

(define whole-numbers-stream
    (letrec ([create-stream-starting-from (lambda (x)
                  (thunk-that (cons-with-thunk-check-on-next-stream x (create-stream-starting-from (+ x 1)))))])
        (create-stream-starting-from 0)))

(stream-for-n-steps whole-numbers-stream 10)

(define (stream-map f s)
  ; NOTE: thunk the whole let* expression 
  (thunk-that 
   (let* 
       ([pr (destream s)]
        [first (car pr)]
        [rest (cdr pr)]
        [mapped-first (f first)]
        [mapped-rest (stream-map f rest)])
     (cons-with-thunk-check-on-next-stream mapped-first mapped-rest))))

(define (two-to-the-x x)
   (expt 2 x))

(define powers-of-two-stream-via-map (stream-map two-to-the-x whole-numbers-stream))

(stream-for-n-steps powers-of-two-stream-via-map 10)

(define (reciprocal x)
   (/ 1 x))

(define negative-powers-of-two-stream (stream-map reciprocal (stream-rest powers-of-two-stream-via-map)))
(stream-for-n-steps negative-powers-of-two-stream 10)
