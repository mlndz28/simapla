app
.controller('navCtrl', ['$scope', '$location', '$route', function($scope, $location, $route) {
    $scope.activeTab = {
        'Horarios': 'active',
        'Cursos': '',
        'Profesores': ''
    };

    $scope.$on('$routeChangeSuccess', function(current) {
        var currentTab = $location.path().split('/')[1];
        if (currentTab != undefined && currentTab.length > 0) {
            if (!$scope.navClick(currentTab)) {
                $scope.navClick('Horarios');
            }
        } else {
            $scope.navClick('Horarios');
        }
    });
}])
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
            //console.log("this:"+JSON.stringify($scope.me));
        }, function errorCallback(response) {
            console.log("Error.");
        });
    }

/*************
EXECUTE
**************/
$scope.loadData();
}])
