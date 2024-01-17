```sh
/tmp/binaryen-report/global_get_elem_init wat2wasm index.wat && wat2wasm env.wat  && wasm-merge --enable-reference-types index.wasm index env.wasm env -o merged.wasm && wasm-opt --enable-reference-types --enable-gc --simplify-globals merged.wasm -o opt.wasm && wasm2wat opt.wasm
```
