angular
    .module('app')
    .component('nomeCliente', {
        template: 'Hello, {{vm.nome | lowercase}}!',
        bindings: {
            nome: '='
        },
        controllerAs: 'vm',
        controller: function NomeClienteController() {
            var vm = this;
        }
    });
