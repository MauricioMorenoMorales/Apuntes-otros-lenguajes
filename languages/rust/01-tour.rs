fn build_vector() -> vec<i16> {
  let mut v: Vec<i16> = Vec::<i16>::new();
  v.push(10i16);
  v.push(10i16);
  v
}
// This can be infered with only this

fn build_vector2() -> vec<i16> {
  let mut v: Vec::new();
  v.push(10);
  v.push(20);
  v;
}

// Types

f32 f64 // fLoating

(char, u8, i32) // Tuple mixed types
() // Unit empty tuple

struct S { x: f32, y: f32 } // Named-field struct

struct T (i32, char); // Struct type tuple
struct E // Unit like struct
