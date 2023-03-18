/*
document.getElementById("lefteye").style.backgroundColor = "purple";


document.getElementById("body").style.border = "3px black solid";

document.getElementById("mouth").style.borderRadius = "50%";

document.getElementById("righteye").style.border = "4px yellow dotted";


//rotating head to the right
document.getElementById("head").style.transform = "rotate(-15deg)";

//turning nose round
document.getElementById("nose").style.borderRadius = "50%";
//turning right arm green
document.getElementById("rightarm").style.backgroundColor = "green";

//turning lips pink
document.getElementById("mouth").style.backgroundColor = "pink";
*/

var righteye = document.getElementById("righteye");
var lefteye = document.getElementById("lefteye");
var lefteye = document.getElementById("lefteye");
var nose = document.getElementById("nose");

righteye.addEventListener("click", moveUpdown);
lefteye.addEventListener("click", moveUpdown);
leftarm.addEventListener("click", moveRightLeft);
nose.addEventListener("click", moveNoseRight);

function moveUpdown(e){
     var robotPart = e.target;
     var top = 0;
     var animation = setInterval(frame,10)

     function frame(){
        robotPart.style.top = top + '%';
        top++;
        if (top === 20) {
            clearInterval(animation);
        }
     }
}

function moveRightLeft(e){
    var robotPart = e.target;
    var _left = 0;
    var animation = setInterval(frame,10)

    function frame(){
        robotPart.style.left = _left + '%';
        _left++;

        if ( _left === 70){
            clearInterval(animation);
        }
    }
}

function moveNoseRight(e){
    var robotPart = e.target;
    var _right = 65;
    var animation = setInterval(frame, 10);

      function frame() {
            robotPart.style.left = _right + '%';
            _right--;

            if ( _right === 45){
                clearInterval(animation);
                nose.style.background = "gold";
            }
        }
}