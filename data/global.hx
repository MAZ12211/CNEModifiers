function new() {
    if (FlxG.save.data.practice == null) FlxG.save.data.practice = false;
    if (FlxG.save.data.botplay == null) FlxG.save.data.botplay = false;
    if (FlxG.save.data.playbackRate == null) FlxG.save.data.playbackRate = 1;

}

function onDestroy() {
    if (FlxG.save.data.playbackRate > 1) FlxG.save.data.playbackRate = 1;
}