"use strict";function initialize(){var e=document.getElementById("property_latitude"),o=document.getElementById("property_longitude"),n=[],t=new google.maps.Map(document.getElementById("map-single"),{mapTypeId:google.maps.MapTypeId.ROADMAP,zoom:10}),a=new google.maps.LatLngBounds(new google.maps.LatLng("39","-76"),new google.maps.LatLng("39","-76"));t.fitBounds(a);var g=document.getElementById("pac-input");t.controls[google.maps.ControlPosition.TOP_LEFT].push(g);var i=new google.maps.places.SearchBox(g);google.maps.event.addListener(i,"places_changed",function(){var a=i.getPlaces();if(0!=a.length){for(var g,l=0;g=n[l];l++)g.setMap(null);n=[];for(var s,p=new google.maps.LatLngBounds,l=0;s=a[l];l++){var g=(s.icon,new google.maps.Size(71,71),new google.maps.Point(0,0),new google.maps.Point(17,34),new google.maps.Size(25,25),new google.maps.Marker({map:t,icon:"images/pin.png",title:s.name,position:s.geometry.location,draggable:!0}));e.value=g.position.lat(),o.value=g.position.lng(),n.push(g),p.extend(s.geometry.location),google.maps.event.addListener(g,"drag",function(){e.value=g.position.lat(),o.value=g.position.lng()})}t.fitBounds(p)}}),google.maps.event.addListener(t,"bounds_changed",function(){var e=t.getBounds();i.setBounds(e)}),$(".form-next").on("click",function(){google.maps.event.trigger(t,"resize")}),$(".form-prev").on("click",function(){google.maps.event.trigger(t,"resize")})}google.maps.event.addDomListener(window,"load",initialize);