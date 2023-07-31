function iniciarMap(){
    var coord = {lat:-34.5956145 ,lng: -58.4431949};
    var map = new google.maps.Map(document.getElementById('map'),{
        zoom: 10,
        center: coord
    });
    var marker = new google.maps.Marker({
        position: coord,
        map: map
    });

    const autocomplete = document.getElementById('autocomplete');

    const searchOptions = {
        types: ["address"],
        componentRestrictions: { country: "pe" },
    };

    const searchBox = new google.maps.places.SearchBox(input, searchOptions);

    searchBox.addListener("places_changed", function () {
        const places = searchBox.getPlaces();

        if (places.length === 0) {
            return;
        }

        const place = places[0];

        // Centra el mapa en la ubicación seleccionada
        map.setCenter(place.geometry.location);
        map.setZoom(15);

        // Actualiza la posición del marcador en la ubicación seleccionada
        marker.setPosition(place.geometry.location);
        updateMarkerPosition(place.geometry.location);
    });
}