@echo off
title KD's win git-sh by Filip R
if defined ProgramFiles(x86) (
    set git= "C:\Program Files (x86)\Git\bin\git"
    set gitsh= "C:\Program Files (x86)\Git\bin\sh.exe"
) else (
    set git= "C:\Program Files\Git\bin\git"
    set gitsh= "C:\Program Files\Git\bin\sh.exe"
)

set file= "C:\git-sh\"

if not exist %file% (
    mkdir "C:\git-sh"
    call %git% clone https://github.com/rtomayko/git-sh.git "C:\git-sh"
)

set fileo= "C:\git-sh\o.bash"

if not exist %fileo% (
    copy C:\git-sh\git-sh.bash+C:\git-sh\git-sh-aliases.bash+C:\git-sh\git-completion.bash C:\git-sh\o.bash
)

cmd.exe /c "%gitsh% --login -i -- %fileo%"
