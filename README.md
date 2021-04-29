# cannibals_and_missionaries

Implemented in prolog with the Blind Search Algorithm.

#### How to run
```html
:~$ swipl -f cannibals_and_missionaries.pl
```
#### Our target is "run", so hit run inside the swipl console

```html
?- run.
```

#### Output
```html
?- run.

state(3,3,left,0,0) -> state(1,3,right,2,0)
state(1,3,right,2,0) -> state(2,3,left,1,0)
state(2,3,left,1,0) -> state(0,3,right,3,0)
state(0,3,right,3,0) -> state(1,3,left,2,0)
state(1,3,left,2,0) -> state(1,1,right,2,2)
state(1,1,right,2,2) -> state(2,2,left,1,1)
state(2,2,left,1,1) -> state(2,0,right,1,3)
state(2,0,right,1,3) -> state(3,0,left,0,3)
state(3,0,left,0,3) -> state(1,0,right,2,3)
state(1,0,right,2,3) -> state(1,1,left,2,2)
state(1,1,left,2,2) -> state(0,0,right,3,3)
true .
```


If you are not familiar with the Missionaries and Cannibals Prolem you can check this -> https://en.wikipedia.org/wiki/Missionaries_and_cannibals_problem
