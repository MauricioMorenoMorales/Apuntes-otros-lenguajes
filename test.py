def to_binary(n):
	if n > 1:
		return to_binary(n // 2)
