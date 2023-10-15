#lang racket
(require 2htdp/image)
(provide (all-defined-out))

; Kien Ta

(define (heart side-length color)
   (error 'not-yet-implemented))


(module+ main ; evualated when enclosing module is run directly (that is: not via require)
  (heart 200 "red")
)
