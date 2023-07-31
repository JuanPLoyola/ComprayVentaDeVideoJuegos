class Localizacion{
    constructor(callback) {
        if(navigator.geolocation){
            navigator.geolocation.getCurrentPosition((position)=>{
                this.latitud =position.coords.latitude;
                this.longitude = position.coords.longitude;

            });
        }else{
            alert("Tu navegador no soporta geolocalizacion")
        }
    }
}