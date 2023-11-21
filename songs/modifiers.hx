/* 
   Script by APurples
   If you wish to add this to your mod, you have full permission to do so as long as you credit me.
*/ 

import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxColor;

var botplayTxt:FlxText;

var startDrain:Bool == false;
var startPoison:Bool == false;

function create(){
    botplayTxt = new FlxText(400, 83, FlxG.width - 800, "Botplay", 40);
    botplayTxt.setFormat(Paths.font("vcr.ttf"), 40, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    botplayTxt.scrollFactor.set();
    botplayTxt.borderSize = 1.25;
    botplayTxt.alpha = 0;
    botplayTxt.cameras = [camHUD];
    if (FlxG.save.data.botplay) add(botplayTxt);
}

function update(elapsed){
    if (FlxG.save.data.botplay) player.cpu = true;

    if (FlxG.save.data.noMiss && misses > 0) health -= 2;

    if (FlxG.save.data.earthquake){
        camGame.shake(0.0025 * FlxG.save.data.earthquakeMult, inst.length, null, true);
        camHUD.shake(0.0025 * FlxG.save.data.earthquakeMult, inst.length, null, true);
    }

    if (startPoison){
        if (!PlayState.opponentMode){
            {health -= 0.00025 * FlxG.save.data.poisonMult;}
        }else{
            {health += 0.00025 * FlxG.save.data.poisonMult;}
        }
    }
}

function postCreate(){
    inst.pitch = FlxG.save.data.playbackRate;
    vocals.pitch = FlxG.save.data.playbackRate;
    
    if (FlxG.save.data.practice) canDie = canDadDie = false;

    if (FlxG.save.data.enableSS) scrollSpeed = FlxG.save.data.customScrollSpeed;
}

function postUpdate(){
    if (startDrain){
        if (FlxG.save.data.healthDrain){
            if (!PlayState.opponentMode){
                if (health > 0.1) {health -= 0.000125 * FlxG.save.data.healthDrainMult;}
            }else{
                if (health > 0.1) {health += 0.000125 * FlxG.save.data.healthDrainMult;}
            }
        }
    }
}

function onPlayerMiss(){
    if (FlxG.save.data.poison){
        startPoison = true;
        if (!PlayState.opponentMode){
            healthBar.createFilledBar(0xFFFF0000, 0xFF8B33FF);
            iconP1.color = 0xFF8B33FF;
            boyfriend.color = 0xFF8B33FF;
        }else{
            healthBar.createFilledBar(0xFF8B33FF, 0xFFFF0000);
            iconP2.color = 0xFF8B33FF;
            dad.color = 0xFF8B33FF;
        }    

        new FlxTimer().start(FlxG.save.data.poisonTimer, function(tmr:FlxTimer){
            startPoison = false;
            if (!PlayState.opponentMode){
                healthBar.createFilledBar(0xFFFF0000, 0xFF66FF33);
                FlxTween.color(iconP1, 1, 0xFF8B33FF, 0xFFFFFFFF);
                FlxTween.color(boyfriend, 1, 0xFF8B33FF, 0xFFFFFFFF);
            }else{
                healthBar.createFilledBar(0xFF66FF33, 0xFFFF0000);
                FlxTween.color(iconP2, 1, 0xFF8B33FF, 0xFFFFFFFF);
                FlxTween.color(dad, 1, 0xFF8B33FF, 0xFFFFFFFF);
            }    
        });
    }
}

function onSongStart(){
    startDrain = true;
    FlxTween.tween(botplayTxt, {y: 115}, 1, {ease: FlxEase.sineInOut, type: 4});
    FlxTween.tween(botplayTxt, {alpha: 1}, 1);
}