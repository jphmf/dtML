%return 1 if there's someone who is not negative (it there's an usable attribute)
function result = no_att(ATTRIBUTES)

result = -1;

for i = 1:(size(ATTRIBUTES)) 
	if(ATTRIBUTES(:,i) != -1)
		result = 1;	
	endif	
endfor