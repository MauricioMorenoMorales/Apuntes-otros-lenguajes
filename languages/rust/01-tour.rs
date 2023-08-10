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

