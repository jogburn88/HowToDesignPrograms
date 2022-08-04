;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |functions using design recipe|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; I am using a string to represent data
; String -> String
; returns the first letter of any string
(check-expect (string-first "this") "t")
(check-expect (string-first "happy") "h")

(define (string-first string)
  (substring string 0 1))

; I am using a string to represent data
; String -> String
; returns the last letter of any string
(check-expect (string-last "best") "t")
(check-expect (string-last "muppet") "t")

(define (string-last string)
  (substring string (- (string-length string) 1)))

; representing the data as a number
; Image -> number
; returns the number of pixels in an image
(check-expect (image-area (rectangle 30 30 "solid" "green")) 900)
(check-expect (image-area (rectangle 10 10 "solid" "green")) 100)

(define (image-area image)
  (* (image-height image) (image-width image)))

; representing the data with a string
; String -> String
; returns the given string without the first char
(check-expect (string-rest "gimlet") "imlet")
(check-expect (string-rest "hand") "and")

(define (string-rest string)
  (substring string 1))

; represent the data as a string
; String -> String
; returns the given string without the last character
(check-expect (string-remove-last "jackie") "jacki")
(check-expect (string-remove-last "fellow") "fello")

(define (string-remove-last string)
  (substring string 0 (- (string-length string) 1)))
