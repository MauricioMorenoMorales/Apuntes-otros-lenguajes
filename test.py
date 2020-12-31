def if_ternario(numero):
	guerras = ['Primera guerra mundial', 'Segunda guerra mundial','GUerra de corea','Guerra fria','Guerra de vietnam']
	return guerras[0] if 1910 < numero < 1917 else guerras[1] if 1939 < numero < 1945 else guerras[3] if 1952 < numero < 1955 else guerras[4]

print(if_ternario(1942))
print(if_ternario(1914))
print(if_ternario(2000))