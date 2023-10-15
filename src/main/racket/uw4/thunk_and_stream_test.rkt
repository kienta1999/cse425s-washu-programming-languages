#lang racket
(require "uw4.rkt")
(require rackunit)
(require rackunit/text-ui)

(define thunk-via-lambda (lambda () 4))
(define (thunk-via-parens) 66)
(define thunk-via-thunk (thunk 99))
(define not-a-thunk-value 231)
(define (not-a-thunk-function-arity x) (* x x))

(define thunk-via-thunk-that (thunk-that 425))
(define thunk-that-poison (thunk-that (raise (error "poison"))))

(define thunk-tests
  (test-suite
   "Thunk"

   (check-true (thunk? thunk-via-lambda))
   (check-eq? (dethunk-that thunk-via-lambda) 4)

   (check-true (thunk? thunk-via-parens))
   (check-eq? (dethunk-that thunk-via-parens) 66)

   (check-true (thunk? thunk-via-thunk))
   (check-eq? (dethunk-that thunk-via-thunk) 99)

   (check-false (thunk? not-a-thunk-value))
   (check-exn exn:fail? (lambda () (dethunk-that not-a-thunk-value)))

   (check-false (thunk? not-a-thunk-function-arity))
   (check-exn exn:fail? (lambda () (dethunk-that not-a-thunk-function-arity)))

   (check-true (procedure? thunk-via-thunk-that))
   (check-eq? (procedure-arity thunk-via-thunk-that) 0)
   (check-true (thunk? thunk-via-thunk-that))
   (check-eq? (thunk-via-thunk-that) 425)
   (check-eq? (dethunk-that thunk-via-thunk-that) 425)

   (check-true (procedure? thunk-that-poison))
   (check-eq? (procedure-arity thunk-that-poison) 0)
   (check-true (thunk? thunk-that-poison))

   (check-exn exn:fail? (lambda () (dethunk-that thunk-that-poison)))
   ))

(run-tests thunk-tests)

(define powers-of-two-stream
  (letrec ([f (lambda (x)
                (cons-with-thunk-check-on-next-stream x (thunk-that (f (* x 2)))))])
    (thunk-that (f 1))))

(define (pair-to-values pair)
  (if (pair? pair)
      (values (car pair) (cdr pair))
      (raise-argument-error "pair" "pair?" pair)))

(define-values (should-be-1 next-stream) (pair-to-values (destream powers-of-two-stream)))
(define-values (should-be-2 next-next-stream) (pair-to-values (destream next-stream)))
(define-values (should-be-4 next-next-next-stream) (pair-to-values (destream next-next-stream)))
(define-values (should-be-8 next-next-next-next-stream) (pair-to-values(destream next-next-next-stream)))

(define stream-tests
  (test-suite
   "Stream"

   (check-eq? 1 should-be-1)
   (check-eq? 2 should-be-2)
   (check-eq? 4 should-be-4)
   (check-eq? 8 should-be-8)

   (check-exn exn:fail? (lambda () (destream (dethunk-that powers-of-two-stream))))

   (check-exn exn:fail? (lambda () (destream (thunk-that (cons "ignored" not-a-thunk-value)))))
   (check-exn exn:fail? (lambda () (destream (thunk-that (cons "ignored" not-a-thunk-function-arity)))))

   (check-exn exn:fail? (lambda () (cons-with-thunk-check-on-next-stream "ignored" not-a-thunk-value)))
   (check-exn exn:fail? (lambda () (cons-with-thunk-check-on-next-stream "ignored" not-a-thunk-function-arity)))
   )
  )

(run-tests stream-tests)
