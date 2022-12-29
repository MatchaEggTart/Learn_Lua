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
-- print("\"error\" + 1\" = " .. "error" + 1)

-- 字符串连接符号 是 ..
a = '1'
b = '2'
print(a .. '+' .. b .. ' = ' .. a + b)

-- # 用来计算字符串长度
print('sizeof(string1)' .. #string1)
print('sizeof(string2)' .. #string2)
print('sizeof(html)' .. #html)
