```sh
# this is fine
~/binaryen-report/unreachable_missing wat2wasm unreachable.wat && wasm-merge unreachable.wasm bug -o merged.wasm && wasm-validate merged.wasm
~/binaryen-report/unreachable_missing wat2wasm unreachable.wat && wasm-merge unreachable.wasm bug -S -o merged.wat && wat2wasm merged.wat
# this is not fine
merged.wat:11:3: error: type mismatch in implicit return, expected [i32] but got []
  (loop $label$1
  ^
~/binaryen-report/unreachable_missing cat merged.wat
(module
 (type $0 (func (param i32 i32) (result i32)))
 (memory $0 1)
 (export "_start" (func $0))
 (func $0 (param $0 i32) (param $1 i32) (result i32)
  (drop
   (i32.load
    (local.get $0)
   )
  )
  (loop $label$1
   (br $label$1)
  )
 )
)
```

It seems the cause is that unreachable is missing in textual emit case.