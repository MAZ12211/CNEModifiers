/*
Notes for how to change playback rate in freeplay
Use SHIFT + Mouse scroll (scroll up increaments the playback rate by 0.05 and scroll down decreaments it by 0.05)
    - How to achieve that:
        - Make a text in the bottom right corner of the freeplay menu using funkinText that shows the current playback rate via
        FlxG.save.data.playbackRate
        - Change the playbackRateTxt.text to FlxG.save.data.playbackRate
*/
var playbackRateTxt:FunkinText;
var playbackRateTxtBG:FlxSprite;
var alignment = "left";
var playedSound:Bool = false;

function postCreate() {
    playbackRateTxt = new FlxText(FlxG.width * 0.7 + 100, FlxG.height * 0.7 + 150, 0, "Playback Rate: \n" + FlxG.save.data.playbackRate +"x");
    playbackRateTxt.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE);
    playbackRateTxt.scrollFactor.set();
    playbackRateTxt.alignment = alignment;
    add(playbackRateTxt);

    playbackRateTxtBG = new FlxSprite(FlxG.width * 0.7 + 100, FlxG.height * 0.7 + 150).makeSolid(1, 1, 0xFF000000);
    playbackRateTxtBG.alpha = 0.6;
    playbackRateTxtBG.scale.set(playbackRateTxt.width, playbackRateTxt.height);
    playbackRateTxtBG.updateHitbox();
    playbackRateTxtBG.x = FlxG.width - playbackRateTxtBG.width;
    insert(members.indexOf(playbackRateTxt) - 1, playbackRateTxtBG);
}

function postUpdate() {
    if (FlxG.keys.pressed.SHIFT) {
        if (FlxG.mouse.wheel > 0) FlxG.save.data.playbackRate += 0.05;
        else if (FlxG.mouse.wheel < 0) FlxG.save.data.playbackRate -= 0.05;
        playbackRateTxt.text = "Playback Rate: \n" + FlxG.save.data.playbackRate +"x";
    }

    // if (FlxG.mouse.overlaps(playbackRateTxtBG)) {
    //     // play a sound effect from base game showing the shift key and a mouse wheel scrolling up and down in two frames
    //     // if (!playedSound) FlxG.sound.play(Paths.sound("brokenpad")); playedSound = true;
    //     if (!playedSound) {
    //         controls = new FlxSprite(500, -100); 
    //         controls.frames = Paths.getSparrowAtlas('controls');
    //         controls.animation.addByPrefix('play', 'control', 2);
    //         controls.animation.play('play');
    //         controls.antialiasing = true;
    //         add(controls);
    //         playedSound = true;
    //     }

    // }
}
