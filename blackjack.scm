(define (stupid-strategy my-hand opponent-up-card)
  (> opponent-up-card 5))
    
(define (play-hand strategy my-hand opponent-up-card)
  (cond ((> (hand-total my-hand) 21) my-hand) ; I lose... give up
	((strategy my-hand opponent-up-card)    ; hit?
	 (play-hand strategy
		    (hand-add-card my-hand (deal))
		    opponent-up-card))
	(else my-hand)))                        ;stay
(define (make-hand up-card total)
  (cons up-card total))

(define (hand-up-card hand)
  (car hand))

(define (hand-total hand)
  (cdr hand))

(define (make-new-hand first-card)
  (make-hand first-card first-card))

(define (hand-add-card hand new-card)
  (make-hand (hand-up-card hand)
	     (+ new-card (hand-total hand))))

(define (deal) (+ 1 (random 10)))

(define (twenty-one player-strategy house-strategy)
  (let ((house-initial-hand (make-new-hand (deal))))
    (let ((player-hand ; set up intitial hand, and play out
	   (play-hand player-strategy ; strategy to use
		      (make-new-hand (deal))
		      (hand-up-card house-initial-hand))))
      (if (> (hand-total player-hand) 21)
	  0                 ; bust - player loses
	  (let ((house-hand ; play out hand
		 (play-hand house-strategy
			    house-initial-hand
			    (hand-up-card player-hand))))
	    (cond ((> (hand-total house-hand) 21)
		   1)       ;bust - house loses
		  ((> (hand-total player-hand)
		      (hand-total house-hand))
		   1)            ; house loses
		  (else 0))))))) ; player loses

(define (hit? your-hand opponent-up-card)
  (newline)
  (princ "Opponent up card")
  (princ opponent-up-card)
  (newline)
  (princ "Your Total: ")
  (princ (hand-total your-hand))
  (newline)
  (princ "Hit? ")
  (user-says-y?))

; play strategy against itself
(twenty-one stupid-strategy stupid-strategy)

; play against yourself
(twenty-one hit? hit?)

