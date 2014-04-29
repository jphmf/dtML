function res = main ()

%load data and create tree
load("shuttle_ext_unique.dat");
attribute = 2:7;
tree  = [0 0 0];
learn_tree(shuttle_ext_unique, attribute, 0, 1, tree);

%"tree matrix" is nx3 where  tree[TREEDEPTH ATTRIBUTE FATHER]
%TREEDEPTH starts at 0 
%ATTRIBUTE is a number between 2-9. 8 refers to noauto, and 9 to auto. 
%Father is the father of the current node, the father of the root is "-1" by default


%load positions datafile. "Positions" contains all the nodes and leaves of the tree.
load("positions");

%print tree
print(positions)

%please, just make sure "positions" is empty before you run this code.
