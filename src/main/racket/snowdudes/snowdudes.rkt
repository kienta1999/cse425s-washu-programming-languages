#lang racket
(require 2htdp/image)
(provide (all-defined-out))

(define (snowball radius)
  (circle radius "outline" "blue"))

(define (stick length)
  (rectangle length (* 0.1 length) "solid" "brown"))

(define (hat brim-width color)
   (above
    (rectangle (* 0.6 brim-width) (* 0.4 brim-width) "solid" color)
    (rectangle brim-width (* 0.2 brim-width) "solid" color)))

(define (snowdude base-radius)
  (overlay/align/offset
   "middle"
   "top"
   (hat (* 1.6 base-radius) "black")
   0
   (* 0.7 base-radius)
   (above
    (overlay
     (isosceles-triangle (* 0.4 base-radius) 330 "solid" "orange")
     (snowball (* 0.6 base-radius))
     )
    (beside
     (stick (* 0.9 base-radius))
     (snowball (* 0.8 base-radius))
     (stick (* 0.9 base-radius)))
    (snowball base-radius))))


(module+ main ; evualated when enclosing module is run directly (that is: not via require)
  (beside/align
   "bottom"
   (snowdude 60)
   (snowdude 30)
   (snowdude 20)
   (snowdude 65)))