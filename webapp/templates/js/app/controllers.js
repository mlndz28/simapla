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

    $scope.notSorted = function(obj) {
        if (!obj) {
            return [];
        }
        return Object.keys(obj);
    }


    $scope.navClick = function(item) {
        var set = false;
        for (var i in $scope.activeTab) {
            $scope.activeTab[i] = i == item? 'active': '';
            set = $scope.activeTab[i] == 'active'? true: set;
        }
        return set;
    }
}])
.controller('profileCtrl', ['$scope', '$http', function($scope, $http) {

    $scope.cursos = [];
    $scope.txtBtnEdit = 'Editar';
    $scope.editBtnColor = 'warning';
    $scope.obj = {};
    $scope.obj.editando = false;

    $scope.loadData = function() {
        var url = '/ws/me';
        var params = {
            'action':'getCursos'
        }
        // Simple GET request example:
        $http.get(url).then(function successCallback(response) {

            $scope.me = response;
            console.log($scope.me);
            // this callback will be called asynchronously
            // when the response is available
          }, function errorCallback(response) {
            // called asynchronously if an error occurs
            // or server returns response with an error status.
          });
    }

    $scope.addCurso = function() {
        var url = 'php/post.php';
        var params = {
            'action':'addCurso',
            'sigla': $scope.sigla,
            'nombre': $scope.nombre,
            'cantidadHoras': $scope.cantidadHoras,
            'clasesEnSemana': $scope.clasesEnSemana,
            'cantidadGrupos': $scope.cantidadGrupos
        };

        $http
        .post(url, params)
        .success(function(data) {
            $scope.cursos.push({
                'id':data.id,
                'sigla':data.sigla,
                'nombre':data.nombre,
                'cantidadHoras':data.cantidadHoras,
                'clasesEnSemana':data.clasesEnSemana,
                'cantidadGrupos':data.cantidadGrupos
            });
            $scope.sigla = '';
            $scope.nombre = '';
            $scope.cantidadHoras = '';
            $scope.clasesEnSemana = '';
            $scope.cantidadGrupos = '';
            //exito
        }).error( function(){

        });
    }

    $scope.console = {};
    $scope.log = function(o) { console.log(o); }

    /*************
    EXECUTE
    **************/
    $scope.loadData();
}])


.controller('cursoCtrl', ['$scope', '$http', function($scope, $http) {

    $scope.planesCurso = [];
    $scope.profesoresCurso = [];
    $scope.opt = {};
    $scope.opt.profesores = [];
    $scope.horariosCurso = [
        [{'dia':'L','inicio':7,'fin':9},{'dia':'J','inicio':7,'fin':9}],
        [{'dia':'L','inicio':9,'fin':11},{'dia':'J','inicio':9,'fin':11}],
        [{'dia':'M','inicio':7,'fin':9},{'dia':'V','inicio':7,'fin':9}],
        [{'dia':'M','inicio':9,'fin':11},{'dia':'V','inicio':9,'fin':11}],
    ];

    $scope.loadData = function() {
        var url = 'php/post.php';
        var params = {
            'action':'loadPlanesCurso',
            'id':$scope.curso.id
        };
        $http
        .post(url, params)
        .success(function(data) {
            $scope.planesCurso = data;
        }).error( function(){

        });

        var params = {
            'action':'loadProfesCursos',
            'id':$scope.curso.id
        };
        $http
        .post(url, params)
        .success(function(data) {
            $scope.profesoresCurso = data;
        }).error( function(){

        });

        var params = {
            'action':'getProfes'
        }
        $http
        .post(url, params)
        .success(function(data) {
            $scope.opt.profesores = data;
        }).error( function(){

        });
    }

    $scope.saveData = function() {
        var url = 'php/post.php';
        var params = {
            'action':'updateCurso',
            'id':$scope.curso.id,
            'sigla':$scope.curso.sigla,
            'nombre':$scope.curso.nombre,
            'cantidadHoras':$scope.curso.cantidadHoras,
            'clasesEnSemana':$scope.curso.clasesEnSemana,
            'cantidadGrupos':$scope.curso.cantidadGrupos
        };
        if (!$scope.editando) {
            $http
            .post(url, params)
            .success(function(data) {
                //exito
            }).error( function(){

            });
        }
    }

    $scope.agregarProfeACurso = function() {
        var url = 'php/post.php';
        var params = {
            'action':'addCursoAProfe',
            'idCurso':$scope.curso.id,
            'idProfe':$scope.profeNuevo
        };
        $http
        .post(url, params)
        .success(function(data) {
            $scope.profesoresCurso.push({
                'id':data.idProfe,
                'nombre':data.nombreProfe,
                'apellido':data.apellido
            });
            //exito
        }).error( function(){

        });
    }

    $scope.deleteCurso = function(item) {
        var url = 'php/post.php';
        var params = {
            'action':'deleteCurso',
            'id':$scope.curso.id
        };
        if (!$scope.editando) {
            $http
            .post(url, params)
            .success(function(data) {
                var index = $scope.$parent.cursos.indexOf(item);
                $scope.$parent.cursos.splice(index,1);
            }).error( function(){

            });
        }
    }

}])

