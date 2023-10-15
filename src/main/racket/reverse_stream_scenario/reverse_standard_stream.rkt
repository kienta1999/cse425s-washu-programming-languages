#lang racket

(define ones (stream-cons 1 ones))

(stream? ones)
(stream-first ones)
(stream-first (stream-rest ones))
(stream-first (stream-rest (stream-rest ones)))

(define first-10 (stream-take ones 10))
(stream->list first-10)

;(println "stream-length of first-10: ")
;(stream-length first-10)

;(println "stream-length of ones...")
;(stream-length ones)
;(println "never reaches here.")
