%returns the new attribute vector with the bestAtt modified (to -1)
function result = new_att(ATTRIBUTE, bestatt)

ATTRIBUTE(bestatt -1) = -1;
result = ATTRIBUTE;