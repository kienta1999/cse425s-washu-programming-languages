#lang racket
;; Programming Languages Homework 5 Simple Test
;; Save this file to the same directory as your homework file
;; These are basic tests. Passing these tests does not guarantee that your code will pass the actual homework grader

;; Be sure to put your homework file in the same folder as this test file.
;; Uncomment the line below and, if necessary, change the filename
(require "uw5.rkt")

(require rackunit)

(define value?-tests
  (test-suite
   "mupl-value?"
   
   (check-true (mupl-value? (aunit)))

   (check-true (mupl-value? (int 42)))
   (check-false (mupl-value? 42))

   (check-true (mupl-value? (apair (aunit) (aunit))))
   (check-true (mupl-value? (apair (int 231) (int 425))))
   (check-false (mupl-value? (cons 231 425)))
   (check-false (mupl-value? (cons (aunit) (aunit))))
   (check-false (mupl-value? (cons (int 231) (int 425))))

   (check-true (mupl-value? (closure '() (fun #f "unused" (aunit)))))
   (check-false (mupl-value? (fun #f "unused" (aunit))))

   (check-false (mupl-value? (var "i")))
   (check-false (mupl-value? (add (int 231) (int 425))))
   (check-false (mupl-value? (ifgreater (int 3) (int 4) (int 3) (int 2))))
   (check-false (mupl-value? (mlet "x" (int 1) (add (int 5) (var "x")))))
   (check-false (mupl-value? (call (closure '() (fun #f "x" (add (var "x") (int 7)))) (int 1))))
   (check-false (mupl-value? (fst (apair (int 1) (int 2)))))
   (check-false (mupl-value? (snd (apair (int 1) (int 2)))))
   (check-false (mupl-value? (isaunit (closure '() (fun #f "x" (aunit))))))

   (check-false (mupl-value? #t) "racket booleans are not mupl-values")
   (check-false (mupl-value? "fred") "racket strings are not mupl-values")
   (check-false (mupl-value? '()) "racket lists are not mupl-values")
  )
)

(define valid-name "fred")
(define invalid-name #t)
(define valid-value (aunit))
(define invalid-value 42)

(define expand-environment-tests
  (test-suite
   "expand-environment"
   
   (check-equal? (expand-environment "fred" (int 425) '()) (list (cons "fred" (int 425))))
   (check-equal? (expand-environment "george" (int 231) (list (cons "fred" (int 425)))) (list (cons "george" (int 231)) (cons "fred" (int 425))))

   (check-exn exn:fail? (λ () (expand-environment invalid-name valid-value '())))
   (check-exn exn:fail? (λ () (expand-environment valid-name invalid-value '())))
   (check-exn exn:fail? (λ () (expand-environment invalid-name invalid-value '())))
  )
)

(require rackunit/text-ui)
;; runs the test
(run-tests value?-tests)
(run-tests expand-environment-tests)
