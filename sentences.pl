%Kaetochukwu Ndu, ndukaeto, 1000265955

%PART A

%Pass
test_sent([fido, fed, the, dog, with, puppies, with, biscuits]).
test_sent([fido, fed, puppies]).
test_sent([the, dog, with, biscuits, fed, biscuits]).
test_sent([fido,fed,the,puppies]).
test_sent([fido,fed,puppies]).
test_sent([fido,fed,biscuits]).
test_sent([fido,fed,the,dog]).

%Fail
test_sent([biscuits, fed, the, puppies], fails).
test_sent([biscuits,fed,fido], fails).
test_sent([fido, fed, fido], fails).
test_sent([fido, fed, with, biscuits], fails).
test_sent([fido, with, puppies, fed, puppies], fails).
test_sent([fido,fed,dog], fails).
test_sent([fido,fed,fido], fails).

%PART B

%Pass
test_sent([students, expected, to, expect, to, expect, to, promise, the, students, to, sleep]).
test_sent([teachers, expected, the, teacher, to, sleep]).
test_sent([the, student, appeared, the, teacher, to, sleep]).
test_sent([the,student,appeared,the,teacher,to,sleep]).
test_sent([the,student,expected,the,teacher,appeared,the,student,to,sleep]).
test_sent([the,student,expected,the,teacher,to,sleep]).
test_sent([the,student,expected,to,sleep]).
test_sent([the,student,promised,the,teacher,to,sleep]).
test_sent([the,student,tried,the,teacher])
test_sent([the,student,tried,to,sleep]).

%Fail
test_sent([student, expected, to, sleep], fails).
test_sent([student,tried,to,sleep], fails).
test_sent([students, expected, to, sleep, to, sleep], fails).
test_sent([the, student, appeared, to, sleep], fails).
test_sent([the, student, appeared], fails).
test_sent([the, student, expected, to], fails).
test_sent([the,student,appeared,to,sleep], fails).
test_sent([the,student,expected,the,teacher], fails). 
test_sent([the,student,promised,the,teacher,the,student,tried,to,sleep], fails).
test_sent([the,student,promised,the,teacher], fails).
test_sent([the,student,promised,to,sleep], fails).
test_sent([the,student,promised], fails).
test_sent([the,student,sleep,the,teacher], fails).
test_sent([the,student,tried,the,teacher,appeared,the,student,to,sleep], fails).