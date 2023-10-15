#lang racket
(require "deep_lists.rkt")

(require rackunit)

(define deep-foldl-tests
  (test-suite
   "deep-foldl"
  
   (check-equal? (deep-foldl + 0 '()) 0)
   (check-equal? (deep-foldl + 2 '()) 2)
   (check-equal? (deep-foldl + 0 '(1)) 1)
   (check-equal? (deep-foldl + 2 '(1)) 3)
   (check-equal? (deep-foldl + 0 '(3 4)) 7)
   (check-equal? (deep-foldl + 2 '(3 4)) 9)
   (check-equal? (deep-foldl + 0 '(1 2 3 4)) 10)
   (check-equal? (deep-foldl + 2 '(1 2 3 4)) 12)
   (check-equal? (deep-foldl + 0 (list 1 '(2 3) 4)) 10)
   (check-equal? (deep-foldl + 2 (list 1 '(2 3) 4)) 12)
   (check-equal? (deep-foldl + 0 (list 1 2 (list 3 4 5) 6 (list 7 8 (list 9 10) 11 12))) 78)
   (check-equal? (deep-foldl + 2 (list 1 2 (list 3 4 5) 6 (list 7 8 (list 9 10) 11 12))) 80)
  )
)

(define deep-foldr-tests
  (test-suite
   "deep-foldr"
   
   (check-equal? (deep-foldr + 0 '()) 0)
   (check-equal? (deep-foldr + 2 '()) 2)
   (check-equal? (deep-foldr + 0 '(1)) 1)
   (check-equal? (deep-foldr + 2 '(1)) 3)
   (check-equal? (deep-foldr + 0 '(3 4)) 7)
   (check-equal? (deep-foldr + 2 '(3 4)) 9)
   (check-equal? (deep-foldr + 0 '(1 2 3 4)) 10)
   (check-equal? (deep-foldr + 2 '(1 2 3 4)) 12)
   (check-equal? (deep-foldr + 0 (list 1 '(2 3) 4)) 10)
   (check-equal? (deep-foldr + 2 (list 1 '(2 3) 4)) 12)
   (check-equal? (deep-foldr + 0 (list 1 2 (list 3 4 5) 6 (list 7 8 (list 9 10) 11 12))) 78)
   (check-equal? (deep-foldr + 2 (list 1 2 (list 3 4 5) 6 (list 7 8 (list 9 10) 11 12))) 80)
  )
)

(define deep-flatten-tests
  (test-suite
   "deep-flatten"
   
   (check-equal? (deep-flatten '()) '())
   (check-equal? (deep-flatten '(1)) '(1))
   (check-equal? (deep-flatten '(1 2)) '(1 2))
   (check-equal? (deep-flatten '(1 2 3 4)) '(1 2 3 4))
   (check-equal? (deep-flatten (list 1 '(2 3) 4)) '(1 2 3 4))
   (check-equal? (deep-flatten (list 1 2 (list 3 4 5) 6 (list 7 8 (list 9 10) 11 12))) '(1 2 3 4 5 6 7 8 9 10 11 12))
   (check-equal? (deep-flatten (list 1 2 (list 3 "fred" 4 5) 6 (list 7 8 (list 9 "george" 10) 11 12))) '(1 2 3 "fred" 4 5 6 7 8 9 "george" 10 11 12))
  )
)

(define deep-sum-tests
  (test-suite
   "deep-sum"
   
   (check-equal? (deep-sum '()) 0)
   (check-equal? (deep-sum '(1)) 1)
   (check-equal? (deep-sum '(1 2)) 3)
   (check-equal? (deep-sum '(1 2 3 4)) 10)
   (check-equal? (deep-sum (list 1 '(2 3) 4)) 10)
   (check-equal? (deep-sum (list 1 2 (list 3 4 5) 6 (list 7 8 (list 9 10) 11 12))) 78)
  )
)

(define deep-sum-numbers-tests
  (test-suite
   "deep-sum-numbers"
   
   (check-equal? (deep-sum-numbers '()) 0)
   (check-equal? (deep-sum-numbers '(1)) 1)
   (check-equal? (deep-sum-numbers '(1 2)) 3)
   (check-equal? (deep-sum-numbers '(1 2 3 4)) 10)
   (check-equal? (deep-sum-numbers (list 1 '(2 3) 4)) 10)
   (check-equal? (deep-sum-numbers (list 1 2 (list 3 4 5) 6 (list 7 8 (list 9 10) 11 12))) 78)
   (check-equal? (deep-sum-numbers (list "fred" "george")) 0)
   (check-equal? (deep-sum-numbers (list 1 2 (list 3 "fred" 4 5) 6 (list 7 8 (list 9 "george" 10) 11 12))) 78)
  )
)

(require rackunit/text-ui)

(run-tests deep-foldl-tests)
(run-tests deep-foldr-tests)
(run-tests deep-flatten-tests)
(run-tests deep-sum-tests)
(run-tests deep-sum-numbers-tests)


