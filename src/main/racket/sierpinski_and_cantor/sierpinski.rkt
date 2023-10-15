#lang racket
(require 2htdp/image)
(require "spacer.rkt")
(provide (all-defined-out))

; Kien Ta
(define (sierpinski-triangle side-length n)
  (if (= n 0)
      (triangle side-length "solid" "blue")
      (let* ([small-triagle (sierpinski-triangle (/ side-length 2) (- n 1))])
        (above small-triagle
               (beside small-triagle small-triagle)))))

(define (sierpinski-carpet side-length n)
      (if (= n 0)
      (rectangle side-length side-length "solid" "orange")
      (let* ([small-square (sierpinski-carpet (/ side-length 3) (- n 1))])
        (above (beside small-square small-square small-square)
               (beside small-square (rectangle (/ side-length 3) (/ side-length 3) "solid" (color 0 0 0 0)) small-square)
               (beside small-square small-square small-square)
               ))))

(module+ main ; evualated when enclosing module is run directly (that is: not via require)
  (sierpinski-triangle 400 0)
  (sierpinski-triangle 400 1)
  (sierpinski-triangle 400 2)
  (sierpinski-triangle 400 3)
  (sierpinski-triangle 400 4)

  (sierpinski-carpet 400 0)
  (sierpinski-carpet 400 1)
  (sierpinski-carpet 400 2)
  (sierpinski-carpet 400 3)
  (sierpinski-carpet 400 4)
)
