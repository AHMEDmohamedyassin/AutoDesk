(defun c:ar ()
(setq AnItem (getvar "OSMODE"))
(AList "OLDSNAP" AnItem)
(setq AnItem (getvar "HIGHLIGHT"))
(AList "OLDHIGH" AnItem)
(setq AnItem (getvar "CMDECHO"))
(AList "OLDECHO" AnItem)
(setq file  (findfile "areas.xls"))
(setq fp (open file "a"))
(setq eset (ssget))
(setq cntor (getreal "\nInitial number"))
(setq cntr 0)
(setq tap (getpoint "Insertion point"))
(setq pt1 (mapcar '+ tap (list 0.5 -0.45)))
(setq pt2 (mapcar '+ pt1 (list 1 0)))
(setq pt4 (mapcar '+ pt2 (list 1 0)))
(setq pt5 (mapcar '+ pt4 (list 1 0)))
(setq h (getreal "\nHeight"))




(while (< cntr (sslength eset))
(setq en (ssname eset cntr))
	(setq enlist (entget en ))
	(setq myVertexList (list)) 

	(foreach a enlist                                          
  	(if(= 10 (car a))                                          
   	(setq myVertexList                                
      	(append myVertexList                       
        (list                                                       
          (cdr a)                                            
         )                                                                 
      	 )                                                                     
   	 )                                                                      
 	 )                                                                                
	 )  
(setq listana (vl-sort myVertexList '(lambda (j k)  (< (car j) (car k))  )))

(setq p1 (car listana))
(setq AnItem (getvar "OSMODE"))
(AList "OLDSNAP" AnItem)
(setq AnItem (getvar "HIGHLIGHT"))
(AList "OLDHIGH" AnItem)
(setq AnItem (getvar "CMDECHO"))
(AList "OLDECHO" AnItem)
(setvar "Osmode" 0)
(setvar "Highlight" 0)
(setvar "Cmdecho" 0)

(setq ptx1 (mapcar '+ p1 (list 0.20 -0.50)))
(setq ptx2 (mapcar '+ p1 (list 0.20 -0.20)))
(command "area" "Object" en)
(setq are (getvar "area"))
(setq ar (strcat (rtos are 2 3) " m2"))


(setq vol (strcat (rtos (* are h) 2 3) " m3" ))
(command "layer" "m" "ali_texta" ""  )
(command "text" "j" "mc" pt1 "0.2" "0" (strcat "A" (rtos (+ 1 cntor) 2 0)) "")
(command "text" "j" "mc" pt2 "0.2" "0" ar "")
(command "text" "j" "mc" pt4 "0.2" "0" (rtos h 2 2) "")
(command "text" "j" "mc" pt5 "0.2" "0" vol "")

(princ (strcat "A" (rtos (+ 1 cntor) 2 0) "          ")  fp)  (princ (strcat "    " ar "       ") fp) (write-line (strcat "       " (rtos h 2 2) "    ") fp)


(command "text"  ptx2 "0.25" "0" (strcat "A" (rtos (+ 1 cntor) 2 0))"")
(command "text"  ptx1 "0.25" "0" (strcat "Area=" ar) "")

(setq cntr (+ 1 cntr))
(setq cntor (+ 1 cntor))
(setq pt1 (mapcar '+ pt1 (list 0 -0.30)))
(setq pt2 (mapcar '+ pt2 (list 0 -0.30)))
(setq pt4 (mapcar '+ pt4 (list 0 -0.30)))
(setq pt5 (mapcar '+ pt5 (list 0 -0.30)))
)
(setvar "OSMODE" (RList "OLDSNAP"))
	;retrieve and reset snap
 
	(setvar "HIGHLIGHT" (RList "OLDHIGH"))
	;retrieve and reset highlight
 
	(setvar "CMDECHO" (RList "OLDECHO"))
	;retrieve and reset command echo
 
  (princ)
(close fp)
         
) 


(defun AList (Name Val)
 
	(setq item (list (cons Name Val)))
	;construct list
 
	(setq MainList (append item Mainlist))
	;add it to the main list
 
);defun
 
;This function retrieves the values from the main list
(defun RList (TheName)
 
  	(cdr (assoc TheName MainList))
  	;retrieve value from list
 
);defun
(princ)


(defun dtr (x)
	;define degrees to radians function
 
	(* pi (/ x 180.0))
	;divide the angle by 180 then
	;multiply the result by the constant PI
 
)	;end of function


(Alert "íÓÊÎÏã åÐÇ ÇááíÓÈ áÍÕÑ ÇáÍÌæã æ ÇáãÓÇÍÇÊ ãä ÇáãÎØØ ")
(Alert "ÇÓÊÎÏã ÇáÃãÑ ar ")
(Alert "ÓíÊã äÓÎ ÇáÈíÇäÇÊ Åáì ãáÝ ÅßÓíá ÇÓãå areas.xls ")















