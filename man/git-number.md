git-number(1) -- Use numbers for dealing with files
===================================================

## SYNOPSIS

`git-number` [&lt;subcommand&gt; [&lt;numbers&gt;...]]

## DESCRIPTION

  Working faster with git repositories.

## OPTIONS

  &lt;subcommand&gt;

  A git subcommand or external program executed by `git-number` that will operate on files represented by &lt;numbers&gt;. By default, `git-number` assumes that &lt;subcommand&gt; is a git command (`git-add`, `git-am`, `git-commit`, ...), but allows to run external programs by prepending a hyphen to &lt;subcommand&gt;. If no &lt;subcommand&gt; is given, `git-number` shows the working tree status including the file's numbers.

  &lt;numbers&gt;...

  A whitespace-separated list of numbers that represent the filenames to the passed to &lt;subcommand&gt;. `git-number` also recognizes number ranges using the syntax '`start`,`end`'. For example, '2,5' is equivalent to '2 3 4 5'. In no &lt;numbers&gt; is given, is the same as passing all filenames that have differences between the index file and the current HEAD commit.

## EXAMPLES

  Show the working tree status (similar to `git-status`'s short-format) prepending each filename with its respective number.

    $ git number

    1 M  Readme.md
    2 A  bin/git-number
    3 ?? man/git-number.md

  Execute git &lt;subcommand&gt; using file's numbers instead of filenames.

    $ git number add 3
    # runs 'git add man/git-number.md'

    $ git number

    1 M  Readme.md
    2 A  bin/git-number
    3 A  man/git-number.md

  You also can execute external commands using file's numbers. For this, just prepend &lt;subcommand&gt; a hyphen.

    $ git number -vi 2
    # will execute 'vi bin/git-number'

  Additionally, you can pass multiple file numbers to &lt;subcommand&gt; at once.

    $ git number commit 1 2 3 4 7

  And, you can even use ranges to speed up your coding. Thus, the previous command is similar to:

    $ git number commit 1,4 7

  Finally, if you dont pass any number to &lt;subcommand&gt; is equivalent to pass all of them.

    $ git number add
    # will stage all files

## ALIASING

  An extra boost in your productivity can be reached using git aliases. Suggested aliases:

    [alias]
      s = number
      a = number add
      vi = number -vi

  Note: 's' stands for status since `git-number` output is similar to `git-status` when no args are passed to it.

## AUTHOR

Written by Jonhnny Weslley &lt;<jw@jonhnnyweslley.net>&gt;

## REPORTING BUGS

&lt;<http://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<http://github.com/visionmedia/git-extras>&gt;
