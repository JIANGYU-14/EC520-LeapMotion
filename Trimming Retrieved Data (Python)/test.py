import xlwt
import xlrd

file_name="pre.txt"
f2 = open('2.txt','w')
with open(file_name) as f:
	for line in f:
		line=line.replace('(','').replace(')','').replace(' ','')
		x=line.split(',')[0]
		y=line.split(',')[1]
		z=line.split(',')[2]
		f2.write(x+' ')
		f2.write(z)
		print(x,z)

f2.close()

book = xlwt.Workbook()
ws = book.add_sheet('First Sheet')

f = open('pre.txt','r+')
data = f.readlines()
for i in range(len(data)):
        row = data[i].split()

        for j in range(len(row)):
                ws.write(i,j,row[j])

book.save('pre' + '.xls')
f.close()
