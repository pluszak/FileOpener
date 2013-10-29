// forked from https://github.com/markeeftb/FileOpener

module.exports = {
    open: function (url, onFailure) {
        var success = function () {
            console.log("success!");
        }
        var failure = function (error) {
            console.log(error);
			if(typeof onFailure === "function") {
				onFailure(error);
			}
        }
        cordova.exec(success, failure, "FileOpener", "openFile", [url]);
    }
}
