# fixname

Simple bash script to rename crazy file names with stupid character to a sane one.

This is a 10 minute quick hack to sort out files and directories in my home folder.
and it works *good enough* (I have not lost any files past few months).

Use it wisely and with caution. It's just a wrapper around `mv`. Edge cases are 
not handled (files beginning with a dot). Even referencing files in child 
directorirs wont work:

```bash
$ fixname aDir/someFile.so # a_dir wont exist!

mv aDir/someFile.so a_dir/some_file.so
mv: cannot move 'aDir/someFile.so' to 'a_dir/some_file.so': No such file or directory
```

# Example:

```
$> ls -l
-rw-rw-r-- 1 user user   0 Feb 16 20:58 '[I'\''m rock-star-_ of Interneta] @we'\''re_so_cool_blablabla&i love you.jpg'

$> fixname '[I'm rOcK-stAr_-_ of Internet!!] @we're_so_cool_blablabla.jpg'
mv [I'm rock-star-_ of Internet!!] @we're_so_cool_blablabla.jpg \
  i_am_rock_star_of_interneta_we_are_so_cool_blablabla_and_i_love_you.jpg

$> ls -l
-rw-rw-r-- 1 user user   0 Feb 16 20:59 i_am_rock_star_of_interneta_we_are_so_cool_blablabla_and_i_love_you.jpg
```

I'm and We're are converted to 'i-am' and 'we-are' (a underscore actually, not dash).
'&' is converted to 'and'.

**If there is already a unix tool which fixes file names, please let me know**
