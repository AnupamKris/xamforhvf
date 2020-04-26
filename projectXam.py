
# A very simple Bottle Hello World app for you to get started with...
from bottle import route, run, template, request, post, redirect, static_file, default_app
from oauth2client.service_account import ServiceAccountCredentials
import gspread
import pymysql
import pandas as pd

application = default_app()

scope = ["https://spreadsheets.google.com/feeds",'https://www.googleapis.com/auth/spreadsheets',"https://www.googleapis.com/auth/drive.file","https://www.googleapis.com/auth/drive"]

creds = ServiceAccountCredentials.from_json_keyfile_name("static/e-xamforhvf-878f20063915.json", scope)

client = gspread.authorize(creds)

datasheetcolumn = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'A', 'AA', 'AB', 'AC', 'AD', 'AE', 'AF', 'AG', 'AH', 'AI', 'AJ', 'AK', 'AL', 'AM', 'AN', 'AO', 'AP', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AV', 'AW', 'AX', 'AY', 'AZ', 'B', 'BA', 'BB', 'BC', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BK', 'BL', 'BM', 'BN', 'BO', 'BP', 'BQ', 'BR', 'BS', 'BT', 'BU', 'BV', 'BW', 'BX', 'BY', 'BZ', 'C', 'CA', 'CB', 'CC', 'CD', 'CE', 'CF', 'CG', 'CH', 'CI', 'CJ', 'CK', 'CL', 'CM', 'CN', 'CO', 'CP', 'CQ', 'CR', 'CS', 'CT', 'CU', 'CV', 'CW', 'CX', 'CY', 'CZ', 'D', 'DA', 'DB', 'DC', 'DD', 'DE', 'DF', 'DG', 'DH', 'DI', 'DJ', 'DK', 'DL', 'DM', 'DN', 'DO', 'DP', 'DQ', 'DR', 'DS', 'DT', 'DU', 'DV', 'DW', 'DX', 'DY', 'DZ', 'E', 'EA', 'EB', 'EC', 'ED', 'EE', 'EF', 'EG', 'EH', 'EI', 'EJ', 'EK', 'EL', 'EM', 'EN', 'EO', 'EP', 'EQ', 'ER', 'ES', 'ET', 'EU', 'EV', 'EW', 'EX', 'EY', 'EZ', 'F', 'FA', 'FB', 'FC', 'FD', 'FE', 'FF', 'FG', 'FH', 'FI', 'FJ', 'FK', 'FL', 'FM', 'FN', 'FO', 'FP', 'FQ', 'FR', 'FS', 'FT', 'FU', 'FV', 'FW', 'FX', 'FY', 'FZ', 'G', 'GA', 'GB', 'GC', 'GD', 'GE', 'GF', 'GG', 'GH', 'GI', 'GJ', 'GK', 'GL', 'GM', 'GN', 'GO', 'GP', 'GQ', 'GR', 'GS', 'GT', 'GU', 'GV', 'GW', 'GX', 'GY', 'GZ', 'H', 'HA', 'HB', 'HC', 'HD', 'HE', 'HF', 'HG', 'HH', 'HI', 'HJ', 'HK', 'HL', 'HM', 'HN', 'HO', 'HP', 'HQ', 'HR', 'HS', 'HT', 'HU', 'HV', 'HW', 'HX', 'HY', 'HZ', 'I', 'IA', 'IB', 'IC', 'ID', 'IE', 'IF', 'IG', 'IH', 'II', 'IJ', 'IK', 'IL', 'IM', 'IN', 'IO', 'IP', 'IQ', 'IR', 'IS', 'IT', 'IU', 'IV', 'IW', 'IX', 'IY', 'IZ', 'J', 'JA', 'JB', 'JC', 'JD', 'JE', 'JF', 'JG', 'JH', 'JI', 'JJ', 'JK', 'JL', 'JM', 'JN', 'JO', 'JP', 'JQ', 'JR', 'JS', 'JT', 'JU', 'JV', 'JW', 'JX', 'JY', 'JZ', 'K', 'KA', 'KB', 'KC', 'KD', 'KE', 'KF', 'KG', 'KH', 'KI', 'KJ', 'KK', 'KL', 'KM', 'KN', 'KO', 'KP', 'KQ', 'KR', 'KS', 'KT', 'KU', 'KV', 'KW', 'KX', 'KY', 'KZ', 'L', 'LA', 'LB', 'LC', 'LD', 'LE', 'LF', 'LG', 'LH', 'LI', 'LJ', 'LK', 'LL', 'LM', 'LN', 'LO', 'LP', 'LQ', 'LR', 'LS', 'LT', 'LU', 'LV', 'LW', 'LX', 'LY', 'LZ', 'M', 'MA', 'MB', 'MC', 'MD', 'ME', 'MF', 'MG', 'MH', 'MI', 'MJ', 'MK', 'ML', 'MM', 'MN', 'MO', 'MP', 'MQ', 'MR', 'MS', 'MT', 'MU', 'MV', 'MW', 'MX', 'MY', 'MZ', 'N', 'NA', 'NB', 'NC', 'ND', 'NE', 'NF', 'NG', 'NH', 'NI', 'NJ', 'NK', 'NL', 'NM', 'NN', 'NO', 'NP', 'NQ', 'NR', 'NS', 'NT', 'NU', 'NV', 'NW', 'NX', 'NY', 'NZ', 'O', 'OA', 'OB', 'OC', 'OD', 'OE', 'OF', 'OG', 'OH', 'OI', 'OJ', 'OK', 'OL', 'OM', 'ON', 'OO', 'OP', 'OQ', 'OR', 'OS', 'OT', 'OU', 'OV', 'OW', 'OX', 'OY', 'OZ', 'P', 'PA', 'PB', 'PC', 'PD', 'PE', 'PF', 'PG', 'PH', 'PI', 'PJ', 'PK', 'PL', 'PM', 'PN', 'PO', 'PP', 'PQ', 'PR', 'PS', 'PT', 'PU', 'PV', 'PW', 'PX', 'PY', 'PZ', 'Q', 'QA', 'QB', 'QC', 'QD', 'QE', 'QF', 'QG', 'QH', 'QI', 'QJ', 'QK', 'QL', 'QM', 'QN', 'QO', 'QP', 'QQ', 'QR', 'QS', 'QT', 'QU', 'QV', 'QW', 'QX', 'QY', 'QZ', 'R', 'RA', 'RB', 'RC', 'RD', 'RE', 'RF', 'RG', 'RH', 'RI', 'RJ', 'RK', 'RL', 'RM', 'RN', 'RO', 'RP', 'RQ', 'RR', 'RS', 'RT', 'RU', 'RV', 'RW', 'RX', 'RY', 'RZ', 'S', 'SA', 'SB', 'SC', 'SD', 'SE', 'SF', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN', 'SO', 'SP', 'SQ', 'SR', 'SS', 'ST', 'SU', 'SV', 'SW', 'SX', 'SY', 'SZ', 'T', 'TA', 'TB', 'TC', 'TD', 'TE', 'TF', 'TG', 'TH', 'TI', 'TJ', 'TK', 'TL', 'TM', 'TN', 'TO', 'TP', 'TQ', 'TR', 'TS', 'TT', 'TU', 'TV', 'TW', 'TX', 'TY', 'TZ', 'U', 'UA', 'UB', 'UC', 'UD', 'UE', 'UF', 'UG', 'UH', 'UI', 'UJ', 'UK', 'UL', 'UM', 'UN', 'UO', 'UP', 'UQ', 'UR', 'US', 'UT', 'UU', 'UV', 'UW', 'UX', 'UY', 'UZ', 'V', 'VA', 'VB', 'VC', 'VD', 'VE', 'VF', 'VG', 'VH', 'VI', 'VJ', 'VK', 'VL', 'VM', 'VN', 'VO', 'VP', 'VQ', 'VR', 'VS', 'VT', 'VU', 'VV', 'VW', 'VX', 'VY', 'VZ', 'W', 'WA', 'WB', 'WC', 'WD', 'WE', 'WF', 'WG', 'WH', 'WI', 'WJ', 'WK', 'WL', 'WM', 'WN', 'WO', 'WP', 'WQ', 'WR', 'WS', 'WT', 'WU', 'WV', 'WW', 'WX', 'WY', 'WZ', 'X', 'XA', 'XB', 'XC', 'XD', 'XE', 'XF', 'XG', 'XH', 'XI', 'XJ', 'XK', 'XL', 'XM', 'XN', 'XO', 'XP', 'XQ', 'XR', 'XS', 'XT', 'XU', 'XV', 'XW', 'XX', 'XY', 'XZ', 'Y', 'YA', 'YB', 'YC', 'YD', 'YE', 'YF', 'YG', 'YH', 'YI', 'YJ', 'YK', 'YL', 'YM', 'YN', 'YO', 'YP', 'YQ', 'YR', 'YS', 'YT', 'YU', 'YV', 'YW', 'YX', 'YY', 'YZ', 'Z', 'ZA', 'ZB', 'ZC', 'ZD', 'ZE', 'ZF', 'ZG', 'ZH', 'ZI', 'ZJ', 'ZK', 'ZL', 'ZM', 'ZN', 'ZO', 'ZP', 'ZQ', 'ZR', 'ZS', 'ZT', 'ZU', 'ZV', 'ZW', 'ZX', 'ZY', 'ZZ']
@route('/')
def index():
	return template('index')

