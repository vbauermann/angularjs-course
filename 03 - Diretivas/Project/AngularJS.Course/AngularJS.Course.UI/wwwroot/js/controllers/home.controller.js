angular
    .module('app')
    .controller('homeController', homeController);

function homeController() {
    var vm = this;
    vm.erro = "Contate o suporte!"
    // vm.novocliente = {
    //     nome: null,
    //     idade: null
    // };

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

    vm.paises = [
        {
            "nome": "Brasil",
            "sigla": "BR",
            "regiao": "América do Sul"
        },
        {
            "nome": "Peru",
            "sigla": "PE",
            "regiao": "América do Sul"
        },
        {
            "nome": "Chile",
            "sigla": "CL",
            "regiao": "América do Sul"
        },
        {
            "nome": "Estados Unidos da América",
            "sigla": "EUA",
            "regiao": "América do Norte"
        },
        {
            "nome": "Canada",
            "sigla": "CA",
            "regiao": "América do Norte"
        }
    ];

    vm.exibirClientes = true;

    vm.adicionarCliente = function (cliente) {
        if (cliente.nome === 'Francisco')
            vm.erroAoIncluirCliente = true;
        else {
            vm.clientes.push({
                nome: cliente.nome,
                idade: cliente.idade
            });
        }
        delete vm.novocliente;

    };

    vm.removerCliente = function (nome) {
        if (nome === 'Gabriel')
            alert('Até JULHOOOOO');
        vm.clientes = vm.clientes.filter(function (c) { return c.nome !== nome; });
    };

}