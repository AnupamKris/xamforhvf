<!DOCTYPE html>
<html>
<head>
  <title>
  </title>
</head>
<header>
<div  style="position: absolute;right:0;top:0;background-color:#10e6cd;padding:20px;width:100%;height:90px;align:right;margin-left:0px;">
<a href="/studentpage">
<img src='/static/logo.jpg' height="200px" class='center' style="margin-left: 37.5%;height: 150px;margin-top:auto;">
</a>
</header>
<style>
  .textlabel {
    background-color: #10e6cd;
    border: 2px solid #10e6cd;
    color: #10e6cd;
    background-color: #141414;
    text-align: center;
    font-size: 24px;
    padding: 10px 10px;
    transition-duration: 0.6s;
    cursor: pointer;
    border-radius: 32px;
    font-family: "Ubuntu", Ubuntu;
    width: 25%
  }

  .tnme{
    font-size: 24px;
    font-family: "Ubuntu", Ubuntu;
    border-radius: 32px;
    width:80%;
    height:50px;
    background-color: #141414;
    color: #10e6cd;
    border: 2px solid #10e6cd;
    padding: 10px 10px 10px 10px;


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

  #answerbox {
    font-size: 24px;
    font-family: "Ubuntu", Ubuntu;
    border-radius: 32px;
    width:80%;
    height:150px;
    background-color: white;
    color: black;
    border: 2px solid #10e6cd;
    padding: 10px 10px 10px 10px;

  }

  #myDIV {
    width: 100%;
    padding-top: 20px;
    padding-bottom: 20px;
    text-align: center;
    background-color: #202020;
    margin-top: 40px
  }

  #questionbox {
    font-size: 24px;
    font-family: "Ubuntu", Ubuntu;
    border-radius: 32px;
    width:80%;
    height: 150px;
    background-color:#141414;
    color: white;
    border: 2px solid #10e6cd;
    padding: 10px 10px 10px 10px;
    margin-top: 20px


  }

  #optbox{
    font-size: 24px;
    width:37%;
    height: 80px;
    background-color:#141414;
    color: white;
    border: 2px solid #10e6cd;
    border-radius: 32px;
    padding: 10px 10px 10px 10px

  }



</style>

<body style="background-color:#141414;height='100%';width='100%';margin-top: 100px">
<div style="background-color:#141414;padding:20px;width:screen.width px;height:90px;margin-right: auto;margin-left:auto;display: block;margin-top: 90px">

  <form action="#" method="POST">
  <input style='display: block;width: 20%;margin-left: 39%;text-align: center;background-color: #10e6cd;color: black;margin-top: 180px' type="text"  value = "{{ testname }}" readonly class="tnme"><br><br>
  <input style='display: block;width: 20%;margin-left: 39%;text-align: center;background-color: #10e6cd;color: black' type="text"  value = "{{ studname }}" readonly class="tnme"><br><br>
  % q = 1
  % print(marks)
  % for i in answers[2:]:
  <div id='myDIV'>
  <textarea disabled id="questionbox">Question : {{ questions[q-1] }}</textarea><br>
  % if options[q-1][0] != '':
  <textarea disabled id='optbox'>(A): {{ options[q-1][0] }}</textarea>
    <textarea disabled id='optbox' >(C): {{ options[q-1][2] }}</textarea><br>
    <textarea disabled id='optbox' >(B): {{ options[q-1][1] }}</textarea>
    <textarea disabled id='optbox' >(D): {{ options[q-1][3] }}</textarea><br><br><br>
  % end
  <textarea disabled id='optbox' style="background-color:#10e6cd;color: black">Your Answer : {{ i }}</textarea>
  <textarea disabled id='optbox' style="background-color:#10e6cd;color: black">Marks secured: {{ marks[q-1] }} out of {{ markdata[q-1] }}</textarea><br><br>
  </div>
  % q+=1
  % end

  <div id="myDIV">
    <textarea disabled id='optbox' style="text-align: center;">Grand Total: {{ float(total) }} out of {{ sum([float(i) for i in markdata]) }} </textarea>
  </div>
  </form>
</div>
</body>
</html>