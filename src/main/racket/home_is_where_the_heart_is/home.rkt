#lang racket
(require 2htdp/image)
(provide (all-defined-out))

; Kien Ta
(define (home roof-side-length roof-color base-width base-height base-color door-width door-height door-color)
   (error 'not-yet-implemented))

(module+ main ; evualated when enclosing module is run directly (that is: not via require)
  (home 125 "green" 100 100 "brown" 25 50 "yellow")
)
