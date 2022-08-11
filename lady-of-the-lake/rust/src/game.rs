use gdnative::api::*;
use gdnative::prelude::*;

#[derive(NativeClass)]
#[inherit(Node)]
pub struct Game {}

#[methods]
impl Game {
    fn new(_owner: &Node) -> Self {
        godot_print!("Game is created!");
        Game {}
    }
}
