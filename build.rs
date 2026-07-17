fn main() {
    // Make link.x / memory.x discoverable to the linker.
    println!("cargo:rustc-link-search=.");

    // Re-link if either linker script changes.
    println!("cargo:rerun-if-changed=link.x");
    println!("cargo:rerun-if-changed=memory.x");
}
