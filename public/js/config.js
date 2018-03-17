app.constant('APP_API_URL', 'http://localhost:8000/api/');
app.constant('DEVELOPMENT_ENVIRONMENT', true);
app.constant('GMAP_KEY', 'AIzaSyDSdD9RHz1vrCg7zHc03_JeYkblx1KiJiE');

app.config(['$locationProvider', function($locationProvider) {
  $locationProvider.hashPrefix('');
  $locationProvider.html5Mode(false);
}]);

app.config(['$qProvider', function ($qProvider) {
  $qProvider.errorOnUnhandledRejections(false);
}]);


app.config(['$httpProvider', function($httpProvider){
  $httpProvider.interceptors.push(['$q', 'SecurityService', '$location', function($q, SecurityService, $location) {
    return {
      'request': function(config) {
        // SecurityService.secureRequest(config);
        console.log("requesting...");
        console.log(config)
        return config;
      },

      'response': function(response) {        
        /*if(response.data.status == false){ //Gn7 Apis will return false just when token send invalid...
          console.log("NO SE ENCONTRO AUTORIZACION...");
          $location.url("/login");
        } */       
        console.log("response...");
        return response;
      },

     'responseError': function(rejection) {
        return $q.reject(rejection);
      }
    };
  }]);
}]);