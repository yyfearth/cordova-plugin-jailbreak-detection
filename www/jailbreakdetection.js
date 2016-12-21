
var exec = require('cordova/exec');

module.exports = {
    name: 'JailbreakDetection',
    detectJailbreak: function() {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, 'JailbreakDetection', 'detectJailbreak', []);
        });
    },
    isJailbroken: function(successCallback, failureCallback) { // for backward compatibility
        exec(function(reason) {
            successCallback(!!reason);
        }, failureCallback, 'JailbreakDetection', 'detectJailbreak', []);
    }
};
