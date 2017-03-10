#!/bin/bash

main() {
  echo `three_random_words`
}

three_random_words() {
  for i in {1..3}; do
    random_word
  done
}

random_word() {
  index=`expr $RANDOM \% $(count) + 1`
  words | head -$index | tail -1
}

count() {
  words | wc -l
}

words() {
  paths | extract_words_from_paths | remove_non_alpha_chars | downcase | remove_long_words | unique
}

paths() {
  find /usr/share/man -type f
}

extract_words_from_paths() {
  sed 's/^.*\///' | sed 's/\..*$//'
}

remove_non_alpha_chars() {
  grep -v '[^[:alpha:]]'
}

downcase() {
  tr 'A-Z' 'a-z'
}

remove_long_words() {
  egrep '^.{1,4}$'
}

unique() {
  sort -u
}

main
