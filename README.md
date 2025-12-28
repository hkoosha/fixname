# Fixname

Dumb bash script to rename files to a plain ascii subset (alphanum, dots and
underscores). This is a *good enough* script, not something I trust anything
serious with, specially if there are no backups.

```bash
$ ls -l
-rw-rw-r-- 1 user user   0 Feb 16 20:58 '[I'\''m rock-star-_ of Interneta] @we'\''re_so_cool_blablabla&i love you.jpg'

$ fixname '[I'm rOcK-stAr_-_ of Internet!!] @we're_so_cool_blablabla.jpg'
mv [I'm rock-star-_ of Internet!!] @we're_so_cool_blablabla.jpg \
  i_am_rock_star_of_interneta_we_are_so_cool_blablabla_and_i_love_you.jpg

$> ls -l
-rw-rw-r-- 1 user user   0 Feb 16 20:59 i_am_rock_star_of_interneta_we_are_so_cool_blablabla_and_i_love_you.jpg
```

