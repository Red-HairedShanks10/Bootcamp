
var dreamCar = {

    make : "NissanGTR",
    model : "R35",
    color : "silver",
    year : 2009,
    bodyStyle : "SuperCar",
    price : 1300000
}
 

document.getElementById("pricetag").innerHTML = dreamCar.price;
document.getElementById("modelyear").innerHTML = dreamCar.year;
document.getElementById("body").style.backgroundColor = dreamCar.color;
document.getElementById("body").innerHTML = dreamCar.make + " " + dreamCar.model;





