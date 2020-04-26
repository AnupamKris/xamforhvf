<!DOCTYPE html>
<html>
<head>
    <title>
    </title>
</head>
<header>
<div  style="position: absolute;right:0;top:0;background-color:#10e6cd;padding:20px;width:100%;height:90px;align:right;margin-left:0px;">
<img src='/static/logo.jpg' height="200px" class='center' style="margin-left: 37.5%;height: 150px;margin-top:auto;">
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



#qimg{
        max-width: 100%;
        max-height: 100%;

    }
    .box{
        width: 100%;
        height: 250px;
        border-radius: 32px;
        text-align: center;
        display: block;
    }



</style>
<body style="background-color:#141414;height='100%';width='100%';margin-top: 100px">
<script>
function submitalert() {
  if (confirm("Are you Sure?")) {
    document.forms['marksheet'].submit();
  } else {}
}
</script>

<div   style="background-color:#141414;padding:20px;width:screen.width px;height:90px;margin-right: auto;margin-left:auto;display: block;margin-top: 90px">
    <form action="#" method="POST" id="marksheet">
    <input style='display: block;width: 20%;margin-left: 39%;text-align: center;background-color: #10e6cd;color: black;margin-top: 180px' type="text" name="testname" value = "{{ testname }}" readonly class="tnme"><br><br>
    <input style='display: block;width: 20%;margin-left: 39%;text-align: center;background-color: #10e6cd;color: black' type="text"  value = "{{ studname }}" name="studname" readonly class="tnme"><br><br>
    % print(imgDic)
    % q = 1
    % print(answers[2:])
    % for i in answers[2:]:
    <div id='myDIV'>
    <textarea disabled id="questionbox">Question : {{ questions[q-1] }}</textarea><br><br><br>
    % if imgDic[q] != '':
    <div class='box'><img id='qimg' src={{imgDic[q]}}></div><br><br>
    %end
    % if options[q-1][0] != '':
    <textarea disabled id='optbox'>(A): {{ options[q-1][0] }}</textarea>
    <textarea disabled id='optbox' >(C): {{ options[q-1][2] }}</textarea><br>
    <textarea disabled id='optbox' >(B): {{ options[q-1][1] }}</textarea>
    <textarea disabled id='optbox' >(D): {{ options[q-1][3] }}</textarea><br><br><br>
    % end
    <textarea disabled id="questionbox">Answer : {{ i }}</textarea><br><br>
    <textarea disabled id="questionbox" style='width:20%;height:30px;background-color:#10e6cd;color: black '>Total Marks : {{ markdata[q-1] }}</textarea><br><br>
    <label class="textlabel" style="background-color:#10e6cd;color: black">Enter the Marks:</label>
    <input class='textlabel' type="number" step = "0.5" name="question{{ q }}" value = "0" min = "0" max = "{{ markdata[q-1] }}"><br><br>
    </div>
    % q+=1
    % end
    </form>
    <div id='myDIV'>
    <button onclick="submitalert()" class = "textlabel button1" style="width: 10%">Submit!</button>
    <div>
</div>
</body>
</html>