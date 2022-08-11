mod game;

use gdnative::prelude::{godot_init, InitHandle};

fn init(handle: InitHandle) {
    handle.add_class::<game::Game>();
}

godot_init!(init);
