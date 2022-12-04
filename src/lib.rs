use std::error::Error;
use reqwest::blocking::get;

#[no_mangle]
pub extern fn test() {
    let resp = get("https://httpbin.org/ip").expect("Can't get").text().expect("Can't read");
    println!("{:#?}", resp);
    println!("Hello, world!");
}

fn main() {}