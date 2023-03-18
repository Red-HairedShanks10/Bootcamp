//document.getElementById("MyName").innerHTML = "Marc";

var item1;
var item2;
var item3;

document.getElementById("Changelist").onclick = newList;

function newList (){
    item1 = prompt("enter new first thing: ");
    item2 = prompt("enter new second thing: ");
    item3 = prompt("enter new third thing: ");
    updateList();
} 

function updateList(){
     document.getElementById("firstThing").innerHTML = item1;
     document.getElementById("secondThing").innerHTML = item2;
     document.getElementById("thirdThing").innerHTML = item3;
}