// create days of week array
var days = ["Monday", "Tuesday", "Wednesday", "Thursday",
    "Friday"
];
// define types of weather
var weather = ["Sunny", "Partly Sunny", "Partly Cloudy",
    "Cloudy", "Raining", "Snowing", "Thunderstorm",
    "Foggy"
];

// set min and max temps
var maxTemp = 100;
var minTemp = 0;

// cost (to you) of a cup of lemonade
var lemonadeCost = 0.5;

// array for storing daily temps
var dailyTemp = [];

//creating a variable containing  5dayWeather element
var _5dayWeather = document.getElementById("5DayWeather");

//creating variable to access result element in HTML
var result = document.getElementById("result");

// listen for order
document.getElementById("OpenTheStand").addEventListener("click",
openTheStand);

/**
generates weather for the week
**/
function generateWeather() {
    var weatherToday;
    var tempToday;
    for (var i = 0; i < days.length; i++) {
        weatherToday = weather[Math.floor(Math.random() * weather.length)];
        tempToday = Math.floor(Math.random() * (maxTemp - minTemp) + minTemp);
        dailyTemp[i] = tempToday;

         //using 5dayWeather element variable as a short cut to display description of the weather
        _5dayWeather.innerHTML += "<div id='" + days[i] + "' class='" +
        weatherToday + "'><b>Forecast for " + days[i]
        + ":</b><br><br>" + weatherToday + " and " +
        tempToday + " degrees.</div>";
    }

}

// make the week's weather
generateWeather();

/**
calculates glasses of lemonade sold
**/
function openTheStand() {
    var glassesSold = 0; // daily
var totalGlasses = 0; // weekly
var glassesLeft = 0; // left to sell


// clear previous results
resetForm();


// get input
var numGlasses = Number(document.
    getElementById("numGlasses").value);
    var glassPrice = Number(document.
    getElementById("glassPrice").value);
   
    for (var i = 0; i < days.length; i++) {
        // glasses sold depends on temp and price
        glassesSold = Math.floor(dailyTemp[i] /
        glassPrice);
        // how many glasses do we have now?
        glassesLeft = numGlasses - totalGlasses;
        // we can't sell more than we have
        if (glassesSold > glassesLeft) {
        glassesSold = glassesLeft;
        }
        // increase the weekly total
        totalGlasses = glassesSold + totalGlasses;
        // display daily total
        result.innerHTML += "<p>" + days[i] + ", you sold " + glassesSold + " glasses of lemonade.</p>";
       
    }
    displayResults(numGlasses, glassPrice, totalGlasses);

  function  resetForm(){
    result.innerHTML = "";
  }

}

/**
calculates results and displays a report
**/
function displayResults(weeklyInventory, glassPrice, weeklySales){
    var revenue = weeklySales * glassPrice;
    var expense = weeklyInventory * lemonadeCost;
    var leftOver = weeklyInventory - weeklySales;
    var profit = revenue - expense;
 
     result.innerHTML += "<p>You sold a total of " + weeklySales + " glasses of lemonade this week.</p>";
     result.innerHTML += "<p>Total revenue: R" + revenue + ".</p>";
     result.innerHTML += "<p>There is  " +  leftOver + " glasses of lemonade left over.</p>";
     result.innerHTML += "<p>Each glass costs R" + lemonadeCost + ".profit was R" + profit + ".";

     
}