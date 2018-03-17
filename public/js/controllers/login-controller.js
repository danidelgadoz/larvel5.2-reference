app.controller('loginCtrl', [
  '$scope', '$rootScope', '$location', 'Session', 'SecurityService',
  function($scope, $rootScope, $location, Session, SecurityService) {
    if(localStorage.getItem('session_token'))//Si existe sesion redirijimos al dashboard
      $location.url("/dashboard");
    
    $scope.logindisabled=false;      
    $scope.user = {email: 'admin@gn7app.com', password: 'admin$'};  

    $scope.login = function() {
      $location.url("/dashboard"); // Just if session is not implemented
      return;

      $scope.logindisabled=true; 
      
      Session.login($scope.user).success(function(response){        
        if(response.auth == true){
            SecurityService.init(response.data);

        }else{
          $scope.loginAlert = { message: response.data, style: {'color':'red'}};
          $scope.logindisabled=false;
        }
      });
    };

    // AdminLTE estilos
    $(function () {
      $('input').iCheck({
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue',
        increaseArea: '20%' // optional
      });
    });
  }
]);