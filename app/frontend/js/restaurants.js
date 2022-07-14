
let map;

function initMap() {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 22.7196  , lng:  75.8577},
    zoom: 8,
  });
}

window.initMap = initMap;