%%return the entropy of S ( all the examples)

function s = entropy_of_s(EXAMPLES)

%calculating the number of noauto
	num_of_noauto = sum(EXAMPLES(:,1) == 1);
	
	%calculating the number of auto
	num_of_auto = sum(EXAMPLES(:,1) == 2);
	
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
	
	
	if ( first != 0  ||  second != 0)
		s =  (-first) + (-second);
	elseif (first == 0  &&  second == 0)
		s = 0;
	endif	