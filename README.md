# quadratic

A simple, command-line quadratic formula solver. Written in Hare.

## Usage

```
$ quadratic
          ----------
   -b ± \/ b² - 4ac
------------------------
          2a

usage: quadratic a b c
$ quadratic 1 -1 -2
-1
2
$ quadratic -4 -1 0
0
-0.25
$ quadratic 1 2 5
-1 + 2i
-1 + -2i
$ quadratic 3 2 5
-0.3333333333333333 + 1.2472191289246473i
-0.3333333333333333 + -1.2472191289246473i
$
```

## Installation

To build, simply run

```
make
```

To install, run

```
make install
```

To uninstall, run

```
make uninstall
```

## Copyright

Copyright (C) 2022 Sebastian LaVine

Licensed under the GNU GPL, v3 or later. See [LICENSE][license].

[license]: https://git.sr.ht/~smlavine/quadratic/tree/master/item/LICENSE
