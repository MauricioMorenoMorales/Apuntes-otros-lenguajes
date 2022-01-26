# Lasagna de guido
# cada funcion puede tener su propio docstring y accedes a el por medio de el atributo .__doc__

EXPECTED_BAKE_TIME = 40
PREPARATION_TIME = 2
def bake_time_remaining(time):
    """Calculate the bake time remaining.
 
    :param elapsed_bake_time: int baking time already elapsed.
    :return: int remaining bake time derived from 'EXPECTED_BAKE_TIME'.
 
    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """
    return EXPECTED_BAKE_TIME - time
def preparation_time_in_minutes(number):
    """Return the total preparation time of every layer
    :param number: int
    :return: int remaining preparation time derived from preparation_time_in_minutes
    """
    return number * PREPARATION_TIME
def elapsed_time_in_minutes(layers, ovenTime):
    """ Return the total preparation time after receiving the layers quantity and the spended time into the oven
    :param layers: int
    :param ovenTime: int
    :return int the time used to complete the cake
    """
    return (layers * PREPARATION_TIME) + ovenTime