function gi
	curl -sL https://www.gitignore.io/api/(string join ',' $argv)
end
