var app = angular.module('portalRest',["ui.bootstrap"]);//定义失物模块
app.filter('textLengthSet', function() {
    return function(value, wordwise, max, tail) {
        if (!value) return '';

        max = parseInt(max, 10);
        if (!max) return value;
        if (value.length <= max) return value;

        value = value.substr(0, max);
        if (wordwise) {
        var lastspace = value.lastIndexOf(' ');
        if (lastspace != -1) {
        value = value.substr(0, lastspace);
        }
        }

    return value + (tail || ' ...');//'...'可以换成其它文字
    };
});
