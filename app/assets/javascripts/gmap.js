$(function() {

  function gmap_show(place) {
    if ((place.lat == null) || (place.lng == null) ) {    // validation check if coordinates are there
      standardMap();
    } else {
      MapWithMarkers(place);
    }
  }

  function gmap_index(places) {
    if (places == null) {
      standardMap();
    } else {
      handler = Gmaps.build('Google');
      handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
        markers_array = []
        for (i = 0; i < places.length; i++) {
          if ((places[i].lat != null) && (places[i].lng != null) ) {
            markers_array.push(markerParams(places[i]))
          }
        }
        markers = handler.addMarkers(markers_array);
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
        handler.getMap().setZoom(6);
      });
    }
  }

  function gmap_form(place) {
    if (place && place.lat && place.lng) {
      handler = MapWithMarkers(place);
    } else {
      standardMap();
    }

    var markerOnMap;

    function placeMarker(location) {
      if (markerOnMap) {
        markerOnMap.setPosition(location);
      }
      else {
        markerOnMap = new google.maps.Marker({
          position: location,
          map: handler.getMap()
        });
      }
    }

    google.maps.event.addListener(handler.getMap(), 'click', function(event) {    // event for click-put marker on map and pass coordinates to hidden fields in form
      placeMarker(event.latLng);
      document.getElementById("map_lat").value = event.latLng.lat();
      document.getElementById("map_lng").value = event.latLng.lng();
    });
  }

  function standardMap(){
    handler = Gmaps.build('Google');
    handler.buildMap({ internal: {id: 'map' }});
    handler.map.centerOn([52.16, 20.94]);
    handler.getMap().setZoom(6);
    return handler;
  }

  function MapWithMarkers(place){
    handler = Gmaps.build('Google');    // map init
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
      markers = handler.addMarkers([markerParams(place)]);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(12);
    });
    return handler;
  }

  function markerParams(place) {
    return {
      "lat": place.lat,
      "lng": place.lng,
      "infowindow": "nazwa: <b>" + place.name + "</b><br />rodzaj: <b>" + place.place_type + "</b><br />"
    }
  }

  if (typeof app.vars.place !== 'undefined') {
    gmap_show(JSON.parse(app.vars.place));
  }
  if (typeof app.vars.places !== 'undefined') {
    gmap_index(JSON.parse(app.vars.places));
  }
  if (typeof app.vars.placeForm !== 'undefined') {
    gmap_form(JSON.parse(app.vars.placeForm));
  }
});