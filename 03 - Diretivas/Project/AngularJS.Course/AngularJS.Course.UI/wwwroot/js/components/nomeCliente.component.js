angular
    .module('app')
    .component('nomeCliente', {
        template: 'Hello, {{vm.nome}}!',
        bindings: {
            nome: '='
        },
        controllerAs: 'vm',
        controller: function GreetUserController() {
            var vm = this;
        }
    });
