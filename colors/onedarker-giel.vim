lua << EOF
for k in pairs(package.loaded) do
  if k:match(".*onedarker-giel.*") then package.loaded[k] = nil end
end

require('onedarker-giel').setup()

EOF