.controller('profesCtrl', ['$scope','$http', function($scope, $http) {

        $scope.profesores = [];
        $scope.txtBtnEdit = 'Editar';
        $scope.editBtnColor = 'warning';
        $scope.obj = {};
        $scope.obj.editando = false;

        $scope.loadData = function() {
            var url = 'php/post.php';
            var params = {
                'action':'getProfes'
            }
            $http
            .post(url, params)
            .success(function(data) {
                $scope.profesores = data;
            }).error( function(){

            });
        }

        $scope.addProfe = function() {
            var url = 'php/post.php';
            var params = {
                'action':'addProfe',
                'nombre': $scope.nombre,
                'apellido': $scope.apellido,
                'horasLaborales': $scope.horasLaborales
            };

            $http
            .post(url, params)
            .success(function(data) {
                $scope.profesores.push({
                    'id':data.id,
                    'nombre':data.nombre,
                    'apellido':data.apellido,
                    'horasLaborales':data.horasLaborales
                });
                $scope.nombre = '';
                $scope.apellido = '';
                $scope.horasLaborales = '';
                //exito
            }).error( function(){

            });
        }

        $scope.console = {};
        $scope.log = function(o) { console.log(o); }

        /*************
        EXECUTE
        **************/
        $scope.loadData();
}])

.controller('profeCtrl', ['$scope', '$http', function($scope, $http) {

    $scope.cursosProfe = [];
    $scope.opt = {};
    $scope.opt.cursos = [];
    $scope.horariosProfe = [
        [{'dia':'L','inicio':7,'fin':9},{'dia':'J','inicio':7,'fin':9}],
        [{'dia':'L','inicio':9,'fin':11},{'dia':'J','inicio':9,'fin':11}],
        [{'dia':'M','inicio':7,'fin':9},{'dia':'V','inicio':7,'fin':9}],
        [{'dia':'M','inicio':9,'fin':11},{'dia':'V','inicio':9,'fin':11}],
    ];

    $scope.loadData = function() {
        var url = 'php/post.php';
        var params = {
            'action':'loadCursosProfe',
            'id':$scope.profesor.id
        };
        $http
        .post(url, params)
        .success(function(data) {
            $scope.cursosProfe = data;
        }).error( function(){

        });

        var params = {
            'action':'getCursos'
        }
        $http
        .post(url, params)
        .success(function(data) {
            $scope.opt.cursos = data;
        }).error( function(){

        });
    }



    $scope.saveData = function() {
        var url = 'php/post.php';
        var params = {
            'action':'updateProfe',
            'id':$scope.profesor.id,
            'nombre':$scope.profesor.nombre,
            'apellido':$scope.profesor.apellido,
            'horasLaborales':$scope.profesor.horasLaborales
        };
        if (!$scope.editando) {
            $http
            .post(url, params)
            .success(function(data) {
                //exito
            }).error( function(){

            });
        }
    }

    $scope.addCursoAProfe = function() {
        var url = 'php/post.php';
        var params = {
            'action':'addCursoAProfe',
            'idProfe':$scope.profesor.id,
            'idCurso':$scope.cursoNuevo
        };
        $http
        .post(url, params)
        .success(function(data) {
            $scope.cursosProfe.push({
                'id':data.id,
                'sigla':data.sigla,
                'nombre':data.nombre
            });
            //exito
        }).error( function(){

        });
    }

    $scope.deleteProfe = function(item) {
        var url = 'php/post.php';
        var params = {
            'action':'deleteProfe',
            'id':$scope.profesor.id
        };
        if (!$scope.editando) {
            $http
            .post(url, params)
            .success(function(data) {
                var index = $scope.$parent.profesores.indexOf(item);
                $scope.$parent.profesores.splice(index,1);
            }).error( function(){

            });
        }
    }


    $scope.loadData();

}])
