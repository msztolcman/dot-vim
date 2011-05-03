" importy ogólne, przydatne funkcje, etc

if !has('python')
    echo "Error: Required vim compiled with +python"
    finish
endif

python << EOF
import commands
import os, os.path
import re
#import subprocess
import sys
import types

import vim

def MDP_System (cmd):
#p   = subprocess.Popen (cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
#ret = list (p.communicate ())
#ret.insert (0, p.returncode)
#return ret
    #return (0, '')
    return commands.getstatusoutput (cmd)


def MDP_GetFileType (default=None):
    ft = vim.eval ('&ft')
    if not ft:
        if vim.current.buffer.name:
            ft = os.path.splitext (vim.current.buffer.name)
            if len (ft) > 1:
                ft = ft[1][1:].lower ()
            else:
                ft = default
        else:
            ft=default

    return ft

def MDP_GetHiFileType (default=None):
    ft = vim.eval ('synIDattr(synID(line("."), col("."), 1), "name")')
    if ft:
        m = re.findall (r'^([a-z]+)', ft)
        if m:
            return m[0]
    if not ft:
        ft = default

    return ft

EOF

" MDP_Commentify - komentowanie wierszy
python << EOF
MDP_Commentify_ftypes = {
    'perl':         '# ',
    'python':       '# ',
    'ruby':         '# ',
    'php':          '# ',
    'shell':        '# ',
    #'php':         ('/* ', ' */'),
    'html':         ['<!-- ', ' -->'],
    'javascript':   '// ',
    'js':           '// ',
    'cs':           '// ',
    'vim':          '" ',
    'hs':           '-- ',
    'css':          ['/* ', ' */'],
    'c':            '// ',
    'cpp':          '// ',
    'java':         '// ',
    'lua':          '-- ',
}
MDP_Commentify_ftypes['haskell'] = MDP_Commentify_ftypes['hs']
MDP_Commentify_ftypes['xml'] = MDP_Commentify_ftypes['xhtml'] = MDP_Commentify_ftypes['html']

def _MDP_Commentify_Escape (data):
    if isinstance (data, (list, tuple)):
        data = [re.escape (c) for c in data]
    else:
        data = re.escape (data)
    return data

def _MDP_Commentify_Comment (line, cmt):
#   if not line.strip ():
#       return line

    if isinstance (cmt, (list, tuple)):
        return cmt[0] + line + cmt[1]
    else:
        return cmt + line

def _MDP_Commentify_UnComment (line, cmt):
    if not line.strip ():
        return line

    cmt = _MDP_Commentify_Escape (cmt)
    if isinstance (cmt, (list, tuple)):
        if cmt[0].endswith (' '):
            cmt[0] += '?'
        if cmt[1].startswith (' '):
            cmt[1] += '?'
        rxp = r'^(\s*)%s(.*?)%s(\s*)' % tuple (cmt)
        return re.sub (rxp, r'\1\2\3', line, 1)
    else:
        if cmt.endswith (' '):
            cmt += '?'
        rxp = r'^(\s*)%s(.*)' % cmt
        return re.sub (rxp, r'\1\2', line, 1)

def _MDP_Commentify_Switch (line, cmt):
    cmt2 = _MDP_Commentify_Escape (cmt)
    if isinstance (cmt2, (list, tuple)):
        if cmt2[0].endswith (' '):
            cmt2[0] += '?'
        if cmt2[1].startswith (' '):
            cmt2[1] += '?'
        rxp = r'^\s*%s.*%s\s*' % tuple (cmt2)
    else:
        if cmt2.endswith (' '):
            cmt2 += '?'
        rxp = r'^\s*%s' % cmt2

    if re.match (rxp, line):
        return _MDP_Commentify_UnComment (line, cmt)
    else:
        return _MDP_Commentify_Comment (line, cmt)

def MDP_Commentify_RangeExecute (fun):
    ft = MDP_GetFileType ()
    cmt = MDP_Commentify_ftypes.get (ft, '# ')

    rng = str (vim.current.range)
    rng = re.findall (r'\((\d+):(\d+)\)', rng)[0]

    start, stop = int (rng[0])-1, int (rng[1])
    if (start == stop):
        vim.current.buffer[start] = fun (vim.current.buffer[start], cmt)
    else:
        for lineno in xrange (start, stop):
            vim.current.buffer[lineno] = fun (vim.current.buffer[lineno], cmt)

EOF

function! MDP_Commentify_Comment ()
    python MDP_Commentify_RangeExecute (_MDP_Commentify_Comment)
endfunction
map <silent> <F3> :call MDP_Commentify_Comment()<CR>

function! MDP_Commentify_UnComment ()
    python MDP_Commentify_RangeExecute (_MDP_Commentify_UnComment)
endfunction
map <silent> <S-F3> :call MDP_Commentify_UnComment()<CR>

function! MDP_Commentify_Switch ()
    python MDP_Commentify_RangeExecute (_MDP_Commentify_Switch)
endfunction
map <silent> <F2> :call MDP_Commentify_Switch()<CR>

