local found_package, mini_surround = pcall(require, "mini.surround")

if found_package then
  vim.b.minisurround_config = {
    custom_surroundings = {
      s = {
        input = { "%~%~().-()%~%~" },
        output = { left = "~~", right = "~~" },
      },
      i = {
        input = { "%*().-()%*" },
        output = { left = "*", right = "*" },
      },
      b = {
        input = { "%*%*().-()%*%*" },
        output = { left = "**", right = "**" },
      },
      l = {
        input = { "%[().-()%]%(.-%)" },
        output = function()
          local link = mini_surround.user_input("Link: ")

          return { left = "[", right = "](" .. link .. ")" }
        end,
      },
    },
  }
end
