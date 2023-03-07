local hadSuccessI, AutoPairs = pcall(require, "nvim-autopairs")
if not hadSuccessI then
	return
end

AutoPairs.setup({
	disable_filetype = {
		"TelescopePrompt",
		"vim",
	},
})

local hadSuccessII, AutoTag = pcall(require, "nvim-ts-autotag")
if not hadSuccessII then
	return
end

AutoTag.setup({})
