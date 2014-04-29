% return the rows where that child appears
% careful! the first row is always full of 0
function result = examplesA(EXAMPLES, bestatt ,child)

r = zeros(1,7);


for i= 1:(size(EXAMPLES, 1)),
	if (EXAMPLES(i, bestatt) == child)
		r = [r; [EXAMPLES(i,:)]];
	endif	
endfor

result = r(2:size(r,1), :);
