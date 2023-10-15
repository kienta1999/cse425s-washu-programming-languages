#lang racket
(require (prefix-in image: 2htdp/image))
(provide (all-defined-out))

(struct point (x y) #:transparent)
(struct rectangle (a b fill outline) #:transparent)
(struct circle (center radius fill outline) #:transparent)
(struct group (offset children) #:transparent)

(define (translate pt image)
  (image:overlay/xy image:empty-image (point-x pt) (point-y pt) image))

(define (to-image-circle radius outline-color fill-color)
  (image:overlay
   (image:circle radius "outline" outline-color)
   (image:circle radius "solid" fill-color)))

(define (to-image-rectangle width height outline-color fill-color)
  (image:overlay
   (image:rectangle width height "outline" outline-color)
   (image:rectangle width height "solid" fill-color)))

; Kien Ta


(define (rectangle-min-x rect)
        (error 'not-yet-implemented)) 

(define (rectangle-min-y rect)
        (error 'not-yet-implemented)) 

(define (rectangle-min rect)
  (point (rectangle-min-x rect) (rectangle-min-y rect)))



(define (rectangle-width rect)
        (error 'not-yet-implemented)) 

(define (rectangle-height rect)
        (error 'not-yet-implemented)) 

(define (to-image graphic)
    (error 'not-yet-implemented)) 

(define yellow-red-circle (circle (point 10 20) 40 (image:make-color 255 255 109) (image:make-color 144 0 0)))
(to-image yellow-red-circle)

(define blue-black-circle (circle (point 50 70) 40 (image:make-color 0 109 219) "black"))
(to-image blue-black-circle)

(define base-rect (rectangle (point 0 0) (point 140 180) (image:make-color 182 219 255) "black"))
(to-image base-rect)

(define crest (group (point 10 20) (list yellow-red-circle blue-black-circle base-rect)))
(to-image crest)

