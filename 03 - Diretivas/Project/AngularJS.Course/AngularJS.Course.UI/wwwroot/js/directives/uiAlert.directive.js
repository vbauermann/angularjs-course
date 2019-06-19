angular.module('app')
    .directive('uiAlert', function () {
        return {
            templateUrl: "../../views/alert.html",
            replace: true,
            restrict: 'E',
            scope: {
                titulo: '@'
            },
            transclude: true
        };

    });