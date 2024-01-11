(module
  (import "env" "DYNAMICTOP_PTR" (global i32))
  (global (mut i32) (global.get 0))
  (func (export "_start") (;3480;)
    global.get 1
    drop
  )
)