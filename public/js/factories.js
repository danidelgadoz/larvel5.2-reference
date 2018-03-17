app.factory('Session', ['$http', 'APP_API_URL', function($http, APP_API_URL){
  return {
      login: function(user) {
        return $http({
          method: "POST",
          url: APP_API_URL + "usuario/auth",
          async: true,
          data:{
            correo: user.email,
            contrasena: user.password
          }
        });
      },
  };
}]);

app.factory('Usuario', ['$http', 'APP_API_URL', function($http, APP_API_URL){  
  return {
      get: function(pagination, tipo){
        return $http({
          method: "GET",
          url: APP_API_URL + "usuario",
          async: true,
          params:{
            page: pagination.page - 1,
            limit: pagination.limit,
            tipo: tipo
          }
        });
      },
      getById: function(id){
        return $http({
          method: "GET",
          url: APP_API_URL + "usuario/" + id
        });
      },
      create: function(usuario){
        return $http({
          method: "POST",
          url: APP_API_URL + "usuario",
          data: usuario
        });
      },
      resetPassword: function(id, password){
        return $http({
          method: "PUT",
          url: APP_API_URL + "usuario/pass/" + id,
          data: password
        });
      },
      update2: function(usuario){
        return $http({
          method: "PUT",
          url: APP_API_URL + "usuario/" + usuario.idusuario,
          data: usuario
        });
      },
      delete: function(id){
        return $http({
          method: "DELETE",
          url: APP_API_URL + "usuario/" + id
        });
      },
  };
}]);

app.factory('Cliente', ['$http', 'APP_API_URL', 'DEVELOPMENT_ENVIRONMENT', function($http, APP_API_URL, DEVELOPMENT_ENVIRONMENT){
  return {
      loadDataDemo: function(){
        if(DEVELOPMENT_ENVIRONMENT==true){
          var cliente = {
            "codigo"            : "C0001",
            "tipo"              : "PERSONA",
            "nombres"           : "Daniel Eduardo",
            "apellidos"         : "Delgado Diaz",
            "razon_social"      : null,
            "documento"         : "DNI",
            "numero_documento"  : "48374648",
            "persona_contacto"  : null,
            "rubro"             : "Tecnologia",
            "ubigeo"            : null,
            "direccion"         : "Urb. Ingenieria 975",
            "telefono1"         : 3422119,
            "telefono2"         : 987616413,
            "email"             : "dedd1993@gmail.com",
            "pagina_web"        : "www.dandel.com",
            "observacion"       : "cliente vip"
          };
        } else{

        }

        return cliente;
      },
      listar: function(pagination, tipo_cliente){
        return $http({
          method: "GET",
          url: APP_API_URL + "cliente"
        });
      },
      getById: function(id){
        // console.log(APP_API_URL + "cliente/" + id);
        return $http({
          method: "GET",
          url: APP_API_URL + "cliente/" + id
        });
      },      
      create: function(cliente){
        return $http({
          method: "POST",
          url: APP_API_URL + "cliente",
          // data: cliente
        });
      },
      update: function(cliente){
        return $http({
          method: "PUT",
          url: APP_API_URL + "cliente/" + cliente.idcliente,
          data: cliente
        });
      },
      delete: function(id){
        return $http({
          method: "DELETE",
          url: APP_API_URL + "cliente/" + id
        });
      },      
  };
}]);

app.factory('Venta', ['$http', 'APP_API_URL', function($http, APP_API_URL){
  return {    
    listar: function(){
      console.log(APP_API_URL + "venta"  );
      return $http({
        method: "GET",
        url: APP_API_URL + "venta"        
      });
    }
  }
}]);