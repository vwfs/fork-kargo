#!/bin/sh -eo pipefail
#Generate MD formatted tags from roles and cluster yaml files
printf "|%25s |%9s|\n" "Tag name" "Used for"
echo "|--------------------------|---------"
grep -r tags: . | perl -ne '/tags:\s\[?(([\w\-_]+,?\s?)+)/ && printf "%s ", "$1"'|\
  perl -ne 'print join "\n", split /\s|,/' | sort -u| xargs -n1 printf "|%25s |%9s\n"
