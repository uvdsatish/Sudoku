# Display function

def display(x)
	x.each do |r|
    puts r.map { |p| p }.join(" ")
	end
end

# validating updated sudoko table
def filled_up(aa)
  ff = true;
  sum = [];
  for i in 0..8 do
  	sum[i]=0;
  	for j in 0..8 do
  		if aa[i][j].kind_of? Integer then
  			sum[i] = sum[i] + aa[i][j];
  		end
  	end
  	if sum[i] == 45 then 
  		next
  	else
  		ff = false
  	end
  end
  if ff == true then
  		for j in 0..8 do
  			sum[j]=0;
  			for i in 0..8 do
				if aa[i][j].kind_of? Integer then
  					sum[j] = sum[j] + aa[i][j];
  				end
  			end
  			if sum[j] == 45 then
  				next
  			else
  				ff = false
  			end
  		end
  	end
  	return ff
  end


# gather the row elements  			
def collect_row(i,aa)
	x=[];
	for j in 0..8 do
		x.push(aa[i][j]);
	end
	return x
end

# gather the column elements
def collect_col(j,aa)
	x=[];
	for i in 0..8 do
		x.push(aa[i][j]);
	end
	return x
end

# collect sub-matrix n*n

def collect_sub(i,j,aa)
	a1,a2,a3,a4,a5,a6,a7,a8,a9 = [],[],[],[],[],[],[],[],[];

	for x in 0..2 do
			for y in 0..2 do
					a1.push(aa[x][y]);
				end
		end
	for x in 0..2 do
			for y in 3..5 do
					a2.push(aa[x][y]);
				end
		end
	for x in 0..2 do
			for y in 6..8 do
					a3.push(aa[x][y]);
				end
		end
	for x in 3..5 do
			for y in 0..2 do
					a4.push(aa[x][y]);
				end
		end
	for x in 3..5 do
			for y in 3..5 do
					a5.push(aa[x][y]);
				end
		end
	for x in 3..5 do
			for y in 6..8 do
					a6.push(aa[x][y]);
				end
		end
	for x in 6..8 do
			for y in 0..2 do
					a7.push(aa[x][y]);
				end
		end
	for x in 6..8 do
			for y in 3..5 do
					a8.push(aa[x][y]);
				end
		end
	for x in 6..8 do
			for y in 6..8 do
					a9.push(aa[x][y]);
				end
		end
f=[];

if (((i >= 0) && (i <= 2)) &&((j >= 0) && (j <= 2))) then
		for p in 0..8 do
			f.push(a1[p]);
		end
	end


if (((i >= 0) && (i <= 2)) &&((j >= 3) && (j <= 5))) then
		for p in 0..8 do
			f.push(a2[p]);
		end
	end

if (((i >= 0) && (i <= 2)) &&((j >= 6) && (j <= 8))) then
		for p in 0..8 do
			f.push(a3[p]);
		end
	end

if (((i >= 3) && (i <= 5)) &&((j >= 0) && (j <= 2))) then
		for p in 0..8 do
			f.push(a4[p]);
		end
	end

if (((i >= 3) && (i <= 5)) &&((j >= 3) && (j <= 5))) then
		for p in 0..8 do
			f.push(a5[p]);
		end
	end

if (((i >= 3) && (i <= 5)) &&((j >= 6) && (j <= 8))) then
		for p in 0..8 do
			f.push(a6[p]);
		end
	end

if (((i >= 6) && (i <= 8)) &&((j >= 0) && (j <= 2))) then
		for p in 0..8 do
			f.push(a7[p]);
		end
	end

if (((i >= 6) && (i <= 8)) &&((j >= 3) && (j <= 5))) then
		for p in 0..8 do
			f.push(a8[p]);
		end
	end

if (((i >= 6) && (i <= 8)) &&((j >= 6) && (j <= 8))) then
		for p in 0..8 do
			f.push(a9[p]);
		end
	end

return f;

end


#main function with sample sudoko puzzles represented by matrix a
#a=[[0,1,0,0,2,4,0,0,3],[3,0,4,0,0,0,7,0,5],[0,0,9,0,5,0,0,4,0],[6,8,0,0,4,0,1,0,9],[4,0,7,0,0,0,3,0,6],[1,0,3,0,8,0,0,5,2],[0,3,0,0,7,0,8,0,0],[9,0,1,0,0,0,6,0,7],[8,0,0,1,9,0,0,3,0]];
#a=[[3,8,0,0,0,0,7,1,0],[0,0,4,0,8,0,0,6,0],[0,2,9,0,0,7,0,0,0],[0,0,0,0,7,4,0,0,0],[2,0,0,0,0,0,0,0,5],[0,0,0,6,9,0,0,0,0],[0,0,0,7,0,0,9,5,0],[0,1,0,0,5,0,6,0,0],[0,3,7,0,0,0,0,4,2]];
a=[[5,9,0,0,0,4,0,2,0],[0,0,4,1,2,0,0,0,0],[2,8,0,5,6,0,0,1,7],[0,4,0,0,8,0,0,0,9],[8,0,2,0,0,0,5,0,4],[6,0,0,0,4,0,0,7,0],[4,3,0,0,5,2,0,8,1],[0,0,0,0,3,8,9,0,0],[0,2,0,4,0,0,0,5,6]];
R=[1,2,3,4,5,6,7,8,9];
flag = true;
count = 0;
puts "before";
display(a);
catch (:out) do
	while(flag) do
		count = count+1;
		for i in 0..8 do
			for j in 0..8 do
				if a[i][j]!= 0 then
					next; 
				end
				x1=collect_row(i,a);
				x2=collect_col(j,a);
				x3=collect_sub(i,j,a);
				x=x1+x2+x3;
				x.uniq!;
				x=x-[0];
				#puts "#{i} #{j} => #{x} #{x.length}"
				
				if x.length > 8 or count == 10000 then
					puts x;
					puts "sudoku error or too much processing";
					display(a);
					throw :out;
				end

				if x.length < 8 then next end;

				if x.length == 8 then
					d = R-x;
					if d.length == 1 then
						a[i][j] = d[0];
					else
						puts "sudoku error - more than one option";
						throw :out;
					end
				end

				if filled_up(a) then
					puts "successful sudoku";
					puts "no. of iterations #{count}"
					display(a);
					flag = false;
					throw :out;
				end
			end
		end
	end
end
