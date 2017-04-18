var app = angular.module('simapla', ['ngRoute'])
.config(['$routeProvider', '$locationProvider',
    function($routeProvider, $locationProvider) {
        $routeProvider
        .when(
            '/',
            {
                redirectTo:'/Horarios'
            }
        )
        .when(
            '/Horarios',
            {
                controller:'cursosDataCtrl',
                templateUrl:'templates/horarios.html'
            }
        )
        .when(
            '/Cursos',
            {
                controller:'cursosDataCtrl',
                templateUrl:'templates/cursos.html'
            }
        )
        .when(
            '/Profesores',
            {
                controller:'profesCtrl',
                templateUrl:'templates/profesores.html'
            }
        )
        .otherwise(
            {
                redirectTo:'/'
            }
        );
        //$locationProvider.html5Mode(true);
}]);
