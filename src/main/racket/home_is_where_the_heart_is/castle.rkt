#lang racket
(require 2htdp/image)
(provide (all-defined-out))

; Kien Ta


(define (castle base-width)
   (error 'not-yet-implemented))

(module+ main ; evualated when enclosing module is run directly (that is: not via require)
  (castle 300)
)
