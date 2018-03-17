// Creación del módulo
var app = angular.module('MyAngularAppName', [
        'ui.router'
  ]);

app.run([
  '$rootScope', '$location',
  function($rootScope, $location){
    var username = localStorage.getItem('session_username') ? localStorage.getItem('session_username'): 'Daniel Delgado';
    
    $rootScope.user = {
      name : username,
      type : localStorage.getItem('session_type'),
      token: localStorage.getItem('session_token'),      
    };

    $rootScope.getLocation = function(){
      return $location.url();
    };

    $rootScope.loadScript = function(url, type, charset) {
        console.log("cargando javascript's ....");

        if (type===undefined) type = 'text/javascript';
        if (url) {
            var script = document.querySelector("script[src*='"+url+"']");
            if (!script) {
                var heads = document.getElementsByTagName("head");
                if (heads && heads.length) {
                    var head = heads[0];
                    if (head) {
                        script = document.createElement('script');
                        script.setAttribute('src', url);
                        script.setAttribute('type', type);
                        if (charset) script.setAttribute('charset', charset);
                        head.appendChild(script);
                    }
                }
            }
            return script;
        }
    };

    // $rootScope.loadScript('AdminLTE/dist/js/app.min.js', 'text/javascript', 'utf-8');
  }
]);