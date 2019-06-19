angular
    .module('app')
    .controller('contatoController', contatoController);

function contatoController() {
    var vm = this;
    vm.title = 'Olá Francisco!';

}