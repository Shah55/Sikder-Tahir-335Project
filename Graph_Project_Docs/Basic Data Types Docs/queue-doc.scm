; Pre: The queue must be provided.
; Post: The element is added to the back of the queue.
; (enqueue 'd q3)

;;;;;;;;;;;;;;;;;;;;;;

; Pre: The queue must be provided.
; The queue must not be empty.

; Post: The element at the front of the queue is removed and returned.
; (dequeue q3)

;;;;;;;;;;;;;;;;;;;;;;

; Pre: The queue must be provided.
; The queue q3 must not be empty.

; Post: Returns the element at the front of the queue without modifying the queue.
; (first q3)

;;;;;;;;;;;;;;;;;;;;;;

; Pre: The queue must be provided.
; Post: Returns #t if the queue is empty, #f otherwise.
; (empty? q3)

;;;;;;;;;;;;;;;;;;;;;;

; Pre: The queue must be provided.
; Post: Returns the number of elements currently in the queue.
; (size q3)
