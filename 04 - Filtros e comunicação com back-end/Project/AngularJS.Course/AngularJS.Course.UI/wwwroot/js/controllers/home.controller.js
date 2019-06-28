angular
    .module('app')
    .controller('homeController', homeController);

function homeController($http) {
    var vm = this;
    vm.erro = "Contate o suporte!";
    vm.titulo = 'Clientes!';
    vm.alterarCriterioDeOrdenacao = alterarCriterioDeOrdenacao;

    vm.clientes = [];

    vm.paises = [

    ];

    vm.adicionarCliente = function (cliente) {
        var data = {
            nome: cliente.nome,
            idade: cliente.idade,
            pais: cliente.pais,
            dataInscricao: new Date(),
            mensalidade: 50.15
        };
        $http
            .post('http://localhost:5000/api/Clientes', data)
            .then(function (resultado) {
                recuperarClientes();
            }, function (erro) {
                console.log(erro);
            });

    };

    vm.removerCliente = function (id) {
        $http
            .delete('http://localhost:5000/api/Clientes/' + id)
            .then(function (resultado) {
                recuperarClientes();
            }, function (erro) {
                console.log(erro);
            });
    };


    function recuperarClientes() {
        $http
            .get('http://localhost:5000/api/Clientes')
            .then(function (resultado) {
                vm.clientes = resultado.data;
            }, function (erro) {
                    console.log(erro);
            });
    }

    function recuperarPaises() {
        $http
            .get('http://localhost:5000/api/Paises')
            .then(function (resultado) {
                vm.paises = resultado.data;
            }, function (erro) {
                console.log(erro);
            });
    }

    function alterarCriterioDeOrdenacao(criterio) {
        vm.criterioDeOrdenacao = criterio;
        vm.criterioDeOrdenacaoReverse = !vm.criterioDeOrdenacaoReverse;
    }


    recuperarClientes();
    recuperarPaises();
}