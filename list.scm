(define (Visit base)
	(cond(( equal? "S" (getType (car base))) 
		     (parseStatementsNode base))
		  (( equal? "W" (getType (car base)))
			 (parseWhileNode base))
		  (else
			 (display "O: ")
			 (parseOperands base)))  
	base
)

(define (getType Node)
	; Assumes that it is passed a non-null value
	; that contians a single list.
	(cond(( equal? "S" Node)
		     (display "Statement Node")
			 (newline))
		  (( equal? "W" Node)
			 (display "While Node")
			 (newline))
		  ( else
		     (display "Unrecognized option. What did y'all do..."))) 			 
	Node
)

(define (parseStatementsNode NodeQueue)
	(newline)
	(cond(( null? NodeQueue)
		    (display "NULL LIST WHEN TRYING TO PARSE STATEMENTS NODE"))
		 (else
			(display "NOT NULL")
			(newline)
			;(display (car NodeQueue))
			(newline)
			(parseQueue (cdr NodeQueue))	
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
	(cond (( not(pair? (car childQueue)))
		     (display "Nothing to see here, errything's all parsed"))
		   (( pair? (cdr childQueue))
		     (Visit (cdr childQueue)))
		   ;( not(pair? (car childQueue))
			;  (Visit (cdr childQueue)))
	(else
		;(Visit (car childQueue))
		
		;(cond (( equal? "S" getType (car(car childQueue)))
		;	   (parseStatementsNode (car(cdr childQueue))))
		;	   ( equal? "W" getType (car(car childQueue)))
		;	   (parseWhileNode (car(cdr chilid	 
		
		(display "***")
		(display childQueue)
		(display "***")
		(newline)
		(Visit childQueue)
		(parseQueue (car childQueue))))

;> (car(car(cdr(car(cdr t )))))
;"W"
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
(define (parseWhileNode Node)
	( display "WN stuff")
	(newline)
	(display Node)
	(newline)
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
