#!/usr/bin/env python

import sys
import os
import gzip
import random

if __name__ == "__main__":
    if len(sys.argv) > 1:
        word_length = int(sys.argv[1])
    else:
        word_length = 3

    dictfile = os.path.expanduser('~/.dictionary.txt.gz')
    with gzip.open(dictfile) as f:
        lines = f.readlines()
        rand_engine = random.SystemRandom()
        result = ''
        words = []
        for _ in range(0, word_length):
            word = rand_engine.choice(lines).strip().decode()
            while len(word) > 10:
                word = rand_engine.choice(lines).strip().decode()
            result += word
            words.append(word)
        print(result)
        print("From words: {}".format(', '.join(words)))
