%return 1 if the all the examples are noauto, or 2 if all the examples are auto
function result = all_same(EXAMPLE)


if (sum(EXAMPLE(:,1) == 1) == size(EXAMPLE,1))
	result = 1;
elseif (sum(EXAMPLE(:,1) == 2) == size(EXAMPLE,1))
	result = 2;
else
	result = -1;
endif

	
