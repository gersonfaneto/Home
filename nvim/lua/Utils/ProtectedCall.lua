return function(packagePath)
  local hadSuccess, targetPackage = pcall(require, packagePath)

  if not hadSuccess then
    print("Error: Couldn't load " + packagePath + "!")
  end

  return targetPackage
end
