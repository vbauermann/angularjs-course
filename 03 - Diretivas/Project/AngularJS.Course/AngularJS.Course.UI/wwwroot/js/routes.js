
angular
    .module('app')
    .config(configApp);

configApp.$inject = ['$routeProvider'];


function configApp($routeProvider) {
    $routeProvider
        .when('/', {
            templateUrl: '../views/home.html',
            controller: 'homeController',
            controllerAs: 'vm'
        })
        .when('/sobre', {
            templateUrl: '../views/sobre.html',
            controller: 'sobreController',
            controllerAs: 'vm'
        })
        .when('/contato', {
            templateUrl: '../views/contato.html',
            controller: 'contatoController',
            controllerAs: 'vm'
        })
        .otherwise({ redirectTo: '/' });

}
