%%return the entropy of an attribute

%i is the column of the attribute in EXAMPLES
function e = entropy_of_attribute(i, EXAMPLES)

att = EXAMPLES(:, i);

sum_of_entropy_att = zeros(1,1);

%lets take the max number in this column
%this will tell us how many different
%"sons" this attribute has 
num = max(att);


%now for each one, see how is the proportion of auto/noauto in the target value
for x=1:num,
	%lets calculate the proportion of the elements by the total number of elements we have
	
	num_of_elements = sum(att == x);
	total_num_of_elements = size(att,1);
	proportion = num_of_elements / total_num_of_elements;

	
	%now, lets calculate the entropy for this son
	%lets see how many auto/noauto it has
	%first lets return the matrix with only the rows of that son
	vector_of_target_values = zeros( total_num_of_elements,1);
	
	for y = 1:total_num_of_elements,
		if(att(y,1) == x),
			vector_of_target_values(y,:) = EXAMPLES(y,1);
		endif
	endfor
	
	
	%calculating the number of noauto
	num_of_noauto = sum(vector_of_target_values == 1);
	
	%calculating the number of auto
	num_of_auto = sum(vector_of_target_values == 2);
	
	%calculating the entropy of E(num_of_noauto, num_of_auto)
	
	if(num_of_noauto != 0),	
		first = ((num_of_noauto/(num_of_auto + num_of_noauto)) * 
		log2(num_of_noauto/(num_of_auto + num_of_noauto)));
	else
		first = 0;
	endif
	
	if(num_of_auto != 0),
		second = ((num_of_auto/(num_of_auto + num_of_noauto))*log2(num_of_auto/(num_of_auto + num_of_noauto)));
	else 
		second = 0;
	endif
	
	
	entropy_of_proportion =  (-first) + (-second);
	
	
	%mutiplying by the total proportion
	entropy_of_this_son = proportion * entropy_of_proportion;
	
	%adding to the entropy of the whole attribute
	sum_of_entropy_att = sum_of_entropy_att + entropy_of_this_son;
endfor

%here the sum of the entropy is over 
%and we have the entropy of this attribute
e = sum_of_entropy_att;