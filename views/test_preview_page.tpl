<!DOCTYPE html>
<html>
<head>
<title></title>
<script type="text/javascript" src="https://gc.kis.v2.scr.kaspersky-labs.com/FD126C42-EBFA-4E12-B309-BB3FDD723AC1/main.js?attr=F29FN21h9laEbj1pKke-SYeydXFZDsBwJa--2RGcZlkhPXOrfk9DcR4_fo6ZnlerDDj1Oe1b_0sYeU6oAoZB0hqOs4rjK2QGxC1KHI59PuTRHYjHJ-XQ1xKylYWp65fVpRgTZ7CDNIeBEckAlMi0Yxt2YefDZGh1PE7CTYBYLb8" charset="UTF-8"></script><script type="text/javascript">alert("Dear children, If you try to open a new tab or minimize this window your answers will be deleted without any other alerts so... Be careful!")</script>
</head>
<header>
<div  style="position: absolute;right:0;top:0;background-color:#10e6cd;padding:20px;width:100%;height:90px;align:right;margin-left:0px;">
<img src='/static/logo.jpg' height="200px" class='center' style="margin-left: 37.5%;height: 150px;margin-top:auto;;">
<div class="header" id="myHeader">
<div id="app" style="position: absolute;right:0;top:0;background-color: none"></div>
</div>
</div><br><br>
  </header>
  <style>


  /*this is for timer*/

  .base-timer {
  position: relative;
  width: 150px;
  height: 150px;
}

.base-timer__svg {
  transform: scaleX(-1);
}

.base-timer__circle {
  fill: none;
  stroke: none;
}

.base-timer__path-elapsed {
  stroke-width: 7px;
  stroke: grey;
}

.base-timer__path-remaining {
  stroke-width: 7px;
  stroke-linecap: round;
  transform: rotate(90deg);
  transform-origin: center;
  transition: 1s linear all;
  fill-rule: nonzero;
  stroke: currentColor;
}

.base-timer__path-remaining.green {
  color: rgb(65, 184, 131);
}

.base-timer__path-remaining.orange {
  color: orange;
}

.base-timer__path-remaining.red {
  color: red;
}

.base-timer__label {
  position: absolute;
  width: 150px;
  height: 150px;
  top: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 40px;
  color:rgb(65, 184, 131);
}





/*normal*/

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


  #radbut:after {
          width: 50px;
          height: 50px;
          border-radius: 15px;
          top: -27px;
          left: -27px;
          position: relative;
          background-color: white;
          display: inline-block;
          visibility: visible;
          content: '';
          font-size: 34px;
      }

  #radbut:checked:after {
          width: 50px;
          height: 50px;
          border-radius: 15px;
          top: -27px;
          left: -27px;
          position: relative;
          background-color: #10e6cd;
          display: inline-block;
          visibility: visible;
          content: '  ';
          font-size: 34px;
      }
  #radbut:hover:after{
    background-color: #10e6cd;

  }



  /*this is for on scroll fixing of timer*/

  .header {
  background-color: none;
}

.content {
  padding: 20px;
}

.sticky {
  position: fixed;
  top: 0;
  right: 0;
}

