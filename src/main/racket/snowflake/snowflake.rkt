#lang racket
(require 2htdp/image)
(provide (all-defined-out))

; Kien Ta
(define (snowflake len iter is-flipped) 
      (if (= iter 0)
      (rotate 45 (line len len "blue"))
      (let* ([small-snowflake (snowflake (/ len 3) (- iter 1) is-flipped)])
        (beside/align "bottom"
              small-snowflake
              (rotate 60 small-snowflake)
              (if is-flipped (rotate 120 small-snowflake) (rotate 120 (flip-vertical small-snowflake)))
              small-snowflake
         )))) 

(define (snowflake-symmetric len iter)
  (snowflake len iter #f))

(define (snowflake-flipped len iter)
  (snowflake len iter #t))

(module+ main ; evualated when enclosing module is run directly (that is: not via require)
  (for-each
   displayln
   (local
     ([define length 400])
     (append
      (for/list ([iter (in-range 5)])
        (snowflake-symmetric length iter))
      (for/list ([iter (in-range 5)])
        (snowflake-flipped length iter))))))
