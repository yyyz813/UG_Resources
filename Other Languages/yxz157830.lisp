(defun divisible-by-7 (x)
  (if (= 0 (mod x 7))
    t
    (not t))
)


(defun function-3 (x)
   (car (mapcar x '(3)))
)


(defun zipper (lt1 lt2) 
   (if (or (null lt1) (null lt2)) '()
   (cons (list (car lt1) (car lt2))
   (zipper (cdr lt1) (cdr lt2))
   ))
)


(defun my-map (fun list)
   (if (null list) '()
   (cons (funcall fun (car list))
   (my-map fun (cdr list))
   )
))


 
(defun segregate (fun list)
   (if (null list) '()
   (cons lt1)
   (cons lt2)
   (if (= 0 (mod (car list) 2))) 
   (append lt1 list)
   (append lt2 list)  ; if not append to list 2
   (segregate fun (cdr list))
   )
)

