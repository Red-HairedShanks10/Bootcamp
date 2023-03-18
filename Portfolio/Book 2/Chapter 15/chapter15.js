'use strict';

var todayDate = document.getElementById("todaysdate");
var todoButton = document.getElementById("whattodo");
// add a listener to the whattodo button
todoButton.addEventListener("click", displayActivity);

// create a new Date object
var d = new Date();
// call the displayDate() function
displayDate();
function displayDate() {
// todo: display the current date in the todaysdate
 todayDate.innerHTML = d.toDateString();

}
function displayActivity() {
// todo: find out the day of the week
var dayofWeek = d.getDay();

/* todo: set a variable, called youShould, with a
different string based on what day of the
week it is. */
var youShould;

switch (dayofWeek){
    case 0 :
            youShould = "Prepare for the week " ;
    break;

    case 1: 
         youShould = "Go to the gym "  ;
    break;

    case 2:
          youShould = "Do Dance lessons " ;
    break;

    case 3: 
              youShould = "Javascript and Chill";
    break;

    case 4: 
       youShould = "Attend EPL";
    break;

    case 5:
         youShould = " Do Dance lessons" ;
    break;

    case 6: 
       youShould = "Football Practice session";
    break;
  
    default:
        youShould = "never heard of that one";
        break;

}
// todo: output the value of youShould into the thingToDo div
document.getElementById("thingToDo").innerHTML =
youShould;

}