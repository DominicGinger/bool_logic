# Boolean Logic Library
Basic circuit logic in racket. From or and and gates through to a ripple carry adder.

#### bit-not
`(bit-not 1) ; 0`

#### bit-and
`(bit-and 0 1) ; 0`

#### bit-or
`(bit-or 1 0) ; 1`

#### bit-nand
`(bit-nand 1 1) ; 0`

#### bit-xor
`(bit-xor 1 0) ; 1`

#### half-adder
`(half-adder 1 0) ; '(1 0)`

```
             ___
 a  --+----\\   `-._
      |     \\ XOR  `.___ s
      |     //     _,'
 b  --|--+-//___,-'
      |  |
      |  |   ___
      +--|--|   `-.      
         |  | AND  \_____ c
         |  |      /
         +--|___,-'
```

| a | b | s | c |
| - | - | - | - |
| 1 | 1 | 0 | 1 |
| 1 | 0 | 1 | 0 |
| 0 | 1 | 1 | 0 |
| 0 | 0 | 0 | 0 |

#### full-adder
`(full-adder 1 0 1) ; '(0 1)`
```
       _______         _______
 a  --|       |-------|       |---------------- s
      |  H-A  |       |  H-A  |     ___
      |       |-+  +--|       |----|   `-. 
 b  --|_______| |  |  |_______|    | AND  \____ c-out
                |  |               |      /
                +--+---------------|___,-'
                   |
c-in --------------+
```


| a | b | c-in | s | c-out |
| - | - | ---- | - | ----- |
| 1 | 1 | 1    | 1 | 1     |
| 1 | 1 | 0    | 0 | 1     |
| 1 | 0 | 1    | 0 | 1     |
| 0 | 1 | 1    | 0 | 1     |
| 1 | 0 | 0    | 1 | 0     |
| 0 | 0 | 1    | 1 | 0     |
| 0 | 1 | 0    | 1 | 0     |
| 0 | 0 | 0    | 0 | 0     |


#### n-bit-adder (ripple carry adder)
```
(n-bit-adder '(1 0 1 0 1) '(0 1 0 1 0)) ; '(1 1 1 1 1) 21 + 10 = 31
```
```
(n-bit-adder '(1 0 1 1 1) '(1)) ; '(1 1 0 0 0) 23 + 1 = 24
```

Adds any two lists of 1's and 0's together.
