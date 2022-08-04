;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |lot of functions chapter 2.1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define (clength x y)
  (sqrt (+ (* x x) (* y y))))

(define (cvolume s)
  (expt s 3))

(define (csurface s)
  (* (expt s 2) 6))

(define (string-first string)
  (if (< 0 (string-length string)) (substring string 0 1) "String must include at least one character"))

(define (string-last string)
  (if (< 0 (string-length string)) (substring string (- (string-length string) 1)) "String must include at least one character"))
  
(define (==> sunny friday)
  (and (not sunny) friday))

(define (image-area image)
  (* (image-width image) (image-height image)))


(define (image-classify image)
  (cond[(= (image-width image) (image-height image)) "square"]
       [(> (image-width image) (image-height image)) "wide"]
       [(< (image-width image) (image-height image)) "tall"]))

(define (string-join string1 string2)
  (string-append string1 "_" string2))

(define (string-insert string index)
  (string-append (substring string 0 index) "_" (substring string index)))

(define (string-delete string index)
  (if (> (string-length string) 0) (string-append (substring string 0 index) (substring string (+ 1 index))) "number must be longer than 0"))





