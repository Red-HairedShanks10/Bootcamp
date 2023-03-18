var trainSpeed = 250;

var trainPosition = 0;
var animation;



var train = document.getElementById("train");
train.addEventListener("click", speedUp);

var stopButton = document.getElementById("stopButton");
stopButton.addEventListener("click", stopTrain);

var tracklength = document.getElementById("track");

function speedUp() {


    if (trainSpeed > 10) {
        trainSpeed -= 10;
    }

    clearInterval(animation);
    animation = setInterval(frame, trainSpeed);

    function frame() {
        /*
        todo: Reposition the train and check whether the
        train is crashed.
        */

        trainPosition += 2;
        train.style.left = trainPosition + 'px';
        checkPosition(trainPosition);



    }
}

function stopTrain() {
    /*
    todo: Test whether the train is already crashed. If
    not, stop the train.
    */
    if (trainPosition < 260) {
        clearInterval(animation);
    }

}

function checkPosition(currentPosition) {
    /*
    todo: Check the train's current position and crash it
    if it's at the end of the line.
    */
    if (currentPosition === 260) {
        alert("Crash!");
        console.log("Crash!");
        clearInterval(animation);
    }

}

        