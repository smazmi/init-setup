1. export ZDOTDIR="$HOME"/.config/zsh put this in /etc/zsh/zprofile
2. make this directory $XDG_DATA_HOME/gnupg/
3. make this directory $XDG_CACHE_HOME/nv/
4. make this directory $XDG_DATA_HOME/nvm/
5. make this directory ~/.local/share/cargo/
6. make this directory ~/.local/share/rustup/
7. make this directory $XDG_CONFIG_HOME/parallel/
8. make this directory $XDG_CONFIG_HOME/npm/ and make a file named npmrc inside it with this content:

```npmrc
cache=${XDG_CACHE_HOME}/npm
init-module=${XDG_CONFIG_HOME}/npm/config/npm-init.js
logs-dir=${XDG_STATE_HOME}/npm/logs
```
9. make this directory $XDG_DATA_HOME/gradle/
10. make this directory $XDG_DATA_HOME/go/
11. make this directory $XDG_DATA_HOME/android/
12. make this file wgetrc at $XDG_CONFIG_HOME
13. make the cache folder for npm in $XDG_CACHE_HOME/npm/
14. make the init-module folder at $XDG_CONFIG_HOME/npm/config/ and make a file named npm-init.js
15. make the npm logs dir at $XDG_STATE_HOME/npm/logs/
16. make a file named node_repl_history in $XDG_DATA_HOME
17. make a folder in $HOME called python with a file named pythonrc with this code in it:


```python
def is_vanilla() -> bool:                                                                  
    import sys                                                                             
    return not hasattr(__builtins__, '__IPYTHON__') and 'bpython' not in sys.argv[0]       
                                                                                               
def setup_history():                                                                       
    import os                                                                              
    import atexit                                                                          
    import readline                                                                        
    from pathlib import Path                                                               
                                                                                               
    if state_home := os.environ.get('XDG_STATE_HOME'):                                     
        state_home = Path(state_home)                                                      
    else:                                                                                  
        state_home = Path.home() / '.local' / 'state'                                      
                                                                                               
    history: Path = state_home / 'python_history'                                          
                                                                                               
    readline.read_history_file(str(history))                                               
    atexit.register(readline.write_history_file, str(history))                             
                                                                                               
if is_vanilla():                                                                           
    setup_history()  

```

18. make a file named zlua in $XDG_DATA_HOME

### zsh Plugins to install
zsh-autopair
fzf-tab

plugins to be git pulled in $ZSH/custom/plugins:
[zsh auto pair](https://github.com/hlissner/zsh-autopair)
[fzf tab](https://github.com/Aloxaf/fzf-tab)
[fzf-docker](https://github.com/pierpo/fzf-docker)
