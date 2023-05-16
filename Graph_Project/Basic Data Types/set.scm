; Set Data Type:

;; Add an element to a set
(define (set-adjoin set element)
  (if (set-member? set element)
      set
      (cons element set)))

;; remove-duplicates implementation. Used ChatGPT for reference and assistance
(define (remove-duplicates lst)
  (define (helper lst seen)
    (cond ((null? lst) '())
          ((set-member? seen (car lst))
           (helper (cdr lst) seen))
          (else
           (cons (car lst)
                 (helper (cdr lst) (set-adjoin seen (car lst)))))))
  (helper lst '()))

;; Check if an element is in a set
(define (set-member? set element)
  (cond ((null? set) #f)
        ((eq? (car set) element) #t)
        (else (set-member? (cdr set) element))))

;; Define a set as a list of unique elements
(define (make-set lst)
  (let ((unique-lst (remove-duplicates lst)))
    (if (null? unique-lst)
        '()
        (cons (car unique-lst) (make-set (cdr unique-lst))))))

;; Returns a new set that is the intersection of two sets.
(define (set-intersection set1 set2)
  (cond
    ((null? set1) '())              
    ((set-member? set2 (car set1)) 
     (cons (car set1) (set-intersection (cdr set1) set2)))
    (else (set-intersection (cdr set1) set2)))) 


;; AIZA'S CHANGES

;; Returns empty list to represent empty set
(define (make-empty-set)
  '())

;; Remove specific element from set
(define (set-remove set element)
  (cond ((null? set) '())
        ((eq? (car set) element) (cdr set))
        (else (cons (car set) (set-remove (cdr set) element)))))

;; Returns a new set that is the union of two sets.

(define (set-union set1 set2)
  (remove-duplicates (append set1 set2)))


;; We need a second representation of sets