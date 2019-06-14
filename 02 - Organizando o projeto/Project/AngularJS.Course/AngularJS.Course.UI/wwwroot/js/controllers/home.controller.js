angular
    .module('app')
    .controller('homeController', homeController);

function homeController() {
    var vm = this;

    vm.novocliente = {
        nome: null,
        idade: null
    };

    vm.titulo = 'Hello World!';

    vm.clientes = [
        {
            nome: "João",
            idade: 19
        },
        {
            nome: "Gabriel",
            idade: 36
        }
    ];

    vm.exibirClientes = true;

    vm.adicionarCliente = function (cliente) {
        vm.clientes.push({
            nome: cliente.nome,
            idade: cliente.idade
        });
        vm.novocliente = {
            nome: null,
            idade: null
        };

    };

    vm.removerCliente = function (nome) {
        if (nome === 'Gabriel')
            alert('Até JULHOOOOO');
        vm.clientes = vm.clientes.filter(function (c) { return c.nome !== nome; });
    };

}