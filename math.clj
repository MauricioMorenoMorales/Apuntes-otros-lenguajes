(defn calculate-arc
  "Retorna el diametro de un arco"
  [diameter angle]
  (* (* (Math/-PI) diameter) (/ angle 360)))

(defn calculate-circle-area
  [radius]
  (* Math/PI (* radius radius)))

(defn gauss-trick
  [goal]
  (* (/ goal 2) (+ goal 1)))

(defn digital-root [number]
    (if (> 10 number) number
        (->> number
             str
             seq
             (map #(Character/getNumericValue %))
             (reduce +)
             digital-root)))

(defn average [values]
  (/ (->> values (reduce +))
     (count values)))

(- (* 7 6)
   (+ 1 6 4 5 1 1))