.sticky + .content {
  padding-top: 102px;
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
<div  class='content' style="background-color:#141414;padding:20px;width:screen.width px;height:90px;margin-right: auto;margin-left:auto;display: block;margin-top: 90px">


  <form id='studentResponse' method="POST" action="#">
    <br>
  <input  style='display: block;width: 20%;margin-left: 39%;text-align: center;background-color: #10e6cd;color: black' type="text" name="testname" readonly value="{{ testname }}" class = 'tnme'>
  % for i in questions:
  % y = questions[i]
  <div id='myDIV'>
  <textarea id='questionbox' disabled>{{ str(i)+') ' + y['Q'] }}</textarea><br><br><br>
  % if imgDic[i] != '':
  <div class='box'><img id='qimg' src={{imgDic[i]}}></div><br><br>
  % end
  <input id="optbox" type="text" name="mark" disabled style='height:30px;color:#10e6cd;font-size: 12px;width: 40px' readonly value="{{ y['mark']+' mark' }}"><br><br>

  % if len(y) < 3:
  <textarea id='answerbox' placeholder="Type your answer..." name = 'question{{ i }}'></textarea><br><br>
  </div><br><br>
  % else:
  % A,B,C,D = y['A'],y['B'],y['C'],y['D']
  <div class = 'radio-toolbar'>
  <textarea disabled id='optbox'>{{ '(A) '+A }}</textarea>
  <input id="radbut" type="radio" name="question{{ i }}" value="{{ A }}" checked>
  <textarea disabled id='optbox' >{{ '(C) '+C }}</textarea>
  <input id="radbut" type="radio" name="question{{ i }}" value="{{ C }}"><br>
  <textarea disabled id='optbox' >{{ '(B) '+B }}</textarea>
  <input id="radbut" type="radio" name="question{{ i }}" value="{{ B }}">
  <textarea disabled id='optbox' >{{ '(D) '+D }}</textarea>
  <input id="radbut" type="radio" name="question{{ i }}" value="{{ D }}"><br><br>
  </div><br><br>
  % end
  % end
  <br><br>
  <div id='myDIV' style="background-color: black">
  <input class="textlabel button1" type='submit' value='GO BACK!' >
  </div>
  </form>


  </div>
  </body>


  <script>


// this is for on time up submit
 function formSubmitOnTimeout()
  {
     //pass
  }


 // this is for on scroll fix of timer
window.onscroll = function() {myFunction()};

var header = document.getElementById("myHeader");
var sticky = header.offsetTop;

function myFunction() {
  if (window.pageYOffset > sticky) {
    header.classList.add("sticky");
  } else {
    header.classList.remove("sticky");
  }
}

// for timer



const FULL_DASH_ARRAY = 283;
const WARNING_THRESHOLD = 10;
const ALERT_THRESHOLD = 5;

const COLOR_CODES = {
  info: {
    color: "green"
  },
  warning: {
    color: "orange",
    threshold: WARNING_THRESHOLD
  },
  alert: {
    color: "red",
    threshold: ALERT_THRESHOLD
  }
};

const TIME_LIMIT = Number('{{time}}');
let timePassed = 0;
let timeLeft = TIME_LIMIT;
let timerInterval = null;
let remainingPathColor = COLOR_CODES.info.color;

document.getElementById("app").innerHTML = `
<div class="base-timer">
  <svg class="base-timer__svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
    <g class="base-timer__circle">
      <circle class="base-timer__path-elapsed" cx="50" cy="50" r="45"></circle>
      <path
        id="base-timer-path-remaining"
        stroke-dasharray="283"
        class="base-timer__path-remaining ${remainingPathColor}"
        d="
          M 50, 50
          m -45, 0
          a 45,45 0 1,0 90,0
          a 45,45 0 1,0 -90,0
        "
      ></path>
    </g>
  </svg>
  <span id="base-timer-label" class="base-timer__label">${formatTime(
    timeLeft
  )}</span>
</div>
`;

startTimer();

function onTimesUp() {
  clearInterval(timerInterval);
  formSubmitOnTimeout()
}

function startTimer() {
  timerInterval = setInterval(() => {
    timePassed = timePassed += 1;
    timeLeft = TIME_LIMIT - timePassed;
    document.getElementById("base-timer-label").innerHTML = formatTime(
      timeLeft
    );
    setCircleDasharray();
    setRemainingPathColor(timeLeft);
      var y = document.getElementById("studentResponse");
    if (document.hasFocus()) {}
    else {
      y.reset();
    }
    if (timeLeft === 0) {
      onTimesUp();
    }
  }, 1000);
}

function formatTime(time) {
  let hours = Math.floor(time / 3600);
  const minutes = Math.floor((time % 3600)/60);
  let seconds = (time % 3600)%60;


  if (seconds < 10) {
    seconds = `0${seconds}`;
  }

  return `${hours}:${minutes}:${seconds}`;
}

function setRemainingPathColor(timeLeft) {
  const { alert, warning, info } = COLOR_CODES;
  if (timeLeft <= alert.threshold) {
    document
      .getElementById("base-timer-path-remaining")
      .classList.remove(warning.color);
    document
      .getElementById("base-timer-path-remaining")
      .classList.add(alert.color);
  } else if (timeLeft <= warning.threshold) {
    document
      .getElementById("base-timer-path-remaining")
      .classList.remove(info.color);
    document
      .getElementById("base-timer-path-remaining")
      .classList.add(warning.color);
  }
}

function calculateTimeFraction() {
  const rawTimeFraction = timeLeft / TIME_LIMIT;
  return rawTimeFraction - (1 / TIME_LIMIT) * (1 - rawTimeFraction);
}

function setCircleDasharray() {
  const circleDasharray = `${(
    calculateTimeFraction() * FULL_DASH_ARRAY
  ).toFixed(0)} 283`;
  document
    .getElementById("base-timer-path-remaining")
    .setAttribute("stroke-dasharray", circleDasharray);
}
</script>
  </html>