@route('/static/<filename>')
def server_static(filename):
	return static_file(filename, "./static")

@post('/')
def process():
	name = request.forms.get('teacher')
	if name == 'Teacher':
		return redirect('/teacherpage')
	elif name == 'Student':
		return redirect('/studentpage')

@route('/studentpage')
def studentpages():
	return template('student_home_page',{'message':'None'})

@post('/studentpage')
def student_options():
	option = request.forms.get('option')
	if option == 'Write Test':
		return redirect('/write')
	elif option == 'View Result':
		return redirect('/studentpage/result')

@route('/studentpage/result')
def result_auth_student():
	return template('student_result_auth_page')

# @route('/studentpage/result/<message>')
# def result_auth_student(message):
# 	return template('student_result_auth_page',{'message':message})

@post('/studentpage/result')
def view_result_student():
	testname = request.forms.get('testname')
	studcode = request.forms.get('studcode')
	stdc = str(studcode)
	print(testname,studcode)
	return redirect('/studentpage/result/'+testname+'/'+stdc)


@route('/studentpage/result/<testname>/<studcode>')
def display_result(testname,studcode):
	try:
		client = gspread.authorize(creds)
		spreadsheetresult = client.open("resultData")
		resultsheet = spreadsheetresult.worksheet(testname)
		client = gspread.authorize(creds)
		spreadsheetanswer = client.open("answerData")
		answersheet = spreadsheetanswer.worksheet(testname)
		spreadsheetquestion = client.open("questionData")
		questionpaper = spreadsheetquestion.worksheet(testname)
		questions = questionpaper.get_all_values()
		submissions = answersheet.get_all_values()
		questiondata = []
		markdata = []
		options = []
		print(questions)
		for i in questions:
			questiondata.append(i[2])
			markdata.append(i[7])
			options.append(i[3:7])
		for i in submissions:
			if i[0] == studcode:
				answers = i
				print(answers)
		if answers[1].lower() == 'true':
			df = pd.read_excel('static/studentdata.xls')
			tempvar = df.loc[df['Student Code'] == int(studcode)]
			studname = list(tempvar['Student Name'])[0]
			print(studname)
		list_of_lists = resultsheet.get_all_values()
		for j in list_of_lists:
			if j[1] == studcode:
				print(j)
				marks = j[2:-1]
				total = j[-1]
				return template('student_result_page',{'answers' : answers,'questions' : questiondata, 'markdata':markdata, 'options':options,'testname':testname,'studname':studname,'marks':marks,'total':total})
	except:
		return redirect('/serror404/Invalid Details Submitted Please retry')


