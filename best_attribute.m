%%Function to return the best attribute

function the_best = best_attribute(EXAMPLES, ATTRIBUTES)

%holds the best one and its value
the_best = zeros(1, 2);

%entropy of examples
entropy_of_examples = entropy_of_s(EXAMPLES);

%take the attributes 
%ATTRIBUTES = the vector of attributes we have (2-7)
for i= ATTRIBUTES,
	
	if(i != -1)
		
		entropy_of_att = entropy_of_attribute(i, EXAMPLES);
		
		
		gain = entropy_of_examples - entropy_of_att; %careful here, entropy of att could be negative
	
		%here we have the the_best( the best_att, the best_gain)
		if gain > the_best(1, 2),
			the_best  = [i, gain];
		endif
	endif	
endfor
