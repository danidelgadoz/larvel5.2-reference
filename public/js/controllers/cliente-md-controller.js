app.controller('clienteCtrl', [
  '$q', '$scope', '$timeout', '$filter', 'clienteServ', 'Cliente', '$mdDialog',
  function($q, $scope, $timeout, $filter, clienteServ, Cliente, $mdDialog) { 
  'use strict';

  $scope.selected = [];
  $scope.limitOptions = [5, 10, 15];  
  $scope.options = {
    rowSelection: true,
    multiSelect: true,
    autoSelect: true,
    decapitate: false,
    largeEditDialog: false,
    boundaryLinks: true,
    limitSelect: true,
    pageSelect: true
  };
  $scope.query = {
    order: 'name',
    limit: 5,
    page: 1
  };  
  
  $scope.loadClienteTable = function(){
    $scope.promise = Cliente.get($scope.query, 'TRADICIONAL').success(function(response){
      $scope.desserts = response.data;
      console.log($scope.desserts.rows);
    });
  };
  $scope.loadClienteTable();

  $scope.toggleLimitOptions = function(){

    $scope.limitOptions = $scope.limitOptions ? undefined : [5, 10, 15];
  };
  
  $scope.loadStuff = function(){
    $scope.promise = $timeout(function (){
      $scope.loadClienteTable();
    }, 2000);
  };
  
  $scope.logItem = function(item){

    console.log(item.correo, ' selected');
  };
  
  $scope.logOrder = function(order){

    console.log('order: ', order);
  };
  
  $scope.logPagination = function(page, limit){

    $scope.loadClienteTable();
  };

  $scope.newCliente = function(ev){
    $mdDialog.show({
      controller: 'clienteECDialogCtrl',
      templateUrl: 'views/dialogs/cliente-ec-dialog.html',
      parent: angular.element(document.querySelector('#appContent')),
      targetEvent: ev,
      clickOutsideToClose:false,
      fullscreen: true, // Only for -xs, -sm breakpoints.      
      locals:{
        _Cliente: null
      }
    }).then(function(answer) {// here goes code when close dialog sending a variable return      
        $scope.loadClienteTable();
        $scope.selected = [];
      }, function() {// here goes code when close dialog without response
    });
  };

  $scope.showCliente = function(ev){
    $mdDialog.show({
      controller: 'clienteECDialogCtrl',
      templateUrl: 'views/dialogs/cliente-ec-dialog.html',
      parent: angular.element(document.querySelector('#appContent')),
      targetEvent: ev,
      clickOutsideToClose:false,
      fullscreen: true, // Only for -xs, -sm breakpoints.
      locals:{
        _Cliente: $scope.selected[0]
      }
    }).then(function(answer) {// here goes code when close dialog sending a variable return      
        $scope.loadClienteTable();
        $scope.selected = [];
      }, function() {// here goes code when close dialog without response
    });
  };

  $scope.deleteClient = function(cliente){
    console.log("Eliminando usuario: " + cliente.idcliente);
    Cliente.delete(cliente.idcliente).success(function(response){
      console.log(response);
      $scope.desserts.rows = $filter('filter')($scope.desserts.rows, function (x){        
        return (x.idcliente != cliente.idcliente);
      });
    });
  };

  $scope.deleteSelectedClients = function(ev){
    var confirm = $mdDialog.confirm()
      .title('¿Está usted seguro de eliminar los clientes seleccionados?')
      .textContent($scope.selected.length + ' clientes' + ' serán eliminados.')
      .ariaLabel('Eliminar clientes')
      .targetEvent(ev)
      .ok('OK')
      .cancel('CANCELAR');

    $mdDialog.show(confirm).then(function() {      
      $scope.selected.forEach(function (cliente){        
        $scope.deleteClient(cliente);
      });

      $scope.selected = [];
    });
  };  
}]);

app.controller('clienteECDialogCtrl', [
  '$scope', '$rootScope', '$mdDialog', '$timeout', '$filter', 'myAlertServ', 'clienteServ', '_Cliente', 'Cliente',
  function($scope, $rootScope, $mdDialog, $timeout, $filter, myAlertServ, clienteServ, _Cliente, Cliente){  
    $scope.tipocliente = 'TRADICIONAL';
    $scope.docPattern = $scope.tipocliente=='B2C' ? /^[0-9]{8}$/ : /^[0-9]{11}$/;  

    if( _Cliente!=null ){
      $scope.cliente = angular.copy(_Cliente);
      console.log("cliente seleccionado...");
      console.log($scope.cliente);     

    }else {
      $scope.cliente = clienteServ.loadClienteDemo();
    }

    $scope.addCliente = function(){
      console.log("Verificando cliente...");    
      $scope.cliente.documento = $scope.tipocliente=='B2C' ? 'DNI' : 'RUC';    
      console.log($scope.cliente);
      
      console.log("Agregando cliente...");
      var mensaje = null;
      Cliente.create($scope.cliente).success(function(response){
        console.log(response);

        if(response.status == true){
          mensaje = "Cliente registrado con éxito";
        }
        else{
          mensaje = "Ocurrio un error al registrar cliente: ";
        }
        
        $scope.closeDialog('OK');//send 'OK' for update table
        $timeout(function(){
          myAlertServ.aviso("INFORMACIÓN", mensaje);
        },500);
      });
    };

    $scope.updateTrabajador = function(){
      console.log("Actualizando cliente...");    
      console.log($scope.cliente);

      var mensaje = null;
      Cliente.update($scope.cliente).success(function(response){
        console.log(response);

        if(response.status == true)
          mensaje = "Cliente editado con éxito";
        else
          mensaje = "Ocurrio un error al editar cliente, verifique";
        
        $scope.closeDialog('OK');//send 'OK' for update table
        $timeout(function(){
          myAlertServ.aviso("INFORMACIÓN", mensaje);
          //actualizando datos en tabla...
          // _Cliente = $scope.cliente;
        },500);
      });
    };

    $scope.closeDialog = function(answer) {
      if(answer)
        $mdDialog.hide(answer);  
      else
        $mdDialog.cancel();
    };
  }
]);