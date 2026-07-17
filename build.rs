use std::env;
use std::path::PathBuf;
use std::process::Command;

fn main() {
    println!("cargo:rustc-link-search=linkscript");
    println!("cargo:rerun-if-changed=linkscript/link.x");
    println!("cargo:rerun-if-changed=linkscript/memory.x");
    println!("cargo:rerun-if-changed=linkscript/interrupt.x");

    let out_dir = PathBuf::from(env::var("OUT_DIR").unwrap());
    let obj_path = out_dir.join("vector_table.o");

    let status = Command::new("llvm-mc")
        .arg("-triple=thumbv7em-none-eabihf")
        .arg("-filetype=obj")
        .arg("-o")
        .arg(&obj_path)
        .arg("src/vector_table.s")
        .status()
        .expect("failed to assemble vector_table.s");

    assert!(status.success(), "llvm-mc failed to assemble vector_table.s");

    println!("cargo:rustc-link-arg=--whole-archive");
    println!(
        "cargo:rustc-link-arg={}",
        obj_path.display()
    );
    println!("cargo:rustc-link-arg=--no-whole-archive");
    println!("cargo:rerun-if-changed=src/vector_table.s");
}
