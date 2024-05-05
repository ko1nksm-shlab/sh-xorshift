xorshift32() {
  set -- "$1" $(( $2 ^ (($2 << 13) & 4294967295) ))
  set -- "$1" $(( $2 ^ (($2 >> 17) & 32767) ))
  set -- "$1" $(( $2 ^ (($2 << 5) & 4294967295) ))

  # Workaround for shells (mksh) that only support signed 32bit integer
  #   In any case, if it can only handle signed 32-bit integers,
  #   it may be better to delete this code and use as a negative value.
  if [ "$2" -lt 0 ]; then
    set -- "$1" $((429496729 + $2 / 10)) $((6 + $2 % 10))
    [ "$3" -lt 0 ] && set -- "$1" $(($2 - 1)) $(($3 + 10))
    set -- "$1" "${2#0}$3"
  fi

  eval "$1=\$2"
}
