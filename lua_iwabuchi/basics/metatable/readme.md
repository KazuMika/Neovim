<!--
 FileName:      readme
 Author:        8ucchiman
 CreatedDate:   2023-06-24 00:23:09
 LastModified:  2023-01-25 10:56:12 +0900
 Reference:     8ucchiman.jp
 Description:   ---
-->



A metatable can be defined like
```lua
local t = setmetatable({}, {
  __tostring = function() return 'custom tostring behavior!' end
})
```

Here are the metamethods that you can define, and their behavior

## Operators

**In an argument signature like `f(a, b)`, `a` and `b` don't necessarily have to be instances of your metatable. One of them will always be, but not necessarily the first. Beware!**

### Calculation operators

- `__add(a, b)`: the addition (+) operation. If any operand for an addition is not a number, Lua will try to call a metamethod. It starts by checking the first operand (even if it is a number); if that operand does not define a metamethod for `__add`, then Lua will check the second operand. If Lua can find a metamethod, it calls the metamethod with the two operands as arguments, and the result of the call (adjusted to one value) is the result of the operation. Otherwise, if no metamethod is found, Lua raises an error.
- `__sub(a, b)`: the subtraction (-) operation. Behavior similar to the addition operation.
- `__mul(a, b)`: the multiplication (\*) operation. Behavior similar to the addition operation.
- `__div(a, b)`: the division (/) operation. Behavior similar to the addition operation.
- `__unm(a)`: the negation (unary -) operation. Behavior similar to the addition operation.
- `__mod(a, b)` _(Lua 5.1)_: the modulo (%) operation. Behavior similar to the addition operation.
- `__pow(a, b)` _(Lua 5.1)_: the exponentiation (^) operation. Behavior similar to the addition operation.
- `__idiv(a, b)` _(Lua 5.3)_: the floor division (//) operation. Behavior similar to the addition operation.

### Bitwise operators _(Lua 5.3)_

- `__band(a, b)`: the bitwise AND (&) operation. Behavior similar to the addition operation, except that Lua will try a metamethod if any operand is neither an integer nor a float coercible to an integer (see [§3.4.3](https://www.lua.org/manual/5.4/manual.html#3.4.3)).
- `__bor(a, b)`: the bitwise OR (|) operation. Behavior similar to the bitwise AND operation.
- `__bxor(a, b)`: the bitwise exclusive OR (binary ~) operation. Behavior similar to the bitwise AND operation.
- `__bnot(a)`: the bitwise NOT (unary ~) operation. Behavior similar to the bitwise AND operation.
- `__shl(a, b)`: the bitwise left shift (<<) operation. Behavior similar to the bitwise AND operation.
- `__shr(a)`: the bitwise right shift (>>) operation. Behavior similar to the bitwise AND operation.

### Equation operators
- `__eq(a, b)`: the equal (==) operation. Behavior similar to the addition operation, except that Lua will try a metamethod only when the values being compared are either both tables or both full userdata and they are not primitively equal. The result of the call is always converted to a boolean.
- `__lt(a, b)`: the less than (<) operation. Behavior similar to the addition operation, except that Lua will try a metamethod only when the values being compared are neither both numbers nor both strings. Moreover, the result of the call is always converted to a boolean.
- `__le(a, b)`: the less equal (<=) operation. Behavior similar to the less than operation.

### Misc operators
- `__concat(a, b)`: the concatenation (..) operation. Behavior similar to the addition operation, except that Lua will try a metamethod if any operand is neither a string nor a number (which is always coercible to a string).
- `__len(a)` _(Lua 5.1)_: the length (#) operation. If the object is not a string, Lua will try its metamethod. If there is a metamethod, Lua calls it with the object as argument, and the result of the call (always adjusted to one value) is the result of the operation. If there is no metamethod but the object is a table, then Lua uses the table length operation (see [§3.4.7](https://www.lua.org/manual/5.4/manual.html#3.4.7)). Otherwise, Lua raises an error.

## Behavioral methods

### Indexing

- `__index`: The indexing access operation `table[key]`. This event happens when `table` is not a table or when `key` is not present in `table`. The metavalue is looked up in the metatable of `table`.
    The metavalue for this event can be either a function, a table, or any value with an `__index` metavalue. If it is a function, it is called with `table` and `key` as arguments, and the result of the call (adjusted to one value) is the result of the operation. Otherwise, the final result is the result of indexing this metavalue with `key`. This indexing is regular, not raw, and therefore can trigger another `__index` metavalue.
    **Examples**:
    ```lua
    local tab1 = {foo = 'bar'}
    local tab2 = setmetatable({}, {__index = tab1})
    
    print(tab2.foo) --> 'bar'
    ```
    ```lua
    local tab = setmetatable({count = 0}, {
      __index = function(self, _k)
        self.count = self.count + 1
        return self.count
      end
    })
    
    print(tab.index) --> 1
    print(tab.indexagain) --> 2
    print(tab.asdfasdf) --> 3
    print(tab[1234]) --> 4
    ```
- `__newindex`: The indexing assignment `table[key] = value`. Like the index event, this event happens when `table` is not a table or when `key` is not present in `table`. The metavalue is looked up in the metatable of `table`.
    Like with indexing, the metavalue for this event can be either a function, a table, or any value with an `__newindex` metavalue. If it is a function, it is called with `table`, `key`, and `value` as arguments. Otherwise, Lua repeats the indexing assignment over this metavalue with the same key and value. This assignment is regular, not raw, and therefore can trigger another `__newindex metavalue.`
    Whenever a `__newindex` metavalue is invoked, Lua does not perform the primitive assignment. If needed, the metamethod itself can call rawset to do the assignment.
    **Examples:**
    ```lua
    t = setmetatable({}, {
      __newindex = function(t, key, value)
        if type(value) == 'number' then
          rawset(t, key, value * value)
        else
          rawset(t, key, value)
        end
      end
    })

    t.foo = 'foo'
    t.bar = 4
    t.la = 10
    print(t.foo) --> 'foo'
    print(t.bar) --> 16
    print(t.la) --> 100
    ```

### Calling

- `__call(args)`: The call operation `func(args)`. This event happens when Lua tries to call a non-function value (that is, `func` is not a function). The metamethod is looked up in `func`. If present, the metamethod is called with `func` as its first argument, followed by the arguments of the original call (`args`). All results of the call are the results of the operation. This is the only metamethod that allows multiple results.

### Garbage collection & memory management

- `__mode`: Controls how "weak" a table is. If present, must be one of the following strings: `"k"`, for a table with weak keys; `"v"`, for a table with weak values; or `"kv"`, for a table with both weak keys and values.
  A table with weak keys and strong values is also called an ephemeron table. In an ephemeron table, a value is considered reachable only if its key is reachable. In particular, if the only reference to a key comes through its value, the pair is removed. (see [§2.5.4](https://www.lua.org/manual/5.4/manual.html#2.5.4))
- `__close(value, err?)` _(Lua 5.4)_: Called when a variable is closed (see [§3.3.8](https://www.lua.org/manual/5.4/manual.html#3.3.8)).
- `__gc()`: Called when the the garbage collector detects that the corresponding table or userdata is dead. See [§2.5.3](https://www.lua.org/manual/5.4/manual.html#2.5.3)

### Misc

- `__tostring()`: If the metatable of `v` has a `__tostring` field, then `tostring` calls the corresponding value with `v` as the argument, and uses the result of the call as its result. Otherwise, if the metatable of `v` has a `__name` field with a string value, tostring may use that string in its final result.
- `__metatable`: Changes the behavior of `getmetatable`. If object does not have a metatable, returns `nil`. Otherwise, if the object's metatable has a `__metatable` field, returns the associated value. Otherwise, returns the metatable of the given object.
- `__name`: Used very rarely internally (see [`luaL_newmetatable`](https://www.lua.org/manual/5.4/manual.html#luaL_newmetatable)) and by `tostring()` if the `__tostring` metamethod is missing.
- `__pairs()`: Affects iteration when using the `pairs()` function, letting you define a custom iterator function (see [`pairs()`](https://www.lua.org/manual/5.4/manual.html#pdf-pairs), [`next()`](https://www.lua.org/manual/5.4/manual.html#pdf-next)).

## References

https://www.lua.org/manual/5.4/manual.html#2.4

https://ebens.me/post/lua-metatables-tutorial/

https://www.lua.org/versions.html

https://www.lua.org/manual/5.4/contents.html#index
