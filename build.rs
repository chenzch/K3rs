use std::env;

fn main() {
    println!("cargo:rustc-link-search=linkscript");
    println!("cargo:rerun-if-changed=linkscript/link.x");
    println!("cargo:rerun-if-changed=linkscript/memory.x");
    println!("cargo:rerun-if-changed=linkscript/interrupt.x");
    let _ = env::var("OUT_DIR").unwrap();
}
