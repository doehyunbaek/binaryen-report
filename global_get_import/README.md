```sh
~/binaryen-report/global_get_import wat2wasm index.wat && wat2wasm env.wat  && wasm-merge index.wasm index env.wasm env -o merged.wasm && wasm2wat merged.wasm
merged.wasm:0000019: error: global variable out of range: 1 (max 1)
```

It seems like in the resulting binary `merged.wasm`, global's initialization expression is still `global.get 0`, which is out of range. Reversing the two global declarations is also problematic with the error `initializer expression can only reference an imported global`.
```wat
  (global (;0;) (mut i32) (global.get 1))
``````
