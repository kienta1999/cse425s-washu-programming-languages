;; Programming Languages, Homework 5

#lang racket
(provide (all-defined-out)) ;; so we can put tests in a second file

;; definition of structures for MUPL programs - Do NOT change
(struct var  (string) #:transparent)  ;; a variable, e.g., (var "foo")
(struct int  (num)    #:transparent)  ;; a constant number, e.g., (int 17)
(struct add  (e1 e2)  #:transparent)  ;; add two expressions
(struct ifgreater (e1 e2 e3 e4)    #:transparent) ;; if e1 > e2 then e3 else e4
(struct fun  (nameopt formal body) #:transparent) ;; a recursive(?) 1-argument function
(struct call (funexp actual)       #:transparent) ;; function call
(struct mlet (var e body) #:transparent) ;; a local binding (let var = e in body) 
(struct apair (e1 e2)     #:transparent) ;; make a new pair
(struct fst  (e)    #:transparent) ;; get first part of a pair
(struct snd  (e)    #:transparent) ;; get second part of a pair
(struct aunit ()    #:transparent) ;; unit value -- good for ending a list
(struct isaunit (e) #:transparent) ;; evaluate to 1 if e is unit else 0

;; a closure is not in "source" programs but /is/ a MUPL value; it is what functions evaluate to
(struct closure (env fun) #:transparent) 

;; Problem 1

;; CHANGE (put your solutions here)

; Kien Ta
(define (racketlist->mupllist xs)
  (if (null? xs)
      (aunit)
      (let* ([hd (car xs)]
             [tl (cdr xs)])
        (apair hd (racketlist->mupllist tl)))))

(define (mupllist->racketlist xs)
  (if (aunit? xs)
      null
      (let* ([hd (apair-e1 xs)]
             [tl (apair-e2 xs)])
        (cons hd (mupllist->racketlist tl)))))

;; Problem 2

;; lookup a variable in an environment
;; Do NOT change this function
(define (envlookup env str)
  (cond [(null? env) (error "unbound variable during evaluation" str)]
        [(equal? (car (car env)) str) (cdr (car env))]
        [#t (envlookup (cdr env) str)]))

; CSE 425 utility
(define (mupl-value? value)
  (or (int? value) (closure? value) (aunit? value) (apair? value))) 

; CSE 425 utility
(define (expand-environment name value env)
  (cond [(not (string? name)) (error (string-append "illegal name: " (~a name)))]
        [(not (mupl-value? value)) (error (string-append "illegal value " (~a value)))]
        [#t (cons (cons name value) env)])) 

;; Do NOT change the two cases given to you.  
;; DO add more cases for other kinds of MUPL expressions.
;; We will test eval-under-env by calling it directly even though
;; "in real life" it would be a helper function of eval-exp.
(define (eval-under-env e env)
  (cond [(var? e) 
         (envlookup env (var-string e))]
        [(add? e) 
         (let ([v1 (eval-under-env (add-e1 e) env)]
               [v2 (eval-under-env (add-e2 e) env)])
           (if (and (int? v1)
                    (int? v2))
               (int (+ (int-num v1) 
                       (int-num v2)))
               (error "MUPL addition applied to non-number")))]
        ;; CHANGE add more cases here
        [(apair? e)
         (let ([v1 (eval-under-env (apair-e1 e) env)]
               [v2 (eval-under-env (apair-e2 e) env)])
           (apair v1 v2))
         ]
        [(mupl-value? e) e]
        [(fun? e)
         (let* ([nameopt (fun-nameopt e)]
                [formal (fun-formal e)]
                [evaled-body (fun-body e)])
           (cond [(not (string? formal)) (error (string-append "(fun nameopt formal body) formal should be a string: " (~a formal)))]
                 [(not (or (string? nameopt) (equal? nameopt #f))) (error (string-append "(fun nameopt formal body) nameopt should be a string or #f: " (~a formal)))]
                 [#t (closure env e)])
           )]
        [(ifgreater? e)
         (let ([v1 (eval-under-env (ifgreater-e1 e) env)]
               [v2 (eval-under-env (ifgreater-e2 e) env)])
           (if (and (int? v1)
                    (int? v2))
               (if (> (int-num v1) (int-num v2))
                   (eval-under-env (ifgreater-e3 e) env)
                   (eval-under-env (ifgreater-e4 e) env))
               (error "(ifgreater e1 e2 e3 e4) e1 & e2 must be number")))]
        [(call? e)
         (let ([funexp (eval-under-env (call-funexp e) env)]
               [actual (eval-under-env (call-actual e) env)])
           (cond [(not (closure? funexp)) (error (string-append "(call funexp actual) funexp should be a closure: " (~a funexp)))]
                 [#t

                  (let* ([curr-fun (closure-fun funexp)]
                         [curr-nameopt (fun-nameopt curr-fun)]
                         [formal (fun-formal curr-fun)]
                         [body (fun-body curr-fun)]
                         [curr-env (if curr-nameopt (expand-environment curr-nameopt funexp (closure-env funexp)) (closure-env funexp))])
                    (eval-under-env body (expand-environment formal actual curr-env))
                    )
                  ])
           )]
        [(mlet? e)
         (let ([var (mlet-var e)]
               [value (eval-under-env (mlet-e e) env)]
               [body (mlet-body e)])
           (if (string? var)
               (eval-under-env body (expand-environment var value env))
               (error (string-append "(mlet var e body) var must be a string" (~a var)))))]

        [(fst? e)
         (let ([curr-pair (eval-under-env (fst-e e) env)])
           (if (apair? curr-pair)
               (eval-under-env (apair-e1 curr-pair) env)
                (error (string-append "(fst e) e must be a pair" (~a curr-pair)))))
         ]

        [(snd? e)
         (let ([curr-pair (eval-under-env (snd-e e) env)])
           (if (apair? curr-pair)
               (eval-under-env (apair-e2 curr-pair) env)
               (error (string-append "(snd e) e must be a pair" (~a curr-pair)))))
         ]

        [(isaunit? e)
         (let ([curr-unit (eval-under-env (isaunit-e e) env)])
           (if (aunit? curr-unit)
               (int 1)
               (int 0)))
         ]
        
        [#t (error (format "bad MUPL expression: ~v" e))]))

;; Do NOT change
(define (eval-exp e)
  (eval-under-env e null))
        
;; Problem 3

(define (ifaunit e1 e2 e3)
  (ifgreater (isaunit e1) (int 0) e2 e3))

(define (mlet* lstlst e2) 
  (if (null? lstlst) e2
      (let* ([hd (car lstlst)]
             [tl (cdr lstlst)])
        (mlet (car hd) (cdr hd) (mlet* tl e2))
        ))) 

(define (ifeq e1 e2 e3 e4) 
  (ifgreater e1 e2 e4 (ifgreater e2 e1 e4 e3)))


;; Problem 4

; Complete WashU MUPL Programs Studio Below

; racket version for reference
(define (racket-double n) (+ n n))
; CSE 425 MUPL Program
; mupl-double return a mupl-function which doubles its mupl-int argument
(define mupl-double 
  (fun #f "x" (add (var "x") (var "x")))) 

; racket version for reference
(define (racket-sum-curry a) (lambda (b) (+ a b)))
; CSE 425 MUPL Program
; mupl-sum-curry return a mupl-function which returns a mupl-function which adds the two mupl-function's mupl-int arguments together
(define mupl-sum-curry
  (fun #f "a" (fun #f "b" (add (var "a") (var "b")))))

; racket version for reference
(define (racket-map-one proc) (proc 1))
; CSE 425 MUPL Program
; mupl-map-one: return a mupl-function that invoks the mupl-function passed in with the mupl-int argument 1
(define mupl-map-one
  (fun #f "proc" (call (var "proc") (int 1))))

; UW HW4 Continues Below

(define mupl-map
  (fun #f "f"
       (fun "map-helper" "xs"
            (ifaunit (var "xs") (aunit)
                     (mlet* (list (cons "hd" (fst (var "xs"))) (cons "tl" (snd (var "xs"))))
                            (apair (call (var "f") (var "hd")) (call (var "map-helper") (var "tl")) )
                            )
                     )
            )) )
; (check-equal? (eval-exp (call (call mupl-map (fun #f "x" (add (var "x") (int 7)))) (apair (int 9)(apair (int 1) (aunit))))) (apair (int 16) (apair (int 8) (aunit))) "mupl-map test")
; (eval-exp (fun "hello" "x" (add (var "x") (int 7))))

(define mupl-mapAddN 
  (mlet "map" mupl-map 
        (fun #f "i" (call (var "map")
                          (fun "f" "x" (add (var "x") (var "i"))))))) 

;; Challenge Problem


(struct fun-challenge (nameopt formal body freevars) #:transparent) ;; a recursive(?) 1-argument function



;; We will test this function directly, so it must do
;; as described in the assignment
(define (compute-free-vars e)
  "CHANGE") 

;; Do NOT share code with eval-under-env because that will make
;; auto-grading and peer assessment more difficult, so
;; copy most of your interpreter here and make minor changes
(define (eval-under-env-c e env)
  "CHANGE") 


;; Do NOT change this
(define (eval-exp-c e)
  (eval-under-env-c (compute-free-vars e) null))
