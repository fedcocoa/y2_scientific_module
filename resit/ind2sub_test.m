test1 = round(rand(4)*10)

[rows, columns] = find(test1 > 2);

indices = sub2ind(size(test1),rows,columns);

test1(indices) = 0


test2 = round(rand(4)*5)

test2