cordova.define("com.nikoyo.plugins.test", function(require, exports, module) {
    module.exports = {
        echo : function(message,callback,faild){
            cordova.exec(callback,faild,"Echo","echo",[message]);
        }
    };
});