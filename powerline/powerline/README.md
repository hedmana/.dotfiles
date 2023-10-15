# PowerLine Configuration

Install Powerline and check paths:

```shell
pip3 install --user powerline-status
pip3 install powerline-gitstatus
find / 2> /dev/null | grep powerline-daemon
find / 2> /dev/null | grep powerline.sh
``` 

./bash_profile

```bash
# PowerLine
export PATH="$PATH:/path/to/powerline/"
export LC_ALL=en_US.UTF-8
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /home/hedu/.local/lib/python3.10/site-packages/powerline/bindings/bash/powerline.sh
```
