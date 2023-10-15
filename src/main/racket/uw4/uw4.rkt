
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

; Kien Ta

; Complete WashU Thunk and Stream WarmUp Below

; CSE 425 Utility Function
(define (thunk? th) 
        (error 'not-yet-implemented)) 

; CSE 425 Utility Macro
; NOTE: macros use define-syntax-rule
(define-syntax-rule (thunk-that e)
        (error 'not-yet-implemented)) 

; CSE 425 Utility Function
(define (dethunk-that thunk)
        (error 'not-yet-implemented))

; CSE 425 Utility Function
(define (destream stream)
        (error 'not-yet-implemented)) 

; CSE 425 Utility Function
(define (cons-with-thunk-check-on-next-stream element next-stream)
        (error 'not-yet-implemented)) 

; Complete UW HW4 Below
(define (sequence low high stride)
  (if (> low high)
      null
      (cons low (sequence (+ low stride) high stride)))
  )

(define (string-append-map xs suffix)
  (map (lambda (s)
         (string-append s suffix)) xs)
)

(define (list-nth-mod xs n)
  (cond [(null? xs) (error "list-nth-mod: empty list")]
        [(< n 0) (error "list-nth-mod: negative number")]
        [#t (let
                ([r (remainder  n (length xs))])
              (car (list-tail xs r)))]))

(define (stream-for-n-steps s n)
  (if (= n 0)
      null
      (let* ([pair (s)]
            [head (car pair)]
            [remaining (cdr pair)])
        (cons head (stream-for-n-steps remaining (- n 1))))))

(define funny-number-stream
  (letrec ([f (lambda (x) (cons x (lambda () (f
    (cond [(= (remainder x 5) 0) (+ (- x) 1)]
        [(= (remainder x 5) 4) (- (+ x 1))]
        [#t (+ x 1)])))))])
    (lambda () (f 1))))

(define dan-then-dog
  (letrec ([f (lambda (x) (cons x (lambda () (f
    (cond [(equal? x "dan.jpg") "dog.jpg"]
      [(equal? x "dog.jpg") "dan.jpg"]
      [#t (error "wrong")])))))])
    (lambda () (f "dan.jpg"))))

(define (stream-add-zero s)
  (let* ([pair (s)]
         [head (car pair)]
         [remaining (cdr pair)])
    (lambda () (cons (cons 0 head) (stream-add-zero remaining)))))


; (define ones (lambda () (cons 1 ones)))

(define (cycle-lists xs ys)
  (let* ([hd-xs (car xs)]
         [tl-xs (cdr xs)]
         [hd-ys (car ys)]
         [tl-ys (cdr ys)])
    (lambda () (cons (cons hd-xs hd-ys) (cycle-lists (append tl-xs (cons hd-xs null)) (append tl-ys (cons hd-ys null)))))))

(define (vector-assoc v vec)
  (letrec ([helper-vector-assoc (lambda(pos)
        (if (>= pos (vector-length vec))
        #f
        (let* ([len (vector-length vec)]
         [head (vector-ref vec pos)])
         (if (and (pair? head) (equal? (car head) v))
              head
              (helper-vector-assoc(+ pos 1))))))])
    (helper-vector-assoc 0)))

(define (cached-assoc xs n)
  (letrec([memo (make-vector n #f)]
          [next-slot 0]
          [f (lambda (v)
               (let ([ans (vector-assoc v memo)])
                 (if ans
                     (cdr ans)
                     (let ([new-ans (assoc v xs)])
                       (begin
                         (vector-set! memo next-slot (cons v new-ans))
                         (set! next-slot (remainder (+ next-slot 1) n))
                         new-ans)))))])
    f)
)