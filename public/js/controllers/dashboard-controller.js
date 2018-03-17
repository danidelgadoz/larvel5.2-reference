app.controller('dashboardCtrl', [
  '$scope', '$rootScope', '$timeout', 'SecurityService',
  function ($scope, $rootScope, $timeout, SecurityService) {
    console.log("dashboardCtrl...");
    
    $rootScope.loadScript('../AdminLTE/dist/js/app.min.js', 'text/javascript', 'utf-8');
  }
]);