@route('/teacherpage')
def teacherpage():
	return template('teacher_authorization_page')


@post('/teacherpage')
def teacherlogin():
	password = request.forms.get('password')
	if password == 'qwertyuiop':
		return redirect('/teacherpage/fhgbivqhvtyukqhvtruiqhvuijiquyj1iovyhivgjskghwvejjumauiicjijyiofvjgyiogjiy')


@route('/teacherpage/fhgbivqhvtyukqhvtruiqhvuijiquyj1iovyhivgjskghwvejjumauiicjijyiofvjgyiogjiy')
def teacherhome():
	return template('teacher_home_page')


@post('/teacherpage/fhgbivqhvtyukqhvtruiqhvuijiquyj1iovyhivgjskghwvejjumauiicjijyiofvjgyiogjiy')
def evaloptions():
	option = request.forms.get('option')
	if option == 'Create Test':
		redirect('/iqwueyraskdjfhqoiuryaskjfhpqoutyskjdfhpiuryksajdfhsjfhdlksdfhhsfghfhdfhfgds')
	elif option == 'Evaluate Submissions':
		redirect('/uioquiwtqvui4tyuirteuioreguifskdfiodsfsiofiegiofldjklsfioshflskdhfkshfjsdhf')
	elif option == 'View Result':
		redirect('/jsfdgiuasbuiybtuibiueytuerhtukihtuiembkhmiuigmjibhruthkwhybgtbiuhetbkehbtih')

