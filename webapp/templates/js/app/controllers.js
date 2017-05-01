app
.controller('profileCtrl', ['$scope', '$http', function($scope, $http) {

    $scope.cursos = [];
    $scope.txtBtnEdit = 'Editar';
    $scope.editBtnColor = 'warning';
    $scope.obj = {};
    $scope.obj.editando = false;

    $scope.loadData = function() {
        var url = '/ws/infoStudent';
        /*var params = {
        'action':'getCursos'
        }*/
        // Simple GET request example:
        $http.get(url).then(function successCallback(response) {
            $scope.me = response.data[0];
            console.log("LOG controllers.js:"+JSON.stringify($scope.me));
        }, function errorCallback(response) {
            console.log("LOG controllers.js: Error.");
        });
    }

/*************
EXECUTE
**************/
$scope.loadData();
}])

.controller('SignupCtrl', ['$scope', '$http', function($scope, $http) {
  $scope.countries = [];
  $scope.provinces = [];
  $scope.cantons = [];
  $scope.districts = [];
  $scope.instruments = [];
  $scope.managementPositions = [];

  $scope.entidades = [{
    value: 0,
    label: 'Estudiante'
  },{
    value: 1,
    label: 'Administrador'
  },{
    value: 2,
    label: 'Profesor EN DESARROLLO'
  },{
    value: 3,
    label: 'Responsable EN DESARROLLO'
}]; /*TODO: Procedimientos de registro de profesor y responsable*/

  $scope.loadCountries = function() {
    var url = '/ws/countries';
    $http.get(url).then(function successCallback(response) {
      $scope.countries = response.data;
    }, function errorCallback(response) {});
  };

  $scope.loadProvinces = function() {
    var url = '/ws/provinces/1';
    $http.get(url).then(function successCallback(response) {
      $scope.provinces = response.data.data;
    }, function errorCallback(response) {});
  };

  $scope.loadCantons = function() {
    var url = '/ws/cantons/' + $scope.provincePicker;
    $http.get(url).then(function successCallback(response) {
      $scope.cantons = response.data.data;
    }, function errorCallback(response) {});
  };

  $scope.loadDistricts = function() {
    var url = '/ws/districts/' + $scope.cantonPicker;
    $http.get(url).then(function successCallback(response) {
      $scope.districts = response.data.data;
    }, function errorCallback(response) {});
  };

  $scope.loadInstruments = function() {
    var url = '/ws/instruments/';
    $http.get(url).then(function successCallback(response) {
      $scope.instruments = response.data.data;
    }, function errorCallback(response) {});
  };

  $scope.loadManagementPositions = function() {
    var url = '/ws/managementPositions/';
    $http.get(url).then(function successCallback(response) {
      $scope.managementPositions = response.data.data;
    }, function errorCallback(response) {});
  };

  $scope.loadManagementPositions();
  $scope.loadInstruments();
  $scope.loadProvinces();
}]);
