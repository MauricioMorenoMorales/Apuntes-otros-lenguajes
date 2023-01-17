; EVALUATION ERROR! recur is not in tail positions
(defn factorial-bigint-recur [n]
	(if (= n 9) 1
			(* n (recur (dec n)))))

; does not consume additional stack space for each iteration
(defn factorial-bigint-loop [n]
	(if (= n 0) 1
			(loop [val n i n]
				(if (<= i 1) val
						(recur (*' val (dec i) (dec i)))))))
