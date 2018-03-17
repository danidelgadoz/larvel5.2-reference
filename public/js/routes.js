app.config([
  '$stateProvider', '$urlRouterProvider',
  function($stateProvider, $urlRouterProvider){
    // Configuración de las rutas
    $stateProvider.state({
      name: 'login',
      url: '/login', 
      templateUrl: 'views/login.html',
      controller: 'loginCtrl'
    });
    
    $stateProvider.state({
      name: 'dashboard',
      abstract: true,
      templateUrl: 'views/dashboard.html',
      controller: 'dashboardCtrl'
    });
      $stateProvider.state({
        name: 'dashboard.inicio',
        url: '/dashboard', 
        templateUrl: 'views/modules/inicio.html'
        // controller: 'dashboardCtrl'
      });
      
      $stateProvider.state({
        name: 'dashboard.clientes',
        url: '/clientes', 
        templateUrl: 'views/modules/clientes.html',
        controller: 'clienteCtrl'
      });
      $stateProvider.state({
        name: 'dashboard.nuevo_cliente',
        url: '/nuevo_cliente', 
        templateUrl: 'views/modules/nuevo_cliente.html',
        controller: 'clienteFormCtrl'
      });

      $stateProvider.state({
        name: 'dashboard.ventas',
        url: '/ventas', 
        templateUrl: 'views/modules/ventas.html',
        controller: 'ventaCtrl'
      });
      $stateProvider.state({
        name: 'dashboard.nueva_venta',
        url: '/nueva_venta', 
        templateUrl: 'views/modules/nueva_venta.html',
        controller: 'ventaCtrl'
      });

    $urlRouterProvider.otherwise('/ventas');

  }
]);