" MDP_Run_Script - uruchamianie pisanych skryptów/programów
python << EOF
MDP_Run_Script_ftypes = {
    'ruby':     ['ruby %(fname)s %(params)s', ],
    'python':   ['python2.6 -tt %(fname)s %(params)s', ],
    'perl':     ['perl5.10.0 %(fname)s %(params)s', ],
    'sh':       ['bash %(fname)s %(params)s', ],
    'txt':      ['bash %(fname)s %(params)s', ],
    'php':      ['php -f %(fname)s %(params)s', ],
    'cs':       [('gmcs %(fname)s -out:%(exe)s 2>&1', 'mono %(exe)s %(params)s'), 'exe', ],
    'd':        [('rebuild -oqobj %(fname)s', '%(exe)s %(params)s'), '', ],
    'java':     [('javac -Xlint %(fname)s', 'java %(exe)s %(params)s'), lambda f: os.path.splitext (os.path.basename (f))[0], ],
    'bf':       ['bf %(fname)s'],
    'hs':       [('ghc -o %(exe)s %(fname)s', './%(exe)s'), lambda f: os.path.splitext (os.path.basename (f))[0]],
    'c':        [('gcc -W -Wall -o %(exe)s %(fname)s', './%(exe)s %(params)s'), lambda f: os.path.splitext (os.path.basename (f))[0]],
    'cpp':      [('g++ -W -Wall -o %(exe)s %(fname)s', './%(exe)s %(params)s'), lambda f: os.path.splitext (os.path.basename (f))[0]],
    'lua':      ['lua %(fname)s %(params)s'],
}
MDP_Run_Script_ftypes['haskell'] = MDP_Run_Script_ftypes['hs']
MDP_Run_Script_ftypes['rb'] = MDP_Run_Script_ftypes['ruby']

def MDP_Execute ():
    cmd_data = MDP_Run_Script_ftypes.get (MDP_GetFileType (), '')
    if not cmd_data:
        print 'Unknown filetype to execute'
        return

    if not isinstance (cmd_data[0], (list, tuple)):
        cmd_data[0] = ( cmd_data[0], )

    data = dict (
        fname   = vim.current.buffer.name,
        params  = ' '.join (vim.eval ('a:000')),
        exe     = vim.current.buffer.name,
    )

    # jesli trzeba, to wyszukujemy wersje exe
    if len (cmd_data) >= 2:
        if isinstance (cmd_data[1], str):
            tmp = os.path.splitext (data['fname'])[0]
            if cmd_data[1]:
                tmp += '.' + cmd_data[1]
            data['exe'] = tmp
        elif isinstance (cmd_data[1], types.FunctionType):
            data['exe'] = cmd_data[1] (data['fname'])

    print "Wykonujemy komendy:"
    print "\n".join ( [c % data for c in cmd_data[0]] )
    print "Wyniki:"
    for c in cmd_data[0]:
        res = MDP_System (c % data)
        print 'Kod powrotu:', res[0]
        # print 'STDOUT:'
        print res[1].replace ("\t", '    ')
        # print 'STDERR:'
        # print res[2].replace ("\t", '    ')

EOF

" a:0 - liczba argumentów nienazwanych
" a:000 - lista tych argumentów
" for s in a:000 - iterowanie po nich
function! MDP_Execute (...)
    python MDP_Execute ()
endfunction
command! -nargs=* Exe call MDP_Execute (<q-args>)
map <C-e> :call MDP_Execute ()<cr>

" MDP_TODO_List - Wyszukanie wszystkich pozycji TODO i FIXME
python << EOF
MDP_TODO_List_rxp = re.compile (r'''[ \t]*(#[ \t]*(FIXME|TODO)\b:?[ \t]+(?:.*\r?\n(?:[ \t]*#[ \t]*.*\r?\n)*))''', re.I|re.M)

def MDP_TODO_List ():
    # read buffer content
    fc = "\n".join (vim.current.buffer)

    todo = []
    fixme = []
    for entry in MDP_TODO_List_rxp.findall (fc):
        item = entry[0].strip ()
        if entry[1].lower () == 'todo':
            todo.append (item)
        else:
            fixme.append (item)

    i = 1

    print 'FIXME:'
    for item in fixme:
        print str (i) + '.'
        print item
        i += 1

    print 'TODO:'
    for item in todo:
        print str (i) + '.'
        print item
        i += 1

    # ask for function he want to go
    choice = vim.eval ('input ("Which one: ")')
    try:
        if choice == '':
            return
        choice = int (choice) - 1
    except:
        print 'Incorrect value'
        return

    try:
        choice = fixme[choice]
    except IndexError:
        try:
            choice = todo[choice - len (fixme)]
        except IndexError:
            print 'Incorrect value'
            return

    # find file offset
    pos = fc.find (choice)
    if pos < 0:
        print >>sys.stderr, "Some error occured."
        return

    # and go there
    vim.command ('goto '+str (pos+1))

EOF

function! MDP_TODO_List()
    python MDP_TODO_List()
endfunction
map <silent> <F7> :call MDP_TODO_List ()<CR>

" Find file in current directory and edit it.
" function! Find(name)
"  let l:list=system("find . -name '".a:name."' | perl -ne 'print \"$.\\t$_\"'")
"  let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
"  if l:num < 1
"    echo "'".a:name."' not found"
"    return
"  endif
"  if l:num != 1
"    echo l:list
"    let l:input=input("Which ? (CR=nothing)\n")
"    if strlen(l:input)==0
"      return
"    endif
"    if strlen(substitute(l:input, "[0-9]", "", "g"))>0
"      echo "Not a number"
"      return
"    endif
"    if l:input<1 || l:input>l:num
"      echo "Out of range"
"      return
"    endif
"    let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
"  else
"    let l:line=l:list
"  endif
"  let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
"  execute ":e ".l:line
"endfunction
"command! -nargs=1 Find :call Find("")

"python << EOL
"def Finder(*args):
"    start_dir = vim.eval('getcwd()')
"    find_cmd = (r'find %s -iname "*%s*" ! -name "*.svn*" -type f -printf %%p:1:-\\n' % (start_dir, args[0]))
"    vim.command("cgete system('%s')" % find_cmd)
"    vim.command('botright copen')
"EOL
"command! -nargs=1 Find :py Finder("")
"
"map! <C-f> <Esc>:Find
"map  <C-f> :Find
"
