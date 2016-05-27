#!/bin/bash

echo -n "Extracting names of files affected by issue-related commits..."
for issue in `git log --oneline | grep -E -o '#[0-9]+' | sort | uniq`; do
    issueNum=`echo $issue | cut -d# -f2`
    for commit in `git log --oneline | grep -E $issue'([^0-9]|$)' | cut -d' ' -f1`; do
        for file in `git show --oneline $commit --name-only | tail -n+2`; do
            echo $issueNum $file
        done
    done
done > issue_files
echo "done"

echo -n "Computing unique issue association count for each file..."
echo "file count" > issue_dist
for file in `cut -d' ' -f2- < issue_files | sort | uniq`; do
    issueCount=`awk '{if ($2=="'$file'") print $1}' < issue_files | sort | uniq | wc -l`
    echo $file $issueCount
done >> issue_dist
echo "done"
