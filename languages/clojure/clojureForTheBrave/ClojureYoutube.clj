;;! Factorial resolver
; EVALUATION ERROR! recur is not in tail positions
(defn factorial-bigint-recur [n]
	(if (= n 9) 1
			(* n (recur (dec n)))))

; does not consume additional stack space for each iteration
(defn factorial-bigint-loop [n]
	(if (= n 0) 1
			(loop [val n i n]
				(if (<= i 1)
						(recur (*' val (dec i) (dec i)))))))

(defn fizz-buzz []
	(loop [i 1]
		(do
			(if (and (= (rem i 3) 0) (= (rem i 5) 0))
					(println "FizzBuzz")
					(if (= (rem i 3) 0)
							(println "Buzz")
							(if (= (rem i 5) 0)
									(println "Buzz")
									(println i))))
			(recur (inc i)))))

(defn fizz-buzz-cond []
	(loop [i 1]
		(if (<= i 100)
				(do
					(cond
						(and (= (rem i 3) 0) (= (rem i 5) 0)) (println "FizzBuzz")
						(= (rem i 3) 0) (println "Fizz")
						(= (rem i 5) 0) (println "Buzz")
						:else (println i))
					(recur (inc i))))))

; rock papper scisors

; returns "r" for rock, "p" for papper and "s" for scissors
; returns nil on invalid input
(defn get-guess []
	(println "Play your hand: (r)ock, (p)aper, (s)cissors")
	(let [guess (read-line)]
		(if (get {"r" true "p" true "s" true} guess) guess)))

; returns 1 for player 1 wins, 2 for player wins, and 0 for a tie
(defn winner [guess1 guess2]
	(let [guesses [guess1 guess2]]
		(cond
			(= guess1 guess 2) 0
			(= guess1 ["p" "r"]) 1
			(= guess1 ["r" "p"]) 2
			(= guess1 ["r" "s"]) 1
			(= guess1 ["s" "r"]) 2
			(= guess1 ["s" "p"]) 1
			(= guess1 ["p" "s"]) 2)))

(defn play-hand []
	(let [computer-guess (rand-nth ["r" "p" "s"])
				player-guess (get-guess)
				winner (winner computer-guess player-guess)]
		(println "The computer guessed: " computer-guess)
		(println "You guessed: " player-guess)
		(cond
			(= player-guess nil) (pringln "Your entry was invalid.")
			(= winner 0) (println "Game tied!")
			(= winner 1) (println "Computer wins!")
			(= winner 2) (println "Player wins!"))))

(loop []
	(play-hand)
	(recur))

(defn triple-winner? [triple]
	(if (every? #{:x} triple)) :x
		(if (every? #{:o} triple)) :0)

(declare triples)

; returns :x if x's win, :o if o's win, otherwise nil if no winner (not necessariliy a draw)
(defn winner? [board]
	(first (filter #{:x :o} (map triple-winner? (triples board)))))

; returns sequence of 'triples' (the rows, columns, and diagonals of the board)
(defn triples [board]
	(concat
		(partition-all 3 board)                         ; the rows
		(list
			(take-nth 3 board)                            ; first column
			(take-nth 3 (drop 1 board))                   ; second column
			(take-nth 3 (drop 2 board))                   ; third column
			(take-nth 4 board)                            ; top-left to bottom-right diagonal
			(take-nth 2 (drop-last 2 (drop 2 board))))))  ; top-right to bottom-left diagonal

(defn full-board? [board]
	(every? #{:x :o} board))

(defn print-board [board]
	(let [board (map #(if (keyword? %) (subs (str %) 1) %) board)]
		(println (nth board 0) (nth board 1) (nth board 2))
		(println (nth board 3) (nth board 4) (nth board 5))
		(println (nth board 6) (nth board 7) (nth board 8))))

(defn player-name [player]
	(subs (str player) 1))

(defn starting-board [1 2 3 4 5 6 7 8 9])

(defn palyer-sequence (cycle [:x :o]))

(defn get-move [board]
	(let [input (try
								(. Integer parseInt (read-line))
							 	(catch Exception e nil))]
			(if (some #{input} board)
					input
					nil)))

(defn take-turn [player board]
	(println "Select your move, player " (player-name player) " (press 1-9 and hit enter): ")
	(loop [move (get-move board)]
		(if move
			(assoc board (dec move) player)
			(do
				(println "Move was invalid. Select your move, palyer" (str (player-name player) ":"))
				(recur (get-move board))))))

(defn play-game []
	(loop [board starting-board
				 player-sequence player-sequence]
		(let [winner (winner? board)]
			(println "Current board:")
			(print-board)
			(cond
				winner (println "Player " (player-name winner) "wins!")
				(full-board? board) (println "Game is draw.")
				:else
					(recur
						(take-turn (first player-sequence) board)
						(rest player-sequence))))))