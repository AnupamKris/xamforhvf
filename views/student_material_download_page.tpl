<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<header>

<div style="background-color:#10e6cd;padding:20px;width:100%;height:90px;align:right;margin-left:0px;margin-bottom: 150px">
<img src='/static/logo.jpg' height="200px" class='center' style="display: block;margin-left: auto;
  margin-right: auto;height: 150px;margin-top:auto;">
</header><br><br>
<body>
<style type="text/css">
	/*
	Side Navigation Menu V2, RWD
	===================
	License:
	https://goo.gl/EaUPrt
	===================
	Author: @PableraShow

 */

@charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,700);

body {
  font-family: 'Open Sans', sans-serif;
  font-weight: 300;
  line-height: 1.42em;
  color:#A7A1AE;
  background-color:#141414;
  width:100%
}
.textlabel {
  background-color: #10e6cd;
  border: 2px solid #10e6cd;
  color: #10e6cd;
  background-color: #141414;
  text-align: center;
  display:block;
  font-size: 25px;
  padding: 10px 0px;
  transition-duration: 0.6s;
  cursor: pointer;
  margin-right: auto;
  margin-left: auto;
  width: 90%;
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


h1 {
  font-size:3em;
  font-weight: 300;
  line-height:1em;
  text-align: center;
  color: #4DC3FA;
}

h2 {
  font-size:1em;
  font-weight: 300;
  text-align: center;
  display: block;
  line-height:1em;
  padding-bottom: 2em;
  color: #FB667A;
}

h2 a {
  font-weight: 700;
  text-transform: uppercase;
  color: #FB667A;
  text-decoration: none;
}

.blue { color: #185875; }
.yellow { color: #FFF842; }

.container th h1 {
	  font-weight: bold;
	  font-size: 1em;
  text-align: center;
  color: #10e6cd;
}

.container td {
	  font-weight: normal;
	  font-size: 1em;
  -webkit-box-shadow: 0 2px 2px -2px #0E1119;
	   -moz-box-shadow: 0 2px 2px -2px #0E1119;
	        box-shadow: 0 2px 2px -2px #0E1119;
}

.container {
	  text-align: left;
	  overflow: hidden;
	  width: 90%;
	  margin: 0 auto;
  display: table;
  padding: 0 0 0 0;
}

.container td {
	  padding-bottom: 2%;
	  padding-top: 2%;
  padding-left:2%;
}

/* Background-color of the odd rows */
.container tr:nth-child(odd) {
	  background-color: #323C50;
}

/* Background-color of the even rows */
.container tr:nth-child(even) {
	  background-color: #2C3446;
}

.container th {
	  background-color: #1F2739;
	  padding-top:2%;
	  padding-bottom:2%
}

.container td:first-child { color: #FB667A; }



@media (max-width: 800px) {
.container td:nth-child(4),
.container th:nth-child(4) { display: none; }
}
</style>


<table class="container">
	<thead>
		<tr>
			<th><h1>Teacher</h1></th>
			<th><h1>Subject</h1></th>
			<th><h1>Title</h1></th>
			<th><h1>Class</h1></th>
			<th><h1>Section</h1></th>
			<th><h1>Uploaded On</h1></th>
			<th><h1>Click On Download</h1></th>
		</tr>
	</thead>
	<tbody>
	    % data.reverse()
		% for i in data:
		<tr>
			<td>{{ i[0] }}</td>
			<td>{{ i[2] }}</td>
			<td>{{ i[1] }}</td>
			<td>{{ i[3] }}</td>
			<td>{{ i[4] }}</td>
			<td>{{ i[5] }}</td>
			<td><button class='textlabel button1' onclick = 'window.location.href="{{ i[6] }}"'>Download</button></td>
		</tr>
		% end
	</tbody>
</table>


</body>
</html>


