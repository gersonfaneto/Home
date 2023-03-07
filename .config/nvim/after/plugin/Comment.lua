local hadSuccess, Comment = pcall(require, "Comment")
if not hadSuccess then
	return
end

Comment.setup()
