def count_sheep(number):
    response = ""
    for i in range(number):
        response += f'{i + 1} sheeps...'
    return response



print(count_sheep(3))