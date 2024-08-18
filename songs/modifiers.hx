/* 
   Script by APurples
   If you wish to add this to your mod, you have full permission to do so as long as you credit me.
*/

/** TODOS:
    - Botplay:
    Make a toggle for it in the pause menu like base game ("Toggle Botplay")
**/

var botplayTxt, playbackRateTxt:FunkinText;

function postCreate(){
    botplayTxt = new FunkinText(400, 83, FlxG.width - 800, "Botplay", 40);
    botplayTxt.scrollFactor.set();
    botplayTxt.alignment = "center";
    botplayTxt.borderSize = 2;
    botplayTxt.cameras = [camHUD];
    add(botplayTxt);
    FlxTween.tween(botplayTxt, {y: 115}, 1, {ease: FlxEase.sineInOut, type: 4}); // type 4 means looping
    FlxTween.tween(botplayTxt, {alpha: 1}, 1);
    botplayTxt.alpha = 0;

    playbackRateTxt = new FunkinText(Std.int(healthBarBG.width / 1.75), healthBarBG.y - 100, 600, "Playback Rate: " + FlxG.save.data.playbackRate +"x", 23.5);
    playbackRateTxt.scrollFactor.set();
    playbackRateTxt.alignment = "center";
    playbackRateTxt.borderSize = 2;
    playbackRateTxt.alpha = 1;
    playbackRateTxt.cameras = [camHUD];
    add(playbackRateTxt);
}

function postUpdate() {
    inst.pitch = vocals.pitch = FlxG.save.data.playbackRate;
    scrollSpeed = scrollSpeed;
    if (FlxG.save.data.botplay) {
		player.cpu = true;
		cpu.cpu = true;
        botplayTxt.alpha = 1;
    } else {
        player.cpu = false;
        botplayTxt.alpha = 0;
    }
    if (FlxG.save.data.practice) canDie = canDadDie = false;
}

function onPostCountdown(e) {
    e.sound.pitch = FlxG.save.data.playbackRate;
}

function onSongEnd()
    FlxG.save.data.playbackRate = 1; // To prevent song freezing even though it can still happen, I truly don't know why.

// function destroy()
//     FlxG.save.data.playbackRate = 1;