#[macro_use] extern crate rocket;

use enigo::*;
use std::{thread, time};

// TODO: get overall screen width and height of primary monitor
const SCREEN_WIDTH: i32 = 2560;
const SCREEN_HEIGHT: i32 = 1440;

#[get("/")]
fn hello() -> &'static str {
    "Hello, world!"
}

#[post("/jump")]
fn meow() -> &'static str {
    "Hello, world!"
}

#[launch]
fn rocket() -> _ {
    rocket::build().mount("/", routes![hello, meow])
}

// -> (x_screen, y_screen)
fn screen_coords_from_ratio(x: f32, y: f32) -> (i32, i32) {
    ((SCREEN_WIDTH as f32 * x) as i32, (SCREEN_HEIGHT as f32 * y) as i32)
}

// fn main() {
//     let mut enigo = Enigo::new();
//     let coords = screen_coords_from_ratio(0.5, 0.5);
//     println!("{:?}", coords);
//     enigo.mouse_move_to(coords.0, coords.1);
//     let sec = time::Duration::from_secs(1);
//     thread::sleep(sec);
//     enigo.mouse_down(MouseButton::Left);
//     enigo.mouse_up(MouseButton::Left);
// }

    // enigo.key_sequence("hello world");
    // enigo.mouse_move_relative(100, 100);

