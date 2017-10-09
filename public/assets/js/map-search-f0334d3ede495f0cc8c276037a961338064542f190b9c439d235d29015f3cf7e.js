
                     "use strict"; 

                    function initialize() {

                      var latInput = document.getElementById('property_latitude');
                      var lngInput = document.getElementById('property_longitude');
                      var markers = [];
                      var map = new google.maps.Map(document.getElementById('map-single'), {
                        mapTypeId: google.maps.MapTypeId.ROADMAP,
                        zoom: 10
                      });

                        var defaultBounds = new google.maps.LatLngBounds(
                          new google.maps.LatLng('39', '-76'),
                          new google.maps.LatLng('39', '-76'));
                        map.fitBounds(defaultBounds);

                      // Create the search box and link it to the UI element.
                      var input = /** @type {HTMLInputElement} */(
                          document.getElementById('pac-input'));
                      map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

                      var searchBox = new google.maps.places.SearchBox(
                        /** @type {HTMLInputElement} */(input));

                      // Listen for the event fired when the user selects an item from the
                      // pick list. Retrieve the matching places for that item.
                      google.maps.event.addListener(searchBox, 'places_changed', function() {

                        var markerDefault = null;

                        var places = searchBox.getPlaces();

                        if (places.length == 0) {
                          return;
                        }
                        for (var i = 0, marker; marker = markers[i]; i++) {
                          marker.setMap(null);
                        }

                        // For each place, get the icon, place name, and location.
                        markers = [];
                        var bounds = new google.maps.LatLngBounds();
                        for (var i = 0, place; place = places[i]; i++) {
                          var image = {
                            url: place.icon,
                            size: new google.maps.Size(71, 71),
                            origin: new google.maps.Point(0, 0),
                            anchor: new google.maps.Point(17, 34),
                            scaledSize: new google.maps.Size(25, 25)
                          };

                          // Create a marker for each place.
                          var marker = new google.maps.Marker({
                            map: map,
                            icon: 'images/pin.png',
                            title: place.name,
                            position: place.geometry.location,
                            draggable:true
                          });

                          //update lat and lng input fields
                          latInput.value = marker.position.lat();
                          lngInput.value = marker.position.lng();

                          markers.push(marker);

                          bounds.extend(place.geometry.location);

                          //update marker position on drag
                            google.maps.event.addListener(
                                marker,
                                'drag',
                                function() {
                                    latInput.value = marker.position.lat();
                                    lngInput.value = marker.position.lng();
                                }
                            );
                        }

                        map.fitBounds(bounds);
                      });

                      // Bias the SearchBox results towards places that are within the bounds of the
                      // current map's viewport.
                      google.maps.event.addListener(map, 'bounds_changed', function() {
                        var bounds = map.getBounds();
                        searchBox.setBounds(bounds);
                      });

                      $('.form-next').on('click', function(){
                        google.maps.event.trigger(map, 'resize');
                      });

                      $('.form-prev').on('click', function(){
                        google.maps.event.trigger(map, 'resize');
                      });

                    }

                    google.maps.event.addDomListener(window, 'load', initialize);

