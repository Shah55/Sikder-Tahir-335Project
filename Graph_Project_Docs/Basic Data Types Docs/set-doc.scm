; Pre: The set must be provided.
; Post: Returns #t if the element is a member of the set, #f otherwise.
; (set-member? '(a b c) 'd)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre: The set must be provided.
; The element must not already exist in the set.

; Post: Returns an updated set with the element added.
; (set-adjoin '(1 2 4) 4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre: The list must be provided.
; Post: Returns a set containing unique elements from the given list.
; (make-set '(a b b c))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre: The set must be provided.
; Post: Returns an updated set with the element removed.
; (set-remove '(a b c d e) 'c)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre: Two sets must be provided.
; Post: Returns a new set that is the union of the two input sets, containing all unique elements from both sets.
; (set-union (make-set '(a b b c)) (make-set '(a e c)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre: Two sets must be provided.
; Post: Returns a new set that is the intersection of the two input sets, containing elements that exist in both sets.
; (set-intersection (make-set '(a b b c)) (make-set '(a e c)))