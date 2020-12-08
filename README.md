# cryptarithm_solver 

Currently solves addition and multiplication cryptarithms

Solves cryptarithms in the form:
WORD + WORD = ANSWER \
With the first two inptus being the added or muliplied words and the final input as the answer \
Returns the number associated with each character

### example queries (only first answer shown)

	SEND + MORE = MONEY
	solve([S, E, N, D], [M, O, R, E], [M, O, N, E, Y]).
	output: D = 7, E = 5, M = 1, N = 6, O = 0, R = 8, S = 9, Y = 2
	9567 + 1085 = 10652

	AM + PM = DAY
	solve([A, M], [P, M], [D, A, Y]).
	output: A = 2, D = 1, M = 5, P = 9, Y = 0
	25 + 95 = 120
 
	SNAKE + SNAKE = RATTLE
	solve([S, N, A, K, E], [S, N, A, K, E], [R, A, T, T, L, E]).
	output: A = 8, E = 0, K = 6, L = 2, N = 3, R = 1, S = 9, T = 7
	93860 + 93860 - 187720

	AM * PM = DAY
	solveMult([A, M], [P, M], [D, A, Y]).
	output: A = 1, D = 8, M = 3, P = 6, Y = 9
	13 * 63 = 819
