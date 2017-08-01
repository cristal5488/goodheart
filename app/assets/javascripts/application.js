// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

function initMap() {
  geolocate();

  var map = document.getElementById('map');
  if (map === null) return;

  var directionsDisplay = new google.maps.DirectionsRenderer;
  var directionsService = new google.maps.DirectionsService;
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 7,
    center: {lat: 41.85, lng: -87.65}
  });
  directionsDisplay.setMap(map);
  directionsDisplay.setPanel(document.getElementById('right-panel'));

  // var control = document.getElementById('floating-panel');
  // control.style.display = 'block';
  // map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);

  var onChangeHandler = function() {
    calculateAndDisplayRoute(directionsService, directionsDisplay);
  };
  // document.getElementById('start').addEventListener('change', onChangeHandler);
  // document.getElementById('end').addEventListener('change', onChangeHandler);

  if (navigator.geolocation) { //Checks if browser supports geolocation
     navigator.geolocation.getCurrentPosition(function (position) {                                                              //This gets the
       var latitude = position.coords.latitude;                    //users current
       var longitude = position.coords.longitude;                 //location
       var coords = new google.maps.LatLng(latitude, longitude); //Creates variable for map coordinates
       var directionsService = new google.maps.DirectionsService();
       var directionsDisplay = new google.maps.DirectionsRenderer();
       var address = document.getElementById('address').textContent;


       console.log(address);

       var mapOptions = //Sets map options
       {
         zoom: 15,  //Sets zoom level (0-21)
         center: coords, //zoom in on users location
         mapTypeControl: true, //allows you to select map type eg. map or satellite
         navigationControlOptions:
         {
           style: google.maps.NavigationControlStyle.SMALL //sets map controls size eg. zoom
         },
         mapTypeId: google.maps.MapTypeId.ROADMAP //sets type of map Options:ROADMAP, SATELLITE, HYBRID, TERRIAN
       };

       map = new google.maps.Map( /*creates Map variable*/ document.getElementById("map"), mapOptions /*Creates a new map using the passed optional parameters in the mapOptions parameter.*/);
       directionsDisplay.setMap(map);
       directionsDisplay.setPanel(document.getElementById('panel'));
       var request = {
         origin: coords,
         destination: address,
         travelMode: google.maps.DirectionsTravelMode.DRIVING
       };

       directionsService.route(request, function (response, status) {
         if (status == google.maps.DirectionsStatus.OK) {
           directionsDisplay.setDirections(response);


         }
       });
     });
   }

}

function calculateAndDisplayRoute(directionsService, directionsDisplay) {
  var start = document.getElementById('start').value;
  var end = document.getElementById('end').value;
  directionsService.route({
    origin: start,
    destination: end,
    travelMode: 'DRIVING'
  }, function(response, status) {
    if (status === 'OK') {
      directionsDisplay.setDirections(response);
    } else {
      window.alert('Directions request failed due to ' + status);
    }
  });
}

function geolocate() {
  var addressElement = document.getElementById('address');
  if (addressElement === null) return;

  if (navigator.geolocation) { //Checks if browser supports geolocation
     navigator.geolocation.getCurrentPosition(function (position) {                                                              //This gets the
       var latitude = position.coords.latitude;                    //users current
       var longitude = position.coords.longitude;                 //location
       var coords = new google.maps.LatLng(latitude, longitude); //Creates variable for map coordinates
       var directionsService = new google.maps.DirectionsService();
       var directionsDisplay = new google.maps.DirectionsRenderer();
       var address = addressElement.textContent;

       var mapOptions = //Sets map options
       {
         zoom: 15,  //Sets zoom level (0-21)
         center: coords, //zoom in on users location
         mapTypeControl: true, //allows you to select map type eg. map or satellite
         navigationControlOptions:
         {
           style: google.maps.NavigationControlStyle.SMALL //sets map controls size eg. zoom
         },
         mapTypeId: google.maps.MapTypeId.ROADMAP //sets type of map Options:ROADMAP, SATELLITE, HYBRID, TERRIAN
       };

       map = new google.maps.Map( /*creates Map variable*/ document.getElementById("map"), mapOptions /*Creates a new map using the passed optional parameters in the mapOptions parameter.*/);
       directionsDisplay.setMap(map);
       directionsDisplay.setPanel(document.getElementById('panel'));
       var request = {
         origin: coords,
         destination: address,
         travelMode: google.maps.DirectionsTravelMode.DRIVING
       };

       directionsService.route(request, function (response, status) {
         if (status == google.maps.DirectionsStatus.OK) {
           directionsDisplay.setDirections(response);


         }
       });
     });
   }
}
