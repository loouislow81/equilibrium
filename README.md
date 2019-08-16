# equilibrium

> Time machine backup solution for Linux, Mac

I wrote this because my working place has a terribly bad IT culture. 'equilibrium' helps me incrementally backup changes on my primary drive to other drives. You can put it on cronjob as well.

- `backup` is an init script.
- `equilibrium` is a core application script.

### _features

- each backup volume is determined by date.
- continuously resume backup with marker system.
- auto generates path to the latest backup volume.
- auto remove residual files and directories.

### _install

```bash
$ cp -r backup /usr/local/bin
$ cp -r equilibrium /usr/local/bin
```

### _configure

edit script file `backup` and change whatever necessary on your system,

```bash
# configurations
export USER="yourname"
export HOME="/path/to/backup/destination"
BACKUP_DIR="${HOME}/.backup"
DEST_DIR="usr-${USER}"
MEDIUM="${HOME}"
BACKUP_SOURCE="/path/to/backup/target"
BACKUP_DESTINATION="${MEDIUM}/.backup/${DEST_DIR}"
BACKUP_SIZE="/dev/sdb1"
FLTR_FOLDER_1="Downloads"
FLTR_FOLDER_2="Music"
FLTR_FOLDER_3="Videos"
FLTR_FOLDER_4="Pictures"
FLTR_FOLDER_5="log"
FLTR_FOLDER_6="Public"
FLTR_FOLDER_7=".cache"
LOG="/home/${USER}/.log/backup.log"
```

*(!!)* you might also need to manually create new `backup.marker` file at destination backup folder.

### _run

simply,

```bash
$ sudo backup
```

or add to `cronjob` as example,

```bash
@monthly sudo /usr/local/bin/backup
@weekly sudo /usr/local/bin/backup
```

---

MIT License

Copyright (c) 2018 Loouis Low

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
