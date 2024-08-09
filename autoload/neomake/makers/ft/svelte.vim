" vim: ts=4 sw=4 et
function! neomake#makers#ft#svelte#EnabledMakers() abort
    return ['svelte_check', 'eslint']
endfunction

function! neomake#makers#ft#svelte#svelte_check() abort
    let root_dir = fnamemodify(neomake#utils#FindGlobFile('svelte.config.js'), ':h')
    let maker = {
                \ 'exe': 'svelte-check',
                \ 'args': ['--output', 'machine', '--threshold', 'error', '--tsconfig', root_dir .. '/jsconfig.json', '--workspace', root_dir],
                \ 'append_file': 0,
                \ 'errorformat':
                    \ '%E\\d%\\+ ERROR \"%f\" %l:%c \"%m\",' .
                    \ '%W%\\d%\\+ WARNING \"%f\" %l:%c \"%m\",' .
                    \ '%-G%.%#',
                \ }
    return maker
endfunction

function! neomake#makers#ft#svelte#eslint() abort
    return neomake#makers#ft#javascript#eslint()
endfunction
