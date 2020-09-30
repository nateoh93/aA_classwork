import React from "react";

class Weather extends React.Component {
    constructor() {
        super();
        this.weatherAccessor = this.weatherAccessor.bind(this);
        this.getTemp = this.getTemp.bind(this);
        this.getClouds = this.getClouds.bind(this);
    }

    componentDidMount() {
        navigator.geolocation.getCurrentPosition(this.weatherAccessor);
    }

    weatherAccessor(location) {
     
        // console.log(location);

        let latitude = location.coords.latitude;
        let longitude = location.coords.longitude;

        let request = new XMLHttpRequest();
        
        request.open('GET', `http://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=e43f7b9c4ac203360f36341552bb0af7`, true);
        // delete from git just in case!


        request.onload = () => {
          if (this.status >= 200 && this.status < 400) {
            // Success!
            let data = JSON.parse(this.response);
            this.temp = data.main.temp;
            this.clouds = data.weather.main;
            this.city = data.name;
        } else {
            // We reached our target server, but it returned an error
        
          }
        };
        
        request.onerror = function() {
          // There was a connection error of some sort
        };
        
        request.send();

    }

    render() {
        return (
            <div>
            </div>
          
        );
    }
}

export default Weather;