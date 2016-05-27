# The summary of beast2 test and history

## The frequency of classes being changed

Run the [script](https://github.com/garybernhardt/dotfiles/blob/master/bin/git-churn) 
below in terminal to get _class.freq.text_, which contains the number of __commits__ associated with each file:

```batch
git log --all -M -C --name-only --format='format:' "$@" | sort | grep -v '^$' | uniq -c | sort -n | awk 'BEGIN {print "count\tfile"} {print $1 "\t" $2}' > class.freq.text
```

## The frequency of classes associated to unique issues

Run the [script](https://github.com/CompEvol/beast2report/blob/master/genIssueDist.sh) 
below in terminal to get *issue_dist.text*, which contains the number of __unique issues__ associated with each file.
