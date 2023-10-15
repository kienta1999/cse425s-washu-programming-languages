#lang racket
; Dennis Cosgrove

(require "../uw5/uw5.rkt")

(define (padded-string x)
  (~a x #:min-width 24 #:align 'right #:left-pad-string " "))

(define (eval-and-displaylns prefix expression)
  (begin
    (displayln (string-append (padded-string prefix) " expression: " (~v expression)))
    (displayln (string-append (padded-string prefix) " evaluation: " (~v (eval-exp expression))))
    (displayln "")))

(eval-and-displaylns "int_example" (int 425))
(eval-and-displaylns "ifgreater_example" (ifgreater (int 425) (int 231) (int 42) (int 7)))

(eval-and-displaylns "apair_example" (apair (int 425) (int 231)))
(eval-and-displaylns "fst_example" (fst (apair (int 425) (int 231))))
(eval-and-displaylns "snd_example" (snd (apair (int 425) (int 231))))

(eval-and-displaylns "aunit_example" (aunit))
(eval-and-displaylns "isaunit_(false)_example" (isaunit (aunit)))
(eval-and-displaylns "isaunit_(true)_example" (isaunit (apair (int 425) (int 231))))

(eval-and-displaylns "mlet_example" (mlet "a" (int 425) (add (var "a") (int 231))))
(eval-and-displaylns "mlet_apair_example" (mlet "pr" (apair (int 425) (int 231)) (add (fst (var "pr")) (snd (var "pr")))))
(eval-and-displaylns "nested_mlets_example" (mlet "a" (int 425) (mlet "b" (int 231) (add (var "a") (var "b")))))

