# Как запустить проект
## For linux (in terminal):
/usr/bin/google-chrome-stable /usr/share/man/man1/google-chrome-stable.1.gz (это путь где установлен ваш Хром) --disable-web-security --disable-gpu --user-data-dir=~/chromeTemp.
## For Windows:
Open the start menu
Type windows+R or open “Run”
Execute the following command: chrome.exe --user-data-dir="C://Chrome dev session" --disable-web-security
## Start Angular project:
ng serve --host 0.0.0.0 --o --proxy-config proxy.conf.json