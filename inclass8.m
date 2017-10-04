%AW: Looks good 1/1.


%Inclass assignment 8

%Using the swalign function
% A. Create a random DNA sequence of length 100. 

seq1 = randseq(100);

% B. Create a second sequence from the first one by changing the middle 20 basepairs (at positions 41-60)

seq2 = [seq1(1:40) randseq(20) seq1(61:100)];

% C. run swalign on the two sequences with the default parameters

[score, align, start] = swalign(seq1, seq2, 'Alphabet', 'nt', 'Showscore', true);

score;
align;
start;

% D. run swalign with much higher and lower values of the GapOpen parameter
% and explain the results. 

%% Higher value of GapOpen parameter (12)

[score, align, start] = swalign(seq1, seq2, 'Alphabet', 'nt', 'GapOpen', 12, 'Showscore', true);

score;
align;
start;

% With a higher GapOpen parameter, the sequence alignment is penalized more
% heavily for skipping bases, therefore, there is a preference for mismatch
% alignment rather than gap insertion. 

%% Lower value of GapOpen parameter (1)

[score, align, start] = swalign(seq1, seq2, 'Alphabet', 'nt', 'GapOpen', 1, 'Showscore', true);

score;
align;
start;

% With a lower GapOpen parameter, the sequence alignment is not penalized
% as heavily for skipping bases, therefore, there is a preference for gap
% insertion rather than mismatch alignment. 

% E. run swalign with a low value of GapOpen but a high value of ExtendGap,
% explain the result

[score, align, start] = swalign(seq1, seq2, 'Alphabet', 'nt', 'GapOpen', 1, 'ExtendGap', 15, 'Showscore', true);

score;
align;
start;

% With a lower GapOpen parameter, there is a preference for the insertion
% of gaps, but with a higher ExtendGap parameter, there is also a penalty
% for gaps that are greater than a base pair in length. As a result, there
% will be smaller gaps present in the alignment to maximize alignment
% score.

% F. run swalign align with the default value of GapOpen and a low value
% of ExtendGap and explain the result. 

[score, align, start] = swalign(seq1, seq2, 'Alphabet', 'nt','ExtendGap', 1, 'Showscore', true);

score;
align;
start;

% With a default GapOpen parameter and a low value of ExtendGap, there is
% a preference for long gap insertions. With the default GapOpen parameter,
% there is some penalty to having many small gaps, so those will be
% minimized as much as possible to maximize alignment score. Because the 
% ExtendGap value is low,there is not any significant penalty for having a 
% gap insertion that is longer than one base pair, so the resulting 
% sequence alignment could show gap insertions that span multiple base 
% pairs. Ultimately, the intermediate GapOpen parameter minimizes the total number of
% gaps, and the low ExtendGap parameter maximizes the size (in base pairs)
% of those gaps. Because of the intermediate value of the GapOpen
% parameter, there should still be some mismatches in the sequence
% alignment.
