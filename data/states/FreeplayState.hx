var playbackRateTxt, howToUse:FunkinText;
var maxVal = 2;
var minVal = 0.5;
var chaVal = 0.05;
var playbackRateTxtBG:FlxSprite;
var alignment = "left";

function postCreate() {
    playbackRateTxt = new FunkinText(FlxG.width * 0.7 + 75, FlxG.height * 0.7 + 100, 0, "Playback Rate: \n" + FlxG.save.data.playbackRate +"x");
    playbackRateTxt.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE);
    playbackRateTxt.scrollFactor.set();
    playbackRateTxt.alignment = alignment;
    add(playbackRateTxt);

    playbackRateTxtBG = new FlxSprite(FlxG.width * 0.7 + 100, FlxG.height * 0.7 + 100).makeSolid(1, 1, 0xFF000000);
    playbackRateTxtBG.alpha = 0.6;
    playbackRateTxtBG.scale.set(playbackRateTxt.width + 20, playbackRateTxt.height + 60);
    playbackRateTxtBG.updateHitbox();
    playbackRateTxtBG.x = FlxG.width - playbackRateTxtBG.width;
    insert(members.indexOf(playbackRateTxt) - 1, playbackRateTxtBG);

    howToUse = new FunkinText(FlxG.width * 0.7 + 75, FlxG.height * 0.7 + 165, 0, "[SHIFT + MOUSE SCROLL]\n[SHIFT + E/Q]");
    howToUse.setFormat(Paths.font("vcr.ttf"), 24, FlxColor.WHITE);
    howToUse.scrollFactor.set();
    howToUse.alignment = alignment;
    add(howToUse);

}

function postUpdate() {
    FlxG.save.data.playbackRate = Math.round(FlxG.save.data.playbackRate * 100) / 100;
    playbackRateTxt.text = "Playback Rate: \n" + FlxG.save.data.playbackRate +"x";
    if (FlxG.keys.pressed.SHIFT) {
        if (FlxG.mouse.wheel > 0 && FlxG.save.data.playbackRate < maxVal) FlxG.save.data.playbackRate += chaVal;
        else if (FlxG.mouse.wheel < 0 && FlxG.save.data.playbackRate > minVal) FlxG.save.data.playbackRate -= chaVal;
    }

    if (FlxG.keys.pressed.SHIFT && FlxG.keys.justPressed.E && FlxG.save.data.playbackRate < maxVal) {
        FlxG.save.data.playbackRate += chaVal;
    }
    if (FlxG.keys.pressed.SHIFT && FlxG.keys.justPressed.Q && FlxG.save.data.playbackRate > minVal) {
        FlxG.save.data.playbackRate -= chaVal;
    }
}
