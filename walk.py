import random
import requests


def make_random_word():
    """Python having some fun making a string in the least efficient way it."""
    characters = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
    l = random.randint(1, 20)
    word = ''
    for _ in range(l):
        word += characters[random.randint(0, len(characters) - 1)]
    return word


def download_some_stuff():
    suffix = "/" + make_random_word() + "_" + make_random_word()
    prefix = "http://example.com"
    requests.get(prefix + suffix)


def add_some_numbers(x_list, y_list):
    assert len(x_list) == len(y_list)
    result = []
    for x in x_list:
        for y in y_list:
            result.append(x + y)
    return result


def take_a_walk_in_the_park(y_max=100):
    """Don't know exactly what I'm doing but surely it isn't nice code."""

    x_list = []
    y_list = []

    for i in range(1, 100, 10):
        for j in range(i, y_max):
            x_list.append(i)
            y_list.append(i + j)

    z_list = add_some_numbers(x_list, y_list)
    sum = 0
    for z in z_list:
        sum += z

    download_some_stuff()

    return sum


def keep_python_busy(how_much=100):
    """Take python for a walk (or a creep) and keep it busy but do nothing useful"""

    take_a_walk_in_the_park(how_much)
    for _ in range(2):
        download_some_stuff()


if __name__ == '__main__':
    keep_python_busy()
