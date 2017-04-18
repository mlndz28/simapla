app
.controller('profileCtrl', ['$scope', '$http', function($scope, $http) {

  $scope.loadData = function() {
    var url = '/ws/me';
    var params = {
      'action': 'getCursos'
    }
    // Simple GET request example:
    $http.get(url).then(function successCallback(response) {

      $scope.me = response.data;
      console.log($scope.me);
      // this callback will be called asynchronously
      // when the response is available
    }, function errorCallback(response) {
      // called asynchronously if an error occurs
      // or server returns response with an error status.
    });
  }
}]);
