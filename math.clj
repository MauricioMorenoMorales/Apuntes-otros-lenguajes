(defn calculate-arc
  "Retorna el diametro de un arco"
  [diameter angle]
  (* (* (Math/-PI) diameter) (/ angle 360)))

(defn calculate-circle-area
  [radius]
  (* Math/PI (* radius radius)))
