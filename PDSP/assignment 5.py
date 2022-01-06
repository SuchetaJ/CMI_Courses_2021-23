N = int(input())
seq = []
div_seq = [1]+[0 for i in range(N-1)]
for i in range(N):
  seq.append(int(input()))

for i in range(1,N):
  len_lds = 1
  for j in range(0,i):
    if seq[i] % seq[j] == 0:
      len_lds = max(len_lds,(div_seq[j])+1)
  div_seq[i] = len_lds

print(max(div_seq))
