function gunwip
	git log -n 1 | grep -q -c "\-\-wip\-\-"
git reset HEAD~1
end
