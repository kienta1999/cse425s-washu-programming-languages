#lang racket
(require 2htdp/image)
(provide (all-defined-out))

(define (spiral len iter)
  (if (zero? iter)
      (line len 0 "red")
      (beside/align "bottom"
                    (line len 0 "blue")
                    (rotate 10 (spiral (* 0.9 len) (- iter 1))))))

(spiral 100 0)
(spiral 100 1)
(spiral 100 2)
(spiral 100 3)
(spiral 100 4)
(spiral 100 42)
