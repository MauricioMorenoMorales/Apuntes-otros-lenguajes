

type Stack struct {
	data []int
}

func (s *Stack) Add(n int) {
	s.data = append(s.data, n)
}

func (s *Stack) Pop() int {
	if len(s.data) <= 0 { return -1 }
	response := s.data[len(s.data)-1]
	s.data = s.data[:len(s.data)-1]
	return response
}

func

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

type Stack struct {
	data []int
}

func (stack *Stack) Add(value int) {
	stack.data = append(stack.data, value)
}

func (stack *Stack) Peek() (response int, success bool) {
	if len(stack.data) == 0 {
		return 0, false
	}
	return stack.data[len(stack.data)-1)], true
}
