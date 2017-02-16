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
$> fixname '[I'm rOcK-stAr_-_ of Internet!!] @we're_so_cool_blablabla.jpg'
mv [I'm rock-star-_ of Internet!!] @we're_so_cool_blablabla.jpg \
  im_rock_star_of_interneta_were_so_cool_blablabla.jpg

$> ls -l
-rw-rw-r-- 1 user user   0 Feb 16 20:51 im_rock_star_of_interneta_were_so_cool_blablabla.jpg
```

**If there is already a unix tool which fixes file names, please let me know**
