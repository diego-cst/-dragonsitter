function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var dragonAddress = document.getElementById('address');

    if (dragonAddress) {
      var autocomplete = new google.maps.places.Autocomplete(dragonAddress,
        { types: [ 'geocode' ] });
      google.maps.event.addDomListener(dragonAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
