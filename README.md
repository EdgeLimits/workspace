# EdgeLimits::workspace

MacOS environment. 
Homebrew + Iterm2 + Oh-My-ZSH + p10k + neovim

## 0.

* git
* brew


```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Add Homebrew To Path
After installing, add it to the path (replace ”[username]” with your actual username):

```
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/[username]/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```



## 1. 

```
git submodule update --recursive
```

```
chmod +x setup.sh config.sh
```

```
./setup.sh
```

```
./config.sh
```


NVIM formatting:

https://www.youtube.com/watch?v=ybUE4D80XSk