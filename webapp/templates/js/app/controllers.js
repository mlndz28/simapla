app
.controller('profileCtrl', ['$scope', '$http', function($scope, $http) {

  $scope.loadData = function() {
    var url = '/ws/me';
    // Simple GET request example:
    $http.get(url).then(function successCallback(response) {
      $scope.me = response.data;
      console.log($scope.me);
    }, function errorCallback(response) {
    });
  }
  $scope.loadData();
}])

.controller('SignupCtrl', ['$scope', '$http', function($scope, $http) {
  $scope.countries = [];
  $scope.provinces = [];
  $scope.cantons = [];
  $scope.districts = [];
  $scope.instruments = [];

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

  $scope.loadInstruments();
  $scope.loadProvinces();
}]);
