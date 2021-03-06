# The summary of beast2 test and history

## The frequency of classes being changed

Run the [script](https://github.com/garybernhardt/dotfiles/blob/master/bin/git-churn) 
below in terminal to get _class.freq.text_, which contains the number of __commits__ associated with each file:

```batch
git log --all -M -C --name-only --format='format:' "$@" | sort | grep -v '^$' | uniq -c | sort -n | awk 'BEGIN {print "count\tfile"} {print $1 "\t" $2}' > class.freq.text
```

## The frequency of classes associated to unique issues

Run the script [genIssueDist.sh](https://github.com/CompEvol/beast2report/blob/master/genIssueDist.sh) 
from the beast2 repository directory to generate the following two files:
   * issue_files: a sorted list of files affected by issue related commits, and
   * issue_dist: a table containing the number of issues related to each file

To place an upper bound on the age of commits considered by the script, use the `--since DATE` command line
parameter.  For example, to consider only those commits in the
last year (assuming the current date is June 2016) use

    ./genIssueDist.sh --since 06/2015


## Code coverage of Beast 2 Unit tests

The report is generated by Interllij [code coverage](https://www.jetbrains.com/help/idea/2016.1/code-coverage.html), 
and the quick view of the final report without css is [here](http://htmlpreview.github.com/?https://github.com/CompEvol/beast2report/blob/master/code_coverage/index.html), 
or check out to local to view with better style.

The screen shot of code coverage generated on 30 May 2016 is:
![Image of code coverage](https://github.com/CompEvol/beast2report/blob/master/figures/code-coverage-2016-05-30.png)
