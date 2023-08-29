

type Stack struct {
	data []int
}

func (s *Stack) Add(n int) {
	s.data = append(s.data, n)
}

func (s *Stack) Pop() int {
	if len(s.data) <= 0 { return -666 }
	response := s.data[len(s.data)-1]
	s.data = s.data[:len(s.data)-1]
	return response
}

//! Reverse polish notation
func evalRPN(tokens []string) int {
	stack := &Stack{}
	for _, value := range tokens {
		switch value {
		case "+":
			value1 := stack.Pop()
			value2 := stack.Pop()
			stack.Add(value1 + value2)
		case "-":
			value1 := stack.Pop()
			value2 := stack.Pop()
			stack.Add(value2 - value1)
		case "*":
			value1 := stack.Pop()
			value2 := stack.Pop()
			stack.Add(value1 * value2)
		case "/":
			value1 := stack.Pop()
			value2 := stack.Pop()
			stack.Add(value2 / value1)
		default:
			intValue, _ := strconv.Atoi(value)
			stack.Add(intValue)
		}
	}
	return stack.Pop()
}