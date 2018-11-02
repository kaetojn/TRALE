%Kaetochukwu Ndu, ndukaeto, 1000265955

%--------------------------------------------------------------------------------------
%PART 1
%--------------------------------------------------------------------------------------
%Passed
test_sent([fido, feeds, the, dog, with, puppies, with, biscuits]).
test_sent([fido, feeds, puppies]).
test_sent([the, dog, with, biscuits, feeds, puppies]).
test_sent([fido,feeds,puppies]).
test_sent([fido,feeds,the,dog]).
test_sent([biscuits,feeds,fido], fails).
test_sent([fido, feeds, fido]).
test_sent([fido,feeds,dog], fails).
test_sent([fido,feeds,biscuits], fails).

%Failed
test_sent([biscuits, feeds, the, puppies], fails).
test_sent([biscuits,feed,fido], fails).
test_sent([fido, feeds, with, biscuits], fails).
test_sent([fido, with, puppies, feeds, puppies], fails).
test_sent([fido,feed,the,puppies], fails).


%--------------------------------------------------------------------------------------
%PART 2
%--------------------------------------------------------------------------------------
%Passed
test_sent([the,teacher, expected, the, teacher, to, sleep]).
test_sent([the,student,expected,to,sleep]).
test_sent([the,student,promised,the,teacher,to,sleep]).
test_sent([the,student,tried,the,teacher])
test_sent([the,student,expected,the,teacher]). 
test_sent([the,student,promised,to,sleep]).
test_sent([the,student,sleep,the,teacher]) fails).

%Failed
test_sent([the, student, appeared], fails).
test_sent([the, student, expected, to], fails).
test_sent([the,student,promised,the,teacher,the,student,tried,to,sleep], fails).
test_sent([the,student,promised,the,teacher,to,appeared,to,sleep]).
test_sent([the,student,promised], fails).
test_sent([the,student,tried,the,teacher,appeared,the,student,to,sleep], fails).
test_sent([the, student, appeared, the, teacher, to, sleep], fails).
test_sent([the,student,expected,the,teacher,appeared,the,student,to,sleep], fails).
test_sent([the,student,expected,teacher,to,sleep], fails).