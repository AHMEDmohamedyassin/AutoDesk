(DEFUN C:ADDLEN ()
	  (setq SS (SSGET))
	  (setq SL (SSLENGTH SS))
	  (setq N 0)(setq SUM 0)
	(while  (< N SL)
         (setq E1 (entget (SSNAME SS N)))
	 (setq ID (cdr (assoc 0 E1)))
	(IF (= ID "LINE")(progn
	  (setq C (cdr (assoc 10 E1)))
	  (setq D (cdr (assoc 11 E1)))
	  (setq DIS (DISTANCE D C))))
	(IF (= ID "ARC")(progn	
	  (setq rad (cdr (assoc 40 E1)))
	  (setq sng (cdr (assoc 50 E1)))
	  (setq eng (cdr (assoc 51 E1)))
	(if(< eng sng) (setq eng (+ eng (* 2 pi))))
	  (setq DIS (* rad (abs (- eng sng))))))
	  (setq L DIS)
	  (setq L (RTOS L))
	  (setq SUM (+ SUM DIS))
	  (setq N (+ 1 N)))
	  (setq L (RTOS SUM))
	  (setq Lr (STRCAT "\nTotal Length = " L))
	(ALERT Lr)
)