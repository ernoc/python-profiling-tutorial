import math
import random
import requests


def random_download():
    random_word = ''.join(random.sample('abcdefghijklmnopqrstuvwxyz', k=10))
    requests.get('http://www.example.com/' + random_word)


def primes_in_range(n):
    """Use Sieve of Eratosthenes find all primes in range 1..n"""
    is_prime = [True] * n  # is_prime[i] tells if i + 1 is a prime number
    is_prime[0] = False

    for prime_candidate in range(2, int(math.sqrt(n)) + 1):
        if is_prime[prime_candidate - 1]:
            # mark every multiple of prime_candidate as non-prime
            for k in range(2, (n // prime_candidate) + 1):
                non_prime = prime_candidate * k
                assert non_prime <= n
                is_prime[non_prime - 1] = False

    primes = []
    for i, i_is_prime in enumerate(is_prime):
        if i_is_prime:
            primes.append(i + 1)

    return primes


def keep_python_busy(compute_repeat=6, io_repeat=3):
    for _ in range(compute_repeat):
        n = random.randint(1000000, 1200000)
        primes_in_range(n)

    for _ in range(io_repeat):
        random_download()


if __name__ == '__main__':
    keep_python_busy()
