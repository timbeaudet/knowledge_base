# Day of Learning Git

https://learngitbranching.js.org/

* `git reset` can be used on LOCAL branches to rewrite history as if a commit (or more) never took place.
* `git revert` will keep history, but place the previous contents in the next commit. So running revert when at c2 `c0 -> c1 -> c2` will make `c0 -> c1 -> c2 -> c2'` where `c2'` has identical contents to `c1` and anything that was added in `c2` is now gone, but still in the history.
