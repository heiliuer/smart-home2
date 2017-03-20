/**
 * Created by heiliuer on 2017/3/20 0020.
 */
var exec = require('child_process').exec;

var img = require('path').resolve(__dirname, 'image2.jpg');

module.exports = function (call, has_banner) {
    has_banner = has_banner || false;
    var cmd = "fswebcam -r 1280x720 --timestamp '%Y-%m-%d %H:%M:%S (%Z)' " + (has_banner ? '' : '--no-banner') + ' ' + img;
    // var cmd = 'echo 11';

    exec(cmd, function (error, stdout, stderr) {
        // command output is in stdout
        // console.log(error, stdout, stderr);
        call && call(img);
        // call && call("www/img/icon_at_house.png");
    });
}