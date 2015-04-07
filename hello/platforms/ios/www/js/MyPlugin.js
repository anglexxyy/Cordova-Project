function test(){
    var success = function() { alert("success");};
    var faild = function(error) { alert ("error");};
    cordova.exec(success,faild,"Echo","echo",[]);
}