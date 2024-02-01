#!/usr/bin/env bash


langs=("assembly" "awk" "bash" "basic" "bf" "chapel" "clojure" "coffee" "cpp" "c" "csharp" "d"
    "dart" "delphi" "elisp" "elixir" "elm" "erlang" "factor" "forth" "fortran" "fsharp" "git" "go"
    "groovy" "haskell" "java" "js" "julia" "kotlin" "latex" "lisp" "lua" "mathematica" "matlab"
    "mongo" "nim" "objective" "ocaml" "octave" "perl" "perl6" "php" "psql" "python" "python3"
    "r" "racket" "ruby" "rust" "solidity" "scala" "scheme" "psql" "sql" "swift" "tcl" "tcsh" "vb"
    "vbnet" "vim" "arduino" "pike" "eiffel" "clean" "dylan" "cmake" "django" "flask")

selected=$(printf '%s\n' "${langs[@]}" | fzf)
if [ -z $selected ]; then
    exit 0
fi

echo "Language: $selected"
read -p "Enter Query: " query

# To differentiate between blank, non-blank, empty, unset
# https://unix.stackexchange.com/a/147362
case ${query+x$query} in
  (x*[![:blank:]]*)
    query="/$(echo $query | tr ' ' '+')";;
    # curl -s cht.sh/$selected/$query && while [ : ]; do sleep 1; done || echo "failed to search on cht.sh";;
    # echo \"curl cht.sh/$selected/$query\"
    # curl -s cht.sh/$selected/$query
    # while [ : ]; do sleep 1; done;;
  (*);;
    # keep the variable empty
    # curl -s cht.sh/$selected;;
esac

echo "curl cht.sh/$selected$query:"
echo ""
curl -s cht.sh/$selected$query | less
