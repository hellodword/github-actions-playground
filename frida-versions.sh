#! /bin/bash

versions=( $(curl -fsSL 'https://pypi.python.org/pypi/frida-tools/json' | \
    jq -r '.releases | keys[]') )

for i in ${!versions[@]}; do
    version="${versions[$i]}"
    frida_version="$(johnnydep frida-tools=="$version" 2>/dev/null | grep -oP 'frida[<=][^\ntols ]+')"
    echo "frida-tools==$version $frida_version"
done
