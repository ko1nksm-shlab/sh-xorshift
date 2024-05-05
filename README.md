# sh-xorshift

xorshift random number generators implementation for POSIX shells.

## Usage

```sh
rnd=2463534242
for i in $(seq 10000); do
  xorshift32 rnd "$rnd"
  echo "$rnd"
done
```
