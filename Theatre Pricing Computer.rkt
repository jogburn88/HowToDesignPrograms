;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Theatre Pricing Computer|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define BASE-ATTENDANCE 120)
(define BASE-TICKET-PRICE 5.0)
(define INCREMENT-PEOPLE 15)
(define UNIT-OF-CHANGE 0.1)
(define PRICE-SENSITIVITY (/ INCREMENT-PEOPLE UNIT-OF-CHANGE))
(define FIXED-COST 0)
(define COST-PER-ATTENDEE 1.50)

(define (attendees ticket-price)
  (- BASE-ATTENDANCE (* (- ticket-price BASE-TICKET-PRICE) PRICE-SENSITIVITY)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXED-COST (* COST-PER-ATTENDEE (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))


(profit 3.60)
(profit 3.70)
(profit 3.80)
