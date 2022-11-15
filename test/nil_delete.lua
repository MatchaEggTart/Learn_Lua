tab1 = { key1 = "val1", key2 = "val2", "val3" }
for key, value in pairs(tab1) do
    print(key .. " - " .. value)
end

print("\nAfter use nil to delete key1...\n")

tab1.key1 = nil
for key, value in pairs(tab1) do
    print(key .. " - " .. value)
end
