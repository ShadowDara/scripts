# scripts

Hey, here i collected some script for windows myself, feel free to use them!

If you like them, it would be really cool if you star the repository!

```
:'######::'########::::'###::::'########::
'##... ##:... ##..::::'## ##::: ##.... ##:
 ##:::..::::: ##:::::'##:. ##:: ##:::: ##:
. ######::::: ##::::'##:::. ##: ########::
:..... ##:::: ##:::: #########: ##.. ##:::
'##::: ##:::: ##:::: ##.... ##: ##::. ##::
. ######::::: ##:::: ##:::: ##: ##:::. ##:
:......::::::..:::::..:::::..::..:::::..::
```

Feel free to add something via fork :)


## Scripts

| Name | Requirements | Codefile |
|:--:|:--:|:--:|
| [change file edittime](#change-file-edittime) | windows 10 / 11 | [003](codefiles/003_change_file_edittime.ps1) |
| [change file extension](#change-file-extension) | windows 10 / 11 | [002](codefiles/002_change-file-extension.ps1) |
| [edittime to filename](#edittime-to-filename) | windows 10 / 11| [001](codefiles/001_edittime-to-filename.ps1) |
| [run without Admin Rights](#run-without-admin-rights) | windows 10 / 11 | - |
| [wifi password](#wifi-password) | windows 10 / 11 | - |


## Other

| Name | Requirements | Codefile |
|:--:|:--:|:--:|
| [Autorun for USB](#autorun-for-usb) | windows | - |


```
:'######:::'######::'########::'####:'########::'########::'######::
'##... ##:'##... ##: ##.... ##:. ##:: ##.... ##:... ##..::'##... ##:
 ##:::..:: ##:::..:: ##:::: ##:: ##:: ##:::: ##:::: ##:::: ##:::..::
. ######:: ##::::::: ########::: ##:: ########::::: ##::::. ######::
:..... ##: ##::::::: ##.. ##:::: ##:: ##.....:::::: ##:::::..... ##:
'##::: ##: ##::: ##: ##::. ##::: ##:: ##::::::::::: ##::::'##::: ##:
. ######::. ######:: ##:::. ##:'####: ##::::::::::: ##::::. ######::
:......::::......:::..:::::..::....::..::::::::::::..::::::......:::
```


## change file edittime

This is a file to change the edittime of a file.

- you need a powershell terminal installed for this! *(but on the windows it is usally installed)*

### How

- **Download the [`change_file_edittime.ps1`](codefiles/003_change_file_edittime.ps1) file**

- *copy it in the folder with the files you need to change the edit time*

- then run the file with `Powershell` *(rightclick -> run with Powershell)*!


## change file extension

This is a file to change the file extensions of *(all)* files in the same folder.

- you need a powershell terminal installed for this! *(but on the windows it is usally installed)*

### How

- **Download the [`change_file_extension.ps1`](codefiles/change_file_extension.ps1) file**

- *copy it in the folder with the files you need to change the extension*

- then run the file with `Powershell` *(rightclick -> run with Powershell)*!

- first type the old extension, then the new one

- the script will rename every file with the old to the new extension.


## edittime to filename

add the edit time in front of a filename

Format: YYYY-MM-DD

Code [here](codefiles/001_edittime-to-filename.ps1)

Run the File with Powershell in same Folder as the files you want to rename!


## run without Admin Rights

run `.exe` file and ignore the admin rights!

### How to

*pls consider this does not work for every programm, for example it is working for **steam.***

1. create a new text file and paste the code down below
2. change "`file.exe`" in the `.bat` file to the name your `.exe` file *(in the preview `.bat` file it is the steamsetup)*
3. These 2 files must be in the same folder
4. safe the textfile with `.bat` as file extension
5. double click to run the `.bat` file

```bat
@echo off

@rem ==================================================
@rem
@rem Run without Admin Rights
@rem
@rem A Batch Script which allows to run a programm with
@rem bypassing administrator rights
@rem
@rem Credits Shadowdara
@rem https://github.com/shadowdara/scripts
@rem
@rem ==================================================

set __COMPAT_LAYER=RunAsInvoker
start steamsetup.exes

echo Finished
echo
echo Credit and More:
echo https://github.com/shadowdara/scripts

@pause
```


## wifi password

This is a simple trick to read the already saved / registrated wlan / wifi passwords from your computer

### How to do it

***Important***

- you need to have the password alrealy registered in your computer
- you need to know your SSID *(the name of the wifi / wlan, e.g. `FritzBox1`)*

You can although copy the code downbelow and safe it as a `.bat` file, after running, it will display all saved in the terminal, *but this is optional.*


**Now start**

1. open `cmd.exe` *(search it via the search bar)*

2. type in `netsh wlan show profile SSID key=clear`

3. replace `SSID` with your network name

4. scroll down to **security settings**

5. search for **Key Content**, this is the saved password

```bat
@echo off

@rem ==================================================
@rem
@rem a script to read all saved SSIDs
@rem
@rem script written by Shadowdara
@rem https://github.com/shadowdara/scripts
@rem
@rem ==================================================

setlocal EnableDelayedExpansion

for /f "tokens=2 delims=:" %%A in ('netsh wlan show profiles ^| findstr "Profil"') do (
    set "profilename=%%A"
    set "profilename=!profilename:~1!"

    echo -----------------------------
    echo Profil: !profilename!
    netsh wlan show profile name="!profilename!" key=clear | findstr "Schlüsselinhalt"
)
echo -----------------------------

echo
echo Script ended
echo
echo Credit and More:
echo https://github.com/shadowdara/scripts

@pause
```


```
:'#######::'########:'##::::'##:'########:'########::
'##.... ##:... ##..:: ##:::: ##: ##.....:: ##.... ##:
 ##:::: ##:::: ##:::: ##:::: ##: ##::::::: ##:::: ##:
 ##:::: ##:::: ##:::: #########: ######::: ########::
 ##:::: ##:::: ##:::: ##.... ##: ##...:::: ##.. ##:::
 ##:::: ##:::: ##:::: ##:::: ##: ##::::::: ##::. ##::
. #######::::: ##:::: ##:::: ##: ########: ##:::. ##:
:.......::::::..:::::..:::::..::........::..:::::..::
```


## Autorun for USB

This a code configgering USB-Sticks and running programms automatically with them

```ini
[autorun]
icon=Dara.ico
label="117GB"
open=start.bat
```

**Explanation**
- `icon` defines the used icon for the device in the explorer
- `label` is the used name of the device
- `open` is used to open a file, for example a `.bat` file *(but this feature is
normally disabled now)*


## Credits

Creator: Shadowdara

<details><summary>License: MIT</summary><pre>
MIT License

Copyright (c) 2025 ShadowDara

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
</pre></details>

**License only applies for republishing the code, not for using**

```
'########:::::'###::::'########:::::'###::::
 ##.... ##:::'## ##::: ##.... ##:::'## ##:::
 ##:::: ##::'##:. ##:: ##:::: ##::'##:. ##::
 ##:::: ##:'##:::. ##: ########::'##:::. ##:
 ##:::: ##: #########: ##.. ##::: #########:
 ##:::: ##: ##.... ##: ##::. ##:: ##.... ##:
 ########:: ##:::: ##: ##:::. ##: ##:::: ##:
........:::..:::::..::..:::::..::..:::::..::
```

*sorry, i really like these ascii banners* ;)

Credit Ascii banner: <a href="https://manytools.org/hacker-tools/ascii-banner/">manytools.org/hacker-tools/ascii-banner</a>

Font: Banner3D
