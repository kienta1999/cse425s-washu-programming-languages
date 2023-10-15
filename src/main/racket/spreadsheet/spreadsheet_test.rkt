#lang racket

(require "spreadsheet.rkt")
(require 2htdp/batch-io)
(require rackunit)

; Dennis Cosgrove

(define string->cell-tests
  (test-suite
   "string->cell"
  
   (check-equal? (string->cell "fred") "fred")
   (check-equal? (string->cell "42") 42)
   (check-equal? (string->cell "") (void))
  )
)

(define (string->csv s)
  (simulate-file read-csv-file s))

(define nums-csv (string->csv "1,2,3,4\n10,20,30,40"))
(define grades-csv (string->csv "Name,Java List,SML Calendar,SML Hearts,SML Card Game,Java HOF,SML Binary Tree,SML Pattern Matching\nMax,100,104,100,104,100,100,105\nJoshua Bloch,100,85,80,75,100,70,65\nHarry Q. Bovik,80,81,82,83,84,85,86\nDan Grossman,75,104,100,104,80,100,105\nShannon O'Ganns,70,40,0,120,120,130,140"))
(define hockey-csv (string->csv "Name,Uniform Number,Birth Year,Games Played,Goals,Assists\nBobby Orr,4,1948,657,270,645\nWayne Gretzky,99,1961,1487,894,1963\nMario Lemieux,66,1965,915,690,1033"))
(define string-void-number-csv (string->csv "A,,1\nB,,2"))

(define nums-sheet
  '((1 2 3 4)
    (10 20 30 40)))
(define grades-sheet
  '(("Name" "Java List" "SML Calendar" "SML Hearts" "SML Card Game" "Java HOF" "SML Binary Tree" "SML Pattern Matching")
    ("Max" 100 104 100 104 100 100 105)
    ("Joshua Bloch" 100 85 80 75 100 70 65)
    ("Harry Q. Bovik" 80 81 82 83 84 85 86)
    ("Dan Grossman" 75 104 100 104 80 100 105)
    ("Shannon O'Ganns" 70 40 0 120 120 130 140)))
(define hockey-sheet
  '(("Name" "Uniform Number" "Birth Year" "Games Played" "Goals" "Assists")
    ("Bobby Orr" 4 1948 657 270 645)
    ("Wayne Gretzky" 99 1961 1487 894 1963)
    ("Mario Lemieux" 66 1965 915 690 1033)))
(define string-void-number-sheet
  (list
   (list "A" (void) 1)
   (list "B" (void) 2)))
 
(define csv->spreadsheet-tests
  (test-suite
   "csv->spreadsheet"
  
   (check-equal? (csv->spreadsheet nums-csv) nums-sheet)
   (check-equal? (csv->spreadsheet grades-csv) grades-sheet)
   (check-equal? (csv->spreadsheet hockey-csv) hockey-sheet)
   (check-equal? (csv->spreadsheet string-void-number-csv) string-void-number-sheet)
  )
)

(define row-count-tests
  (test-suite
   "row-count"
  
   (check-equal? (row-count nums-sheet) 2)
   (check-equal? (row-count grades-sheet) 6)
   (check-equal? (row-count hockey-sheet) 4)
   (check-equal? (row-count string-void-number-sheet) 2)
  )
)

(define row-at-tests
  (test-suite
   "row-at"
  
   (check-equal? (row-at nums-sheet 0) '(1 2 3 4))
   (check-equal? (row-at nums-sheet 1) '(10 20 30 40))
   (check-equal? (row-at grades-sheet 0) '("Name" "Java List" "SML Calendar" "SML Hearts" "SML Card Game" "Java HOF" "SML Binary Tree" "SML Pattern Matching"))
   (check-equal? (row-at grades-sheet 1) '("Max" 100 104 100 104 100 100 105))
   (check-equal? (row-at grades-sheet 2) '("Joshua Bloch" 100 85 80 75 100 70 65))
   (check-equal? (row-at grades-sheet 3) '("Harry Q. Bovik" 80 81 82 83 84 85 86))
   (check-equal? (row-at grades-sheet 4) '("Dan Grossman" 75 104 100 104 80 100 105))
   (check-equal? (row-at grades-sheet 5) '("Shannon O'Ganns" 70 40 0 120 120 130 140))
   (check-equal? (row-at hockey-sheet 0) '("Name" "Uniform Number" "Birth Year" "Games Played" "Goals" "Assists"))
   (check-equal? (row-at hockey-sheet 1) '("Bobby Orr" 4 1948 657 270 645))
   (check-equal? (row-at hockey-sheet 2) '("Wayne Gretzky" 99 1961 1487 894 1963))
   (check-equal? (row-at hockey-sheet 3) '("Mario Lemieux" 66 1965 915 690 1033))
   (check-equal? (row-at string-void-number-sheet 0) (list "A" (void) 1))
   (check-equal? (row-at string-void-number-sheet 1) (list "B" (void) 2))
  )
)

(define sum-row-tests
  (test-suite
   "sum-row"
  
   (check-equal? (sum-row nums-sheet 0) 10)
   (check-equal? (sum-row nums-sheet 1) 100)
   (check-equal? (sum-row grades-sheet 0) 0)
   (check-equal? (sum-row grades-sheet 1) 713)
   (check-equal? (sum-row grades-sheet 2) 575)
   (check-equal? (sum-row grades-sheet 3) 581)
   (check-equal? (sum-row grades-sheet 4) 668)
   (check-equal? (sum-row grades-sheet 5) 620)
   (check-equal? (sum-row hockey-sheet 0) 0)
   (check-equal? (sum-row hockey-sheet 1) 3524)
   (check-equal? (sum-row hockey-sheet 2) 6404)
   (check-equal? (sum-row hockey-sheet 3) 4669)
   (check-equal? (sum-row string-void-number-sheet 0) 1)
   (check-equal? (sum-row string-void-number-sheet 1) 2)
  )
)

(define sum-row-functions-tests
  (let* ([function-csv (string->csv "(+ 1 2),(+ 3 4)\n(/ 10 2),(sqrt (/ 1 4))\n(sin (/ 3.14159 4)),10")]
         [function-sheet (csv->spreadsheet function-csv)])
    (test-suite
     "sum-row-functions"
  
     (check-equal? (sum-row function-sheet 0) 10)
     (check-equal? (sum-row function-sheet 1) (+ 5 (/ 1 2)))
     (check-within (sum-row function-sheet 2) 10.707106312093558 0.0000001)
     )
    )
)

(require rackunit/text-ui)

(run-tests string->cell-tests)
(run-tests csv->spreadsheet-tests)
(run-tests row-count-tests)
(run-tests row-at-tests)
(run-tests sum-row-tests)
(run-tests sum-row-functions-tests)





