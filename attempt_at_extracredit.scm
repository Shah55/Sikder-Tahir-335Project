(define (two-sum nums target)
  (define (helper index seen)
    (if (null? nums)
        '() 
        (let ((complement (- target (car nums))))
          (if (assoc complement seen)
              (list (cdr (assoc complement seen)) index)
              (helper (+ index 1) (cons (cons (car nums) index) seen))))))

  (helper 0 '()))

(display (two-sum '(2 7 11 15) 9))


;; So this the code that ChatGPT outputted when I asked it to solve a popular leetcode easy problem, Two Sum.
;; In this problem, in syntax outside of scheme, an array of numbers is given as well as a target. The objective is to 
;; find a pair in the array that has a sum of the target and return their indices. In the function call above, 
;; from the four elements in the list, only two of them, 2 and 7 add up to 9 when summed. 

;; I have found this problem, although it being simple in other languages to solve, that chatGPT can't provide a proper
;; solution. To ensure this, I also prompted chatGPT that its solution is wrong and asked it to give me another
;; implementation, however, its various codes still don't produce an effective answer, rather it outputs nothing.

;; What I oberved from the code is that the logic is in place, where there is an effort to find a complement, which is
;; the difference between the target and the car of the seen. However, it seems that regardless of logic, at this point in
;; time, chatGPT has trouble following through with the logic and giving effective code, which represents a huge flaw
;; in the technology. This issue is most likely prevalent with other problems as well.

;; 335 students can probably solve this problem using our knowledge of purely functional design or atleast provide a working
;; one at that, whilst chatGPT just proves itself being able to give only good 'ideas' instead of code along with it.