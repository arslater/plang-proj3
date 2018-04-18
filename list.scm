(define (Visit tree)
	(getType(car tree)(cdr tree))
	
)
(define (getType Node tree)
	(cond (( equal? "S" Node)
		   (display "STATMENTS NODE")
		   (parseStatementsNode tree))	
		   ((equal?  "W" Node)
		   (display "While     Node"))
		   (else "tf you doin'?"    )
	)
)

(define (parseStatementsNode NodeQueue)
	(newline)
	( cond (( null? NodeQueue)
		(display "NULL LIST WHEN TRYING TO PARSE STATEMENTS NODE"))
		(else
			(display "NOT NULL")
			(newline)
			;(display (car NodeQueue))
			(newline)
			(parseQueue NodeQueue)	
	  ))
)
(define (parseQueue childQueue)
	;(display childQueue)
	; Right now, the childQueue is composed of everything except the Statment
	; Node that infomred up that there is a queue of Nodes here. Now
	; It just needs to be broken down to see what the next Node is (where
	; is it going / what is the next Node all 'bout

	;Getting the next list item
	(cdr(car childQueue))
)
(define tree '("S" (
     ("-" ("A" 3333) ("A" 4444))
     ("W" (
          ("+" ("R" 0) ("R" 1))
          ("+" ("R" 1) ("R" 2))
          ("+" ("R" 2) ("R" 3))
          ("+" ("R" 3) ("R" 4))
          ("+" ("R" 4) ("R" 5)))
      (("-" ("R" 0) ("R" 1))
      ("-" ("R" 1) ("R" 2))
      ("-" ("R" 2) ("R" 3))
      ("-" ("R" 3) ("R" 4))
      ("-" ("A" 1000) ("A" 2000)))
      )
   ("*" ("R" 2) ("R" 3)) 
)))

(define t '("S" (("-" ("A" 3333) ("A" 4444))("W" (("+" ("R" 0) ("R" 1))("+" ("R" 1) ("R" 2))("+" ("R" 2) ("R" 3))("+" ("R" 3) ("R" 4))("+" ("R" 4) ("R" 5)))(("-" ("R" 0) ("R" 1))("-" ("R" 1) ("R" 2))("-" ("R" 2) ("R" 3))("-" ("R" 3) ("R" 4))("-" ("A" 1000) ("A" 2000))))("*" ("R" 2) ("R" 3)))))
