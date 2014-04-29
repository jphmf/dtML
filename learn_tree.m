%%return a tree 

function result =  learn_tree(EXAMPLES, ATTRIBUTES, TREEDEPTH, DEFAULT, tree, father)

%if there are no more examples...
if(size(EXAMPLES(:,1)) == 0)
	%add it to the position datafile
	
	t(1, 1) =  TREEDEPTH;
	t(1,2)  = DEFAULT+7;
	if(TREEDEPTH == 0)
		t(1, 3) =  -1;
	else	
		t(1, 3) = father-1 ;
	endif
	save ("-append", "-ascii", "positions", "t");
%if examples are only positive or negative...
elseif(all_same(EXAMPLES) != -1)
	%add it to the position datafile
	%printf("node for %d\n", all_same(EXAMPLES));
	
	t(1, 1) =  TREEDEPTH;
	t(1,2)  = all_same(EXAMPLES)+7;
	if(TREEDEPTH == 0)
		t(1, 3) =  -1;
	else	
		t(1, 3) = father-1;
	endif
	save ("-append", "-ascii", "positions", "t");
%if there are no more attributes... (everyone is "-1")
elseif (no_att(ATTRIBUTES) == -1) 
	
	%printf("node for %d\n", DEFAULT);
	%add it to the position datafile
	
	t(1, 1) =  TREEDEPTH;
	t(1,2)  = DEFAULT +7;
	if(TREEDEPTH == 0)
		t(1, 3) =  -1;
	else	
		t(1, 3) = father-1;
	endif
	save ("-append", "-ascii", "positions", "t");
else
	%who is the best attribute?
	theBestAtt = best_attribute(EXAMPLES, ATTRIBUTES);
	
	
	%add it to the position datafile
	t(1, 1) =  TREEDEPTH;
	t(1,2)  = theBestAtt(:,1) -1;
	
	
	if(TREEDEPTH == 0)
		t(1, 3) =  -1;
	else	
		t(1, 3) = father-1;
	endif
	
	tree = [tree;t];
	save ("-append", "-ascii",  "positions", "t");
	%printf("%d", theBestAtt(:,1))
	
	
	
	father = theBestAtt(:,1);	
	
	
	%take the most common element in Elements(:,1) to use as the new default
	newDefault = mode(EXAMPLES(:,1));
	
	
	
	
	number_of_children = max(EXAMPLES(:, theBestAtt(:,1)));
	
	%for x  = 1 - max of children 
	for x = 1:number_of_children,
		%take the new parameters
		
		%printf("depth : %d, feature branch: %d of %d\n", TREEDEPTH,x, theBestAtt(:,1) )
		
		
		newExamples = examplesA(EXAMPLES, theBestAtt(:,1), x);
		newAttributes = new_att(ATTRIBUTES, theBestAtt(:,1));
		%and use them into the recursion
		tree = learn_tree(newExamples, newAttributes, TREEDEPTH  + 1, newDefault, tree, father);
		
	endfor
	
endif
result = tree;









