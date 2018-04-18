(define (Visit tree)
	(getType(car tree)(cdr tree))
	
)
(define (getType NodeSymbol Nodes)
	(cond (( equal? "S" NodeSymbol)
		      (display "STATMENTS NODE")
		      (parseStatementsNode Nodes))	
		   ((equal?  "W" NodeSymbol)
		      (display "While     Node"))
		   (else
				(parseOperands Nodes)
		   )
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
	;( getType (car(childQueue)) (car childQueue))
	(cond ((null? childQueue)
		 (display "Nothing to see here, errything's all parsed"))
	(else
		(display "A valid queue") 
		(newline)
		;(parseQueue(cdr childQueue)))
		(getType (car(car(car childQueue))) (car(car childQueue)) )	
		(car(car ChildQueue))))
)
(define (parseOperands Nodes)
	;TOADD, needs to accept all types of registers
	(cond(( equal? "-" (car Nodes))
			(display "#:") 
		    (display "sub R")
		    (display (car(cdr(car(cdr Nodes))))) ;first parameter
			(display " ")
			(display(car Nodes))
			(display " R")
			(display (car(cdr(car(cdr(cdr Nodes))))))
	))
	
	;(display "")
	(newline)
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
