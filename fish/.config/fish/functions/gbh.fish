function gbh
	if count $argv > /dev/null
git branch --sort=-committerdate | head -n $argv
else
git branch --sort=-committerdate
end
end
