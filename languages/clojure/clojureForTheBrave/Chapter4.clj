(defn titelize
	[topic]
	(str topic " for the brave and True")])

;; List
(map titelize ["Hasters" "Ragnarok"])

;; Vectors
(map titelize '("Empathy" "Decorating"))

;; Sets
(map titelize #{"Elbows" "Soap Carving"})

(map #(titelize (second %)) {:uncomfortable-thing "Winking"})

