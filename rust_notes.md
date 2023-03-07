# Rust Notes

## From Rust In Action
- The exclamation point in something such as `println!()` indicates it's a macro, not that it destructive, unsafe, or mutating state. A macro returns code rather than values.
- Rust is not object oriented. It does not support inheritance.
- A closure is also known as an anonymous function or a lambda function
- An underscore in a type, such as `Vec<_>` indicates that the compiler should infer the type
- Binary `b011`, Hex: `0x12C`
- `300_i32 as i8` returns 44, because the max `i8` is 127, so it wraps around twice and the remainder is 44.
- Use the `Num` crate for special math types like complex numbers, fixed decimal numbers, or arbitrary size ints
- Avoid `while` for looping forever. Instead, use `loop`. `loop` continues until a `break` keyword is encountered.
- Use the `clap` crate for command line arguments
- Arrays are fixed length, `Vec` is variable length.
- `new` is not a keyword in Rust, it's just a convention to use it.
- A `let` variable can still have interior mutability, such as with an `Arc`, whereas a `const` variable all mutation, even on its interior. At the compiler level, `let` relates more to aliasing than to immutability.
- By default all items in a crate are private, expose something for an importer of your crate to use with the `pub` keyword.
- For `println` to work on a custom `struct`, implement the `Display` trait for your struct:
```rust
impl Display for MyStruct {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
    }
}
```

## Result and Option
- `Option` is `Some(_)` or `None`. `Result` is `Ok(_)` or `Error`
- `unwrap` can be used on `Option` and `Result` objects. It crashes the program in the error branch.
- Instead of using `assert!` to panic on a condition, use [anyhow::ensure](https://docs.rs/anyhow/latest/anyhow/macro.ensure.html) to return an `Error`

## Ownership
- `&` is the reference operator. `*` is the dereference operator. They're unitary operators. A reference means that we're borrowing the data.
- LEARN MORE: A struct method that takes `fn my_func(&self)` is borrowing self, whereas `fn my_func(self)` is moves self.
- `iter()` iterates over the items by reference, `into_iter()` iterates over the items and moves them into the new scope, `iter_mut()` iterates over the items, giving a mutable reference to each item.
- For loop types:
```rust
for item in container {
    // ownership access
}
// Trying to access container after this for loop won't work
for item in &container {
    // ready-only
}
// You can still access container here
for item in &mut collection {
    // Read-write
}
```

## Strings
- Strings are guaranteed to be encoded in UTF8
- `String` and `&str` are different types and have different functions to interact with them. `str` is a bare bones high performance type. `String` is a fully featured type, typically want to use that.
- Convert from `&str` to String:
```rust
let s_str = "hello";
let s_string = s_str.to_string(); // convert the &str to String
```
- Convert from `String` to `&str`:
```rust

```
- String uses dynamic memory allocation.
- `&str` is a "string slice" and can only be allocated by reference. It's borrowed data, considered read-only.
- Single quotes gives a value of type `char`. Stored as 4 bytes.


## Types
- `!` is the `Never` type and indicates that a function should never returns, such as if it should crash, or a function with an infinite loop that should never stop.
- The newtype pattern is to define a struct with the type we want: `struct Hostname(String)` and now we can use this to differentiate hostnames from other `String`s: `fn connect(host: Hostname)`

### Algebraic Data Types
- The type `()` is called [unit](https://doc.rust-lang.org/std/primitive.unit.html). A unit type has only one one value, compared to a bool which has two possible values, etc.
- A type system supports algebraic data types if [these](https://stackoverflow.com/q/45065518/529743) type operations hold

### Generics
- A `trait` says, if you want to be something, then you must implement these things to work as that something.
- A function can be made generic in type by writing: `fn add<T: std::ops::Add<Output = T>>(i: T, j: T)`, and this specifies that `T` must implement the `Add` trait so that we can perform addition on instances of `T`.

## Concurrency and Parallelism
- Rust's `std::future` provides the standard async/await syntax. The `futures` library provides everything needed to operate on parallel futures. `tokio` is built on `futures`.

## Lifetimes
- lifetime elision = all references have an attached lifetime. When they can be inferred by the compiler they can be elided, or not explicitly written.
- Lifetimes are written with tic marks, like `'a`. For example: `fn add<'a, 'b>(i: &'a i32, j: &'b i32) -> i32`. This binds the lifetime variable `a` to the variable `j`.
- `'static` lifetime is special - ???

## Performance
- [This](https://doc.rust-lang.org/cargo/reference/profiles.html#overflow-checks) is a good reference on build flags

## Documentation
- Documentation comments start with `///` or `//!`. Use `//!` at the top of a module to document the entire module. Use `///` elsewhere in the module.

## Learn More
- `borrow`, `move`, and `copy`, move semantics
- `Box`, `Rc`, and `Arc`
- hygienic macros
- lifetimes like `'a`

## References
- [Fixing Python Performance with Rust](https://blog.sentry.io/2016/10/19/fixing-python-performance-with-rust/)
- [Rewriting the heart of our sync engine](https://dropbox.tech/infrastructure/rewriting-the-heart-of-our-sync-engine)
- [npm core written in Rust](https://www.infoq.com/news/2019/03/rust-npm-performance/)
