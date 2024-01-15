/* 
   Script by APurples
   If you wish to add this to your mod, you have full permission to do so as long as you credit me.
*/

/** TODOS:
    - Make playback rate a number-based in options menu instead of in-game
    to not break other mods using E and Q keys.
    - Remove scroll speed option as playback rate does is objectivefully the better job for it
**/

var botplayTxt, playbackRateTxt:FunkinText;

function postCreate(){
    if (FlxG.save.data.botplay) {
        botplayTxt = new FunkinText(400, 83, FlxG.width - 800, "Botplay", 40);
        botplayTxt.scrollFactor.set();
        botplayTxt.alignment = "center";
        botplayTxt.borderSize = 2;
        botplayTxt.alpha = 0;
        botplayTxt.cameras = [camHUD];
        add(botplayTxt);
    }

    if (FlxG.save.data.playbackRate != 1) {
        playbackRateTxt = new FunkinText(Std.int(healthBarBG.width / 1.75), healthBarBG.y - 100, 600, "Playback Rate: " + FlxG.save.data.playbackRate +"x", 23.5);
        playbackRateTxt.scrollFactor.set();
        playbackRateTxt.alignment = "center";
        playbackRateTxt.borderSize = 2;
        playbackRateTxt.alpha = 1;
        playbackRateTxt.cameras = [camHUD];
        add(playbackRateTxt);
    }

    if (FlxG.save.data.practice) canDie = canDadDie = false;
}

function postUpdate() {
    inst.pitch = vocals.pitch = FlxG.save.data.playbackRate;
    scrollSpeed = scrollSpeed;
    if (FlxG.save.data.botplay) {
		player.cpu = true;
		cpu.cpu = true;
	}
}

function onSongStart() {
    if (FlxG.save.data.botplay) {
        FlxTween.tween(botplayTxt, {y: 115}, 1, {ease: FlxEase.sineInOut, type: 4}); // type 4 means looping
        FlxTween.tween(botplayTxt, {alpha: 1}, 1);
    }
}

function onSongEnd()
    FlxG.save.data.playbackRate = 1; // To prevent song freezing even though it can still happen, I truly don't know why.

function destroy()
    FlxG.save.data.playbackRate = 1; // So it doesn't break scripts + more safer to change it every restart instead of saving your change