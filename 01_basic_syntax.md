# 基础语法

## 交互式编程

* Lua提供了交互式编程模式，即输入命令返回结果
  * HOW（进入）
    * 命令行 输入 lua 或 lua -i 来启动交互式变成模式

  * 退出
    * 输入 CTRL+Z 或者 CTRL+C

## 脚本式编程

* 即 helloWorld.lua 文件（即脚本），使用 lua 运行

* 如何使 脚本文件变成系统指令
  * HOW
    * 在脚本文件开头输入 #!/usr/local/bin/lua

  * EXAMPLE
    * test/bin_helloWorld.lua

      ``` lua
      #!/usr/local/bin/lua
      print("Hello World!")
      ```

    * 添加权限

      ``` shell
      chmod +x bin_helloWorld.lua
      ```

    * 运行该脚本

      ``` shell
      ./bin_helloWorld.lua
      ```

## 注释

* 单行注释

  * HOW

    ``` lua
    --
    ```

* 多行注释

  * HOW

    ``` lua
    -- [[
      注释内容
    -- ]]

## 标识符

* 标识符
  * WHAT
    * 标示符以一个字母 A 到 Z 或 a 到 z 或下划线 _ 开头后加上0个或多个字母，下划线，数字（0到9）
    * 不要使用下划线加大写字母的标识符，这是 Lua 保留字格式（_VERSION）
    * @ $ % 不要用来定义标识符

## 关键词

* 关键词
  * WHAT
    * Lua 保留关键字不能作为常量或变量或其他用户自定义标示符

      ``` lua
      -- [[
      and, break, do, else, elseif, end, false, for, function, if, in, local, nil, not, or, repeat, return, then, true, until, while
      --]]
      ```

## 全局变量

* 全局变量
  * WHAT
    * 在默认情况下，变量总是认为是全局的
    * 全局变量不需要声明
    * 可以创建一个没有初始化的变量，它的值会是 nil

      ``` lua
      print(b)
      nil
      ```

* 删除变量
  * WHAT
    * 将变量赋值为 nil

  * HOW

    ``` lua
    b = nil
    print(b)
    ```
