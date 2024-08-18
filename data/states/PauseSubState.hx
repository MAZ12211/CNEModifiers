function create() {
    menuItems.insert(2, 'Toggle Botplay');
    menuItems.insert(3, 'Toggle Practice Mode');
}

function postUpdate() {
    if (controls.ACCEPT) {
        if (menuItems[curSelected] == "Toggle Botplay") {
            FlxG.save.data.botplay = !FlxG.save.data.botplay;
        }
        if (menuItems[curSelected] == "Toggle Practice Mode") {
            FlxG.save.data.practice = !FlxG.save.data.practice;
            // TODO: It's hard to know if the player is in practice mode or not so have a "Practice Mode" text at the top right
        }
    }
}