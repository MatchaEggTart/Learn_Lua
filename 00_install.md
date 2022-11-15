# 安装

## [Lua](http://www.lua.org/)

* 安装

  * 安装指令

    ``` shell
    cd ~/Downloads
    sudo su
    curl -R -O http://www.lua.org/ftp/lua-5.4.4.tar.gz
    tar zxf lua-5.4.4.tar.gz
    cd lua-5.4.4
    make all test
    ```

* 检测版本

  * 指令

    ``` shell
    lua -i
    ```

* 老规矩，Hello World

  * 指令

    ``` shell
    nv helloWorld.lua
    ```

    ``` lua
    print("Hello World!")
    ```

  * 执行

    ``` shell
    lua helloWorld
    ```