@route('/jsfdgiuasbuiybtuibiueytuerhtukihtuiembkhmiuigmjibhruthkwhybgtbiuhetbkehbtih')
def teacher_result_auth_page():
	return template('teacher_result_auth_page')

@post('/jsfdgiuasbuiybtuibiueytuerhtukihtuiembkhmiuigmjibhruthkwhybgtbiuhetbkehbtih')
def validate_teacher_result_data():
	testname = request.forms.get('testname')
	client = gspread.authorize(creds)
	spreadsheetresult = client.open("resultData")
	resultsheet = spreadsheetresult.worksheet(testname)
	list_of_lists = resultsheet.get_all_values()
	return template('teacher_result_table_page',{'results':list_of_lists})



@route('/iqwueyraskdjfhqoiuryaskjfhpqoutyskjdfhpiuryksajdfhsjfhdlksdfhhsfghfhdfhfgds')
def testoptions():
	return template('test_preferences_page')

@post('/iqwueyraskdjfhqoiuryaskjfhpqoutyskjdfhpiuryksajdfhsjfhdlksdfhhsfghfhdfhfgds')
def testprocess():
	import sqlite3 as s
	testname = request.forms.get('testname')
	minutes = request.forms.get('minute')
	hours = request.forms.get('hour')

	global testdatanameetc
	testdatanameetc = {'tnme': testname}
	return redirect('/iqwueyraskdjfhqoiuryaskjfhpqoutyskjdfhpiuryksajdfhsjfhdlksdfhhsfghfhdfhfgds/create/'+testdatanameetc['tnme']+f'/{hours}/{minutes}')


@route('/iqwueyraskdjfhqoiuryaskjfhpqoutyskjdfhpiuryksajdfhsjfhdlksdfhhsfghfhdfhfgds/create/<testname>/<hours>/<minutes>')
def testcreatepage(testname,hours,minutes):
	global testdatanameetc
	return template('question_creation_page',testdatanameetc)

@post('/iqwueyraskdjfhqoiuryaskjfhpqoutyskjdfhpiuryksajdfhsjfhdlksdfhhsfghfhdfhfgds/create/<testname>/<hours>/<minutes>')
def upload_to_server(testname,hours,minutes):
	datalist = []
	dl = {}
	db = pymysql.connect('remotemysql.com','Ip6wkVx4ZX','uFH3r0rgQk','Ip6wkVx4ZX')
	cursor = db.cursor()
	cursor.execute(f'insert into timedata values("{testname}",{hours},{minutes})')
	db.commit()
	db.close()
	keylist = list(request.forms.keys())
	valuelist = list(request.forms.values())
	keyvalpair = {keylist[i]: valuelist[i] for i in range(len(keylist))}
	for keys in keylist:
		if 'option' not in keys and 'mark' not in keys:
			if keylist.index(keys) != len(keylist)-1 and 'option' in keylist[keylist.index(keys)+1]:
				dl[keyvalpair[keys]] = []
			else:
				dl[keyvalpair[keys]] = ['subjective']
			datalist.append(keys)
		else:
			dl[keyvalpair[datalist[-1]]].append(keyvalpair[keys])
	questionbank = {}
	for i in range(1,len(datalist)+1):
		Q = keyvalpair[datalist[i-1]]
		if dl[keyvalpair[datalist[i-1]]][0] == 'subjective':
			mark = dl[keyvalpair[datalist[i-1]]][1]
			val = {'Q':Q,'mark':mark}
			questionbank[i] = val
		else:
			A = dl[keyvalpair[datalist[i-1]]][0]
			B = dl[keyvalpair[datalist[i-1]]][1]
			C = dl[keyvalpair[datalist[i-1]]][2]
			D = dl[keyvalpair[datalist[i-1]]][3]
			mark = dl[keyvalpair[datalist[i-1]]][4]
			questionbank[i] = {'Q':Q,'A':A,'B':B,'C':C,'D':D,'mark':mark}

	client = gspread.authorize(creds)

	spreadsheetquestion = client.open("questionData")
	spreadsheetanswer = client.open("answerData")
	spreadsheetresult = client.open("resultData")

	answerworksheet = spreadsheetanswer.add_worksheet(title=testname, rows="100", cols="100")
	questionworksheet = spreadsheetquestion.add_worksheet(title =testname, rows='100',cols = '100')
	spreadsheetresult.add_worksheet(title =testname, rows='100',cols = '100')
	for i in questionbank:
		if len(questionbank[i])>3:
			cell_list = questionworksheet.range(f'A{i}:H{i}')
			questionvals = list(questionbank[i].values())
			questionvals.insert(0,i)
			questionvals.insert(1,'mcq')
			dat = 0
			for cell in cell_list:
				cell.value = questionvals[dat]
				dat+=1
			questionworksheet.update_cells(cell_list)
		else:
			cell_list = questionworksheet.range(f'A{i}:H{i}')
			questionvals = [i,'sub',questionbank[i]['Q'],'','','','',questionbank[i]['mark']]
			dat = 0
			for cell in cell_list:
				cell.value = questionvals[dat]
				dat+=1
			questionworksheet.update_cells(cell_list)
	return template('temp',{ 'data' : questionbank})

