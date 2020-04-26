<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<header>
<div style="background-color:#10e6cd;padding:20px;width:screen.width px;height:90px;align:right;margin-left:0px">
<a href="/teacherpage/fhgbivqhvtyukqhvtruiqhvuijiquyj1iovyhivgjskghwvejjumauiicjijyiofvjgyiogjiy">
<img src='/static/logo.jpg' height="200px" class='center' style="display: block;margin-left: auto;
  margin-right: auto;height: 150px;margin-top:auto;">
</a>
</header>

<style>

.textlabel {
  background-color: #10e6cd;
  border: 2px solid #10e6cd;
  color: #10e6cd;
  background-color: #141414;
  text-align: center;
  display:block;
  font-size: 20px;
  padding: 15px 0px;
  transition-duration: 0.6s;
  cursor: pointer;
  margin-right: auto;
  margin-left: auto;
  width: 40%;
  border-radius: 32px;
  font-family: "Ubuntu", Ubuntu;
}

.button1 {
  background-color: #141414;
  color: #10e6cd;
  border: 2px solid #10e6cd;
}

.button1:hover {
  background-color: #10e6cd ;
  color: #141414;
}


</style>

<script>
		function formSubmit(id)
	{
     document.forms[id].submit()
	}
</script>

<body style="background-color:#141414;height='100%';width='100%'">
<div style="background-color:#141414;width:screen.width px;height:90px;margin-right: auto;margin-left:auto;display: block;margin-top: 90px">
	<%
	import pandas as pd
	df = pd.read_excel('/home/xamforhvf/e-Xam/static/studentdata.xls')
	%>
	% for i in submissions:
	<% tempvar = df.loc[df['Student Code'] == int(i[0])]
	studname = list(tempvar['Student Name'])[0]
	%>
	<div style="background-color: black;width: screen.width;padding-top: 38px">
	<form  name= "{{ i[0] }}" action="#" method="POST">
	<label for = '{{ i[0] }}in' class="textlabel">{{ studname }}</label><input id = "{{ i[0] }}in" name = 'studname' type="hidden" value="{{ i[0] }}"><br>
	% if i[1].lower() == 'true':
	<button onclick="formSubmit('{{ i[0] }}')" class="textlabel button1" style="width: 10%"> DONE! </button><br><br>
	% else:
	<button onclick="formSubmit('{{ i[0] }}')" class="textlabel button1" style="width: 10%"> EVALUATE </button><br><br>
	% end
	</form>
	</div><br><br>
	%end
</div>
</body>
</html>