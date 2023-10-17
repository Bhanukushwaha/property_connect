//= require admin/js/core/jquery.min
//= require admin/js/core/popper.min
//= require admin/js/core/bootstrap-material-design.min
//= require admin/js/plugins/perfect-scrollbar.jquery.min
//= require admin/js/plugins/chartist.min
//= require admin/js/plugins/bootstrap-notify
//= require admin/js/material-dashboard
//= require admin/demo/demo
//= require admin/index.umd
//= require admin/buttons
//= require jquery
//= require jquery_ujs
function initMap() {alert("ok");}

$(document).ready(function () {
  var input = document.getElementById('address-input');
  var options = {
    types: ['geocode'],
  };

  var autocomplete = new google.maps.places.Autocomplete(input, options);
});