@route('/write')
def writepage():
	return template('student_authorization_page',{'message':'None'})

@post('/write')
def checktest():
	testname = request.forms.get('testname')
	studcode = request.forms.get('studcode')
	df = pd.read_excel('static/studentdata.xls')
	tempvar = df.loc[df['Student Code'] == int(studcode)]
	try:
		studname = list(tempvar['Student Name'])[0]
	except:
		return template('student_authorization_page',{'message' : 'Code Not Found'})
	client = gspread.authorize(creds)

	spreadsheetanswer = client.open("answerData")
	try:
		worksheet = spreadsheetanswer.worksheet(testname)
	except:
		return template('student_authorization_page',{'message' : 'Test Not Found'})

	list_of_lists = worksheet.get_all_values()
	for i in list_of_lists:
		if studcode in i:
			return template('student_authorization_page',{'message' : "You have already attended the test"})
	for i in list_of_lists:
		if studcode not in i:
			return redirect('/write/'+testname+'/'+str(studcode))
	# return (str(questions))

	# except:
		# return('Failed!')

@route('/write/<testname>/<studcode>')
def testpage(testname,studcode):
	print(testname)
	spreadsheetquestion = client.open("questionData")
	db = pymysql.connect('remotemysql.com','Ip6wkVx4ZX','uFH3r0rgQk','Ip6wkVx4ZX')
	cursor = db.cursor()
	cursor.execute(f'select * from timedata where testname like "{testname}";')
	time = cursor.fetchall()
	minute = int(time[0][2])
	hour = int(time[0][1])
	time = minute*60+hour*60*60
	print(time)
	# try:
	worksheet = spreadsheetquestion.worksheet(testname)
	questiondata = worksheet.get_all_values()
	questions = {}
	x = 1
	for data in questiondata:
		if data[1] == 'mcq':
			questions[x] = {'Q':data[2],'A':data[3],'B':data[4],'C':data[5],'D':data[6],'mark':data[7]}
			x+=1
		elif data[1] == 'sub':
			questions[x] = {'Q':data[2],'mark':data[7]}
			x+=1
	return template('test_writing_page',{'questions': questions,'testname':testname,'time':time})

@post('/write/<testname>/<studcode>')
def processtest(testname,studcode):
	print(studcode)
	testname = request.forms.get('testname')
	keylist = list(request.forms.keys())
	valuelist = list(request.forms.values())
	keyvalpair = {keylist[i]: valuelist[i] for i in range(len(keylist))}
	testname = request.forms.get('testname')
	print(testname)
	client = gspread.authorize(creds)

	spreadsheetanswer = client.open("answerData")
	worksheet = spreadsheetanswer.worksheet(testname)
	valuelist.pop(0)
	valuelist.insert(0,studcode)
	global datasheetcolumn
	list_of_lists = worksheet.get_all_values()
	for i in list_of_lists:
		if studcode in i:
			return('<h1>Test already written</h1>')
			break
	else:
		xrange = len(valuelist)
		cell_list = worksheet.range(f'A{len(list_of_lists)+1}:{datasheetcolumn[xrange]}{len(list_of_lists)+1}')
		valuelist.insert(1,'False')
		count = 0
		for cell in cell_list:
			cell.value = valuelist[count]
			count+=1
		worksheet.update_cells(cell_list)

		return redirect('/serror404/Test Successfully Submitted')

@route('/terror404/<message>')
def terror_route(message):
	return template('teacher_error_page',{'message':message})

@route('/serror404/<message>')
def serror_route(message):
	return template('student_error_page',{'message':message})

