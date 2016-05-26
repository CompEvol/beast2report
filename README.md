# The summary of beast2 test and history

## The frequency of classes being changed

Run the [script](https://github.com/garybernhardt/dotfiles/blob/master/bin/git-churn) below in terminal to get _class.freq.text_
```batch
git log --all -M -C --name-only --format='format:' "$@" | sort | grep -v '^$' | uniq -c | sort -n | awk 'BEGIN {print "count\tfile"} {print $1 "\t" $2}' > class.freq.text
```


