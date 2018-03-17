app.service('SecurityService', ['$rootScope', '$location', function($rootScope, $location) {
  this.init = function(response) {
    localStorage.setItem("session_username", response.usuario.nombre);
    localStorage.setItem("session_type", response.usuario.tipo_usuario);
    localStorage.setItem("session_token", response.token);

    $rootScope.user.name = response.usuario.nombre;
    $rootScope.user.type = response.usuario.tipo_usuario;

    $location.url("/dashboard");
  };

  this.end = function() {
    localStorage.clear();

    $location.url("/login");
  };

  this.getToken = function() {
      return localStorage.getItem('session_token');
  };

  this.secureRequest = function(requestConfig) { //look in config Service
    var token = this.getToken();

    if(token != null && token != '' && token != 'undefined') {
      requestConfig.headers['Authorization'] = token;
    } else{
      //$location.url("/login");
    }
  };
}]);