@route('/uioquiwtqvui4tyuirteuioreguifskdfiodsfsiofiegiofldjklsfioshflskdhfkshfjsdhf')
def evaluatepart1():
	return template('teacher_eval_test_enter_page')
@post('/uioquiwtqvui4tyuirteuioreguifskdfiodsfsiofiegiofldjklsfioshflskdhfkshfjsdhf')
def seesubmissions():
	testname = request.forms.get('testname')
	# return template('submissions',{'submissions':submissions})
	return redirect('/asdfasdfasgafgdghfdghfhfghfdghfdghfdghfdghaghadfhhfhahfddhdfhafhsd/'+testname)


@route('/asdfasdfasgafgdghfdghfhfghfdghfdghfdghfdghaghadfhhfhahfddhdfhafhsd/<testname>')
def availsheets(testname):
	client = gspread.authorize(creds)
	spreadsheetanswer = client.open("answerData")
	answersheet = spreadsheetanswer.worksheet(testname)
	submissions = answersheet.get_all_values()
	return template('available_answersheets',{'submissions': submissions})


@post('/asdfasdfasgafgdghfdghfhfghfdghfdghfdghfdghaghadfhhfhahfddhdfhafhsd/<testname>')
def clickname(testname):
	studcode = list(request.forms.values())[0]
	return redirect('/oasjflkjaslkgjlsagkjfdgkjsdfghkjsdfjkgsdjkfghkldsfgkdsfghkldfghldsjfghjksfdkjg/'+testname+'/'+studcode)


@route('/oasjflkjaslkgjlsagkjfdgkjsdfghkjsdfjkgsdjkfghkldsfgkdsfghkldfghldsjfghjksfdkjg/<testname>/<studcode>')
def displaysheet(studcode,testname):
	print(testname,studcode)
	client = gspread.authorize(creds)
	spreadsheetanswer = client.open("answerData")
	answersheet = spreadsheetanswer.worksheet(testname)
	spreadsheetquestion = client.open("questionData")
	questionpaper = spreadsheetquestion.worksheet(testname)
	questions = questionpaper.get_all_values()
	submissions = answersheet.get_all_values()
	questiondata = []
	markdata = []
	options = []
	print(questions)
	for i in questions:
		questiondata.append(i[2])
		markdata.append(i[7])
		options.append(i[3:7])
	for i in submissions:
		if i[0] == studcode:
			answers = i
			print(i)
	if answers[1].lower() == 'false':
		df = pd.read_excel('static/studentdata.xls')
		tempvar = df.loc[df['Student Code'] == int(studcode)]
		studname = list(tempvar['Student Name'])[0]
		print(studname)
		return template('sheet_evaluation_page',{'answers' : answers,'questions' : questiondata, 'markdata':markdata, 'options':options,'testname':testname,'studname':studname})
	else:
		return redirect('/asdfasdfasgafgdghfdghfhfghfdghfdghfdghfdghaghadfhhfhahfddhdfhafhsd/'+testname)

@post('/oasjflkjaslkgjlsagkjfdgkjsdfghkjsdfjkgsdjkfghkldsfgkdsfghkldfghldsjfghjksfdkjg/<testname>/<studcode>')
def saveresult(testname,studcode):
	marks = list(request.forms.values())
	print(marks)
	testname = marks[0]
	marks.pop(0)
	print(testname,studcode)
	client = gspread.authorize(creds)
	spreadsheetresult = client.open("resultData")
	resultsheet = spreadsheetresult.worksheet(testname)
	list_of_lists = resultsheet.get_all_values()
	marks.insert(1,studcode)
	xrange = len(marks)
	total = sum([float(i) for i in marks[2:]])

	marks.append(total)
	cell_list = resultsheet.range(f'A{len(list_of_lists)+1}:{datasheetcolumn[xrange]}{len(list_of_lists)+1}')
	x = 0
	for cell in cell_list:
		cell.value = marks[x]
		x+=1
	resultsheet.update_cells(cell_list)
	spreadsheetanswer = client.open("answerData")
	answersheet = spreadsheetanswer.worksheet(testname)
	cell = answersheet.find(studcode)
	answersheet.update_cell(cell.row, 2, 'True')
	return redirect('/asdfasdfasgafgdghfdghfhfghfdghfdghfdghfdghaghadfhhfhahfddhdfhafhsd/'+testname)



# if __name__ == '__main__':
# 	run(debug=True,reloader=True)



