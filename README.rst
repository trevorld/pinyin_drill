Overview
--------

This is an R package and command line program to drill production and recognition of pinyin.  The program is tested to run in a Bash shell (in a Unicode locale) which should be available on most modern operating systems (i.e. "Bash on Ubuntu on Windows").  It probably runs fine in other \*Nix shells but should not be expected to run in the Windows Command Prompt.

Installation
------------

The ``pinyin_drill`` program in the ``exec`` folder is dependent on the command-line version of the VLC media player (namely ``cvlc``), ``cjknife`` command-line interface to cjklib, and the R programming language as well as the R add-on packages ``optparse``, ``dplyr``, ``scales``, and ``stringr``.  Below are the commands to install this package and the other dependencies on Debian/Ubuntu Linux (and probably also on Bash on Ubuntu on Windows).  For other \*nix environments (like OSX or Cygwin on Windows) replace ``apt install`` with your preferred package manager.::

    bash$ sudo apt install vlc r-base pip 
    bash$ sudo -H pip install cjklib
    bash$ sudo R
    > install.packages(c("devtools")) # manually select mirror
    > devtools::install_github("trevorld/pinyin_drill")
    > quit('no')

The executable Rscript ``exec/pinyin_drill`` can then be copied to a ``bin`` directory on your path if you like (R won't automatically add it on a path for you)::

    > file.copy(system.file("exec/pinyin_drill", package="PinyinDrillR"), "~/bin/pinyin_drill")

The program needs audio in a certain format (described below) in a folder specified by the ``-a, --audio_dir`` option (default ``audio``).  Depending on where you like your audio stored you may wish to create a bash (or other shell) alias for ``pinyin_drill``::

    alias pinyin_drill='pinyin_drill --audio_dir=/path/to/my/mandarin_audio_folder'

For personal and non-commercial you may use the following commands download an assembled "Collective Work" of Creative Commons licensed Mandarin audio already in the desired format::

    bash$ wget https://www.dropbox.com/s/0f01hiopxs6gixz/cc_mandarin_audio_pack.zip?dl=0 
    bash$ unzip cc_mandarin_audio_pack.zip

As an alternative you may use the following commands to download a smaller "Collective Work" comprised of just the "Free Cultural Works" contained in the previous audio pack that allow commercial use::

    bash$ wget https://www.dropbox.com/s/bh3ctzsgwbagbw0/fc_mandarin_audio_pack.zip?dl=0
    bash$ unzip fc_mandarin_audio_pack.zip

Usage
-----

Call ``pinyin_drill`` with the ``-help`` flag to get the built-in usage message::

    bash$ pinyin_drill --help

Examples
--------

Example Pinyin Recognition Drills
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Drill recognition of any pinyin you have audio for::

    bash$ pinyin_drill

Drill recognition of single syllables starting with various initials::

    bash$ pinyin_drill --initial1=b,p --nsyllables=1
    bash$ pinyin_drill --initial1=d,t --nsyllables=1
    bash$ pinyin_drill --initial1=g,k --nsyllables=1
    bash$ pinyin_drill --initial1=s,z,c --nsyllables=1
    bash$ pinyin_drill --initial1=j,q,x --nsyllables=1
    bash$ pinyin_drill --initial1=j,zh --nsyllables=1
    bash$ pinyin_drill --initial1=x,q,sh,ch --nsyllables=1
    bash$ pinyin_drill --initial1="'" --nsyllables=1

Drill recognition of single syllables ending with various finals::

    bash$ pinyin_drill --final1=u,v,un,vn --nsyllables=1

Drill recognition of various syllable endings that can appear in any syllable of a word::

    bash$ pinyin_drill --final=ar,er,enr 
    bash$ pinyin_drill --final=iar,ianr,iangr 

Drill recognition of various pinyin in any syllable of a word::

    bash$ pinyin_drill --pinyin=dian3
    bash$ pinyin_drill --pinyin=lia

Drill difference between far and fangr::

    bash$ pinyin_drill --pinyin="far,fangr" --nsyllables=1

Drill recognition of single syllables ending with second or third tone::

    bash$ pinyin_drill --tone1=2,3 --nsyllables=1

Drill recognition of tones of two syllable words::

    bash$ pinyin_drill --nsyllables=2

Example Pinyin Pronunciation Drills
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you use the ``-d`` flag it will first give you the pinyin of the upcoming word (so you could first pronounce it out loud or in your mind) and then play the audio to see if you were right.

Drill pronunciation of any pinyin you have audio for::

    bash$ pinyin_drill -d

Drill pronunciation only from Chinese Lessons Mandarin voice set (assuming downloaded)::

    bash$ pinyin_drill -d --filter=chinese_lessons

Drill pronunciation of zhi, chi, shi, ri::

    bash$ pinyin_drill -d --final1=r --nsyllables=1

Drill pronunciation of shi4 and shir4::

    bash$ pinyin_drill -d --pinyin=shi4,shir4

Drill pronunciation of si, ci, zi finals::

    bash$ pinyin_drill -d --final1=z --nsyllables=1

Drill pronunciation of r initial::

    bash$ pinyin_drill -d --initial1=r 

Drill pronunciation of two-syllables starting with third tone and ending with second tone::

    bash$ pinyin_drill -d --tone1=3 --tone2=2 --nsyllables=2

Drill pronunciation of all two-syllables words you have::

    bash$ pinyin_drill -d --nsyllables=2

一步一个脚印 Top 20 Most Common Pronunciation Errors
----------------------------------------------------

From http://carlgene.com/blog/2016/01/top-20-most-common-pronunciation-errors-by-chinese-learners/::

    bash$ pinyin_drill --pinyin=ri4,re4 --nsyllables=1
    bash$ pinyin_drill --pinyin=zang1,zhang1 --nsyllables=1
    bash$ pinyin_drill --pinyin=che4,ce4 --nsyllables=1
    bash$ pinyin_drill --pinyin=nu3,nv3 --nsyllables=1
    bash$ pinyin_drill --pinyin=qi1,chi1 --nsyllables=1
    bash$ pinyin_drill --pinyin=e4,er4 --nsyllables=1
    bash$ pinyin_drill --pinyin=tan2,tang2 --nsyllables=1
    bash$ pinyin_drill --pinyin=jin1,jing1 --nsyllables=1
    bash$ pinyin_drill --pinyin=mo1,mou1 --nsyllables=1
    bash$ pinyin_drill --pinyin=luan4,lun4 --nsyllables=1
    bash$ pinyin_drill --pinyin=quan2,qun2 --nsyllables=1
    bash$ pinyin_drill --pinyin=ran3,ruan3 --nsyllables=1
    bash$ pinyin_drill --pinyin=wang1 --nsyllables=1
    bash$ pinyin_drill --pinyin=wan1 --nsyllables=1
    bash$ pinyin_drill --pinyin=wen1 --nsyllables=1
    bash$ pinyin_drill --pinyin=weng1 --nsyllables=1
    bash$ pinyin_drill --pinyin=wo1 --nsyllables=1
    bash$ pinyin_drill --pinyin=yan1 --nsyllables=1
    bash$ pinyin_drill --pinyin=you1 --nsyllables=1
    bash$ pinyin_drill --pinyin=yong1 --nsyllables=1


Audio sources
-------------

This program will use any sound files (or perhaps symbolic links to sound files located elsewhere such as an Anki media folder) located in directory passed in by the ``-a, --audio`` flag (default ``audio``) named in the format ``optional_folder/pin1yin1_extra_info.mp3``.  Where ``optional_folder`` and ``_extra_info`` is ignored by the program but allows you distinguish multiple sound files for each pinyin.  Besides ``.mp3`` the file ending can be any format recognized by the VLC media player (such as ``.ogg``, ``.flac``, or ``.wav``).  Standard pinyin should be modified in these filenames in the following ways:

#) Instead of diacritics please use numbers at the end of each syllable to denote the tone including using a 5 at the end to mark the neutral tone e.g. shen2me5de5 and not shen2mede.
#) For erhua syllables put the erhua 'r' before the tone number e.g. zher4 not zhe4r5. 
#) If you want the program to recognize tone sandhi then apply any relevant tone sandhi e.g. ni2hao3 and not ni3hao3.
#) Replace any pinyin ü with a v and any pinyin ê with an eh (the latter is rather rare pinyin used only with interjections like some readings of 欸).

Pre-assembled Creative Commons Mandarin Audio Pack
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I've assembled a "Collective Work" of Creative Commons licensed Mandarin audio available as of 2017-07-03 from https://u14129277.dl.dropboxusercontent.com/u/14129277/cc_mandarin_audio_pack.zip .  It contains Mandarin audio from chinese-lessons.com, forvo.com, sinosplice.com, and shtooka.net.  See its `README <https://github.com/trevorld/mandarin_audio_utilities/blob/master/cc_README.rst>`__ for more info.

I've also assembled a "Collective Work" (which is a subset of the above "Collective Work") of just the "Free Cultural Works" Creative Commons licensed Mandarin audio (i.e. among other things allows commercial use) available as of 2017-07-04 from https://u14129277.dl.dropboxusercontent.com/u/14129277/fc_mandarin_audio_pack.zip .  It contains Mandarin audio from shtooka.net.  See its `README <https://github.com/trevorld/mandarin_audio_utilities/blob/master/fc_README.rst>`__ for more info.

Creative Commons Audio
~~~~~~~~~~~~~~~~~~~~~~

Some sources of Creative Commons licensed Mandarin audio files:

#) chinese-lessons.com "Mandarin voice soundset".  CC BY-NC-ND 3.0.  http://www.chinese-lessons.com/download.htm
#) Shtooka "Base Audio Libre De Mots Chinois (Congcong)".  CC-BY 3.0 US.  http://download.shtooka.net/cmn-balm-congcong_flac.tar
#) Shtooka "Base Audio Libre De Mots Chinois (Wei Gao and Vion Nicolas)".  CC-BY 2.0 FR.  http://download.shtooka.net/cmn-balm-hsk1_flac.tar
#) Shtooka "Collection Audio Libre De Mots Chinois (Yue Tan)".  CC-BY-SA 3.0 US.  http://download.shtooka.net/cmn-caen-tan_flac.tar
#) Sinosplice (John Pasden) "Tone Pair drills".  CC BY-NC-SA 2.5.  http://www.sinosplice.com/learn-chinese/tone-pair-drills
#) Forvo.  CC BY-NC-SA 3.0.  https://forvo.com/

Non-Creative Commons Audio
~~~~~~~~~~~~~~~~~~~~~~~~~~

Some sources of proprietary Mandarin audio files:

#) 400 Unique Sounds in Mandarin Chinese by Carl Gene: http://carlgene.com/blog/2016/01/400-unique-sounds-in-mandarin-chinese/
#) 625 Words Mandarin Word package by Gabriel Wyner:  https://fluent-forever.com/product/most-awesome-word-lists-ever-seen/
#) Mandarin Pronunciation Trainer package by Gabriel Wyner:  https://fluent-forever.com/product/fluent-forever-pronunciation-trainer/ 

Helper scripts
~~~~~~~~~~~~~~

The site https://github.com/trevorld/mandarin_audio_utilities has helper scripts to format some of the above audio sources into a format recognized by this program.

License
-------

``pinyin_drill`` is Copyright 2017-2018 by Trevor L. Davis and is licensed under the GPL version 2 or higher.  
