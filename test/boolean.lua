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
