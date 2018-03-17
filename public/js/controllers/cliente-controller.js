app.controller('clienteCtrl', [
  '$scope', '$rootScope', '$timeout', 'SecurityService', 'Cliente',
  function ($scope, $rootScope, $timeout, SecurityService, Cliente) {
    console.log("clienteCtrl...");
        
    $scope.init = function(){
    	Cliente.listar().then(function successCallback(response){
    		console.log(response);
    		$scope.clientes = response.data;
	    });
    };

  }
]);

app.controller('clienteFormCtrl', [
  '$scope', '$rootScope', '$timeout', 'SecurityService', 'Cliente',
  function ($scope, $rootScope, $timeout, SecurityService, Cliente) {
    $scope.cliente = Cliente.loadDataDemo();
    console.log($scope.cliente);

    $scope.create = function(){
    	console.log("create...");
    	Cliente.create(JSON.stringify($scope.cliente)).then(function successCallback(response){
    		console.log(response);
    	});
    };

    $scope.update = function(){
    	console.log("update...");
    };
  }
]);