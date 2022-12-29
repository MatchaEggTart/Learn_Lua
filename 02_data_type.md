# 数据类型

## Lua 数据类型

* 数据类型
  * WHAT

    数据类型|描述
    ---|---
    nil|这个最简单，只有值nil属于该类，表示一个无效值（在条件表达式中相当于false）
    boolean|包含两个值：false和true。
    number|表示双精度类型的实浮点数
    string|字符串由一对双引号或单引号来表示
    function|由 C 或 Lua 编写的函数
    userdata|表示任意存储在变量中的C数据结构
    thread|表示执行的独立线路，用于执行协同程序
    table|Lua 中的表（table）其实是一个"关联数组"（associative arrays），数组的索引可以是数字、字符串或表类型。在 Lua 里，table 的创建是通过"构造表达式"来完成，最简单构造表达式是{}，用来创建一个空表

* 查看数据类型
  * HOW

    ``` lua
    print(type("Hello world"))      --> string
    print(type(10.4*3))             --> number
    print(type(print))              --> function
    print(type(type))               --> function
    print(type(true))               --> boolean
    print(type(nil))                --> nil
    print(type(type(X)))            --> string
    ```

* nil（空）
  * WHAT
    * nil 类型表示一种没有任何有效值，它只有一个值 -- nil，例如打印一个没有赋值的变量，便会输出一个 nil 值
    * 对于全局变量和 table，nil 还有一个"删除"作用，给全局变量或者 table 表里的变量赋一个 nil 值，等同于把它们删掉
    * nil值作比较时需要加双引号（a == "nil"）
  
  * EXAMPLE（删除功能）
    * test/02_nil_delete.lua

      ``` lua
      tab1 = { key1 = "val1", key2 = "val2", "val3" }
      for key, value in pairs(tab1) do
          print(key .. " - " .. value)
      end

      print("\nAfter use nil to delete key1...\n")

      tab1.key1 = nil
      for key, value in pairs(tab1) do
          print(key .. " - " .. value)
      end

      -- 测试 table 类型
      print("\n\ntest table data type\n")
      tab2 = { key1 = 'a', key2 = 'b', 'c', 'd' }
      for key, value in pairs(tab2) do
          print(key .. " - " .. value)
      end
      ```

      结果

      ``` shell
      1 - val3
      key1 - val1
      key2 - val2

      After use nil to delete key1...

      1 - val3
      key2 - val2


      test table data type

      1 - c
      2 - d
      key1 - a
      key2 - b
      ```

* boolean
  * WHAT
    * boolean 类型只有两个可选值：true（真） 和 false（假），Lua 把 false 和 nil 看作是"假"，其他的都为"真"

  * EXAMPLE
    * test/03_boolean.lua

      ``` lua
      print("true 的类型: ", type(true))
      print("false 的类型: ", type(false))
      print("nil 的类型: ", type(nil))

      if false or nil then
        print("至少有一个是 true")
      else
        print("false 和 nil 都是 false")
      end

      if 0 then
        print("数字0 是 true")
      else
        print("数字0 是 false")
      end
      ```

      结果

      ``` shell
      true 的类型:    boolean
      false 的类型:   boolean
      nil 的类型:     nil
      false 和 nil 都是 false
      数字0 是 true
      ```

* number
  * WHAT
    * Lua 默认只有一种 number 类型 -- double（双精度）类型（默认类型可以修改 luaconf.h 里的定义），以下几种写法都被看作是 number 类型

  * EXAMPLE
    * test/04_number.lua

      ``` lua
      print(type(2))
      print(type(2.2))
      print(type(0.2))
      print(type(2e+1))
      print(type(0.2e-1))
      print(type(7.8263692594256e-06))
      ```

      结果

      ``` shell
      number
      number
      number
      number
      number
      number
      ```

* string
  * WHAT
    * 字符串由一对 双引号" " 或 单引号' ' 和 两个 方括号 [[ ]] 来表示
    * 在对一个数字字符串上进行算术操作时，Lua 会尝试将这个数字字符串转成一个数字
    * 字符串连接使用的是 ..
    * 使用 # 来计算字符串的长度，放在字符串前面

  * EXAMPLE
    * test/05_string.lua

      ``` lua
      -- 单引号，双引号，2个方括号 都可以视作字符串
      string1 = 'this is string1'
      string2 = "this is string2"

      html = [[
      <html>
      <head><head/>
      <body>
        <a href="http://www.runoob.com/">菜鸟教程</a>
      </body>
      </html>
      ]]

      print(string1..'\n')
      print(string2..'\n')
      print(html..'\n\n')

      -- Lua 会 尝试将 数字字符串 转变成 一个数字
      print("\"2\" + 6 = " .. "2" + 6)
      print("\"2\" + \"6\" = " .. "2" + "6")
      print("\"2 + 6\" = " .. "2 + 6")
      print("\"-2e2\" * \"6\" = " .. "-2e2" * "6")
      print("\"error\" + 1\" = " .. "error" + 1)

      -- 字符串连接符号 是 ..
      a = '1'
      b = '2'
      print(a .. '+' .. b .. ' = ' .. a + b)

      -- # 用来计算字符串长度
      print('sizeof(string1)' .. #string1)
      print('sizeof(string2)' .. #string2)
      print('sizeof(html)' .. #html)
      ```

      结果

      ``` shell
      this is string1

      this is string2

      <html>
      <head><head/>
      <body>
        <a href="http://www.runoob.com/">菜鸟教程</a>
      </body>
      </html>

      "2" + 6 = 8
      "2" + "6" = 8
      "2 + 6" = 2 + 6
      "-2e2" * "6" = -1200.0
      lua: 05_string.lua:23: attempt to add a 'string' with a 'number'
      stack traceback:
              [C]: in metamethod 'add'
              05_string.lua:23: in main chunk
              [C]: in ?

      1+2 = 3
      sizeof(string1)15
      sizeof(string2)15
      sizeof(html)96
      ```

* table