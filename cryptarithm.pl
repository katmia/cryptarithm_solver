/* cryptarithms in Prolog 
 * 
 * Author: Katherine Martins (kem5en)
 * 
 * */

% https://www.swi-prolog.org/man/clpfd.html
:- use_module(library(clpfd)).
:- discontiguous makeNum/4.

/* used to find the index of an element in a list */
index([Item | _], Item, 0).
index([_ | Xt], Item, Index):-
    index(Xt, Item, Index1),
    Index is Index1 + 1.

/* turns a list of separate numbers into a base 10 number
* (i.e. makeNum([0, 1, 2, 3], 3, X) returns X = 123)
* 0 is used as a dummy head to the list
*/
makeNum([X], 0, X).
makeNum([0, Xh | Xt], L, D):-
    L #> 0,
    Ln is L - 1,
    Xc is 0 + (Xh * 10 ^Ln),
    makeNum([Xc | Xt], Ln, D).
makeNum([Xh, Xm | Xt], L, D):-
    L #> 0,
    Ln is L - 1,
    Xc is Xh +( Xm * 10 ^ Ln), 
    makeNum([Xc | Xt], Ln, D).

/* solves cryptarithm puzzles
 * enter in a list
 * (i.e. SEND + MORE = MONEY is 
 * solve([S, E, N, D], [M, O, R, E], [M, O, N, E, Y]).)
 */
solve([], [], []).
solve(X, Y, Z):-
    append(X, Y, B), append(Z, B, A),
    sort(A, S),
    S ins 0..9,
    all_different(S),
    label(S),
    not(index(X, 0, 0)), not(index(Y, 0, 0)), not(index(Z, 0, 0)),
    length(X, Xl), length(Y, Yl), length(Z, Zl),
    append([0], X, Xa), append([0], Y, Ya), append([0], Z, Za),
	makeNum(Xa, Xl, Xn),
    makeNum(Ya, Yl, Yn),
    makeNum(Za, Zl, Zn),
    Zn is Xn + Yn.

/* solves multiplication cryptarithm puzzles */
solveMult([], [], []).
solveMult(X, Y, Z):-
    append(X, Y, B), append(Z, B, A),
    sort(A, S),
    S ins 0..9,
    all_different(S),
    label(S),
    not(index(X, 0, 0)), not(index(Y, 0, 0)), not(index(Z, 0, 0)),
    length(X, Xl), length(Y, Yl), length(Z, Zl),
    append([0], X, Xa), append([0], Y, Ya), append([0], Z, Za),
	makeNum(Xa, Xl, Xn),
    makeNum(Ya, Yl, Yn),
    makeNum(Za, Zl, Zn),
    Zn is Xn * Yn.
