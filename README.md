# gui-ubuntu-os ⭐🚀
# Update 1.12.20

Run Ubuntu GUI on Android using Termux-X11 🖥️📱

## 🎉 What's New
- Fixed some bugs 🐛
- Added new features ✨
- Full [8GB] or Lite [2GB] choice 📦
- Improved performance ⚡
- ⚡ Smooth and fast GUI 🖥️
# 📸 Previwe
<img width="1600" height="720" alt="1000011367" src="https://github.com/user-attachments/assets/fe3892ae-e286-46d1-88e3-22795acdf09f" />


<p align="center"><b>Run Ubuntu gui in easiest way.</b></p>

# 🚀 Features 

- Run ubuntu in termux-x11

- Comes with much themes

- 🌐 2 Browsers (🦊 Firefox + 🌍 Falkon)

# 🧰 Requirements 


 - At least 2 GB of storage


 - Termux and 

 - Termux-x11 app


# 🛠️ Installation 
first install two apps 



1. Termux from  [HERE](https://github.com/termux/termux-app/releases/download/v0.119.0-beta.3/termux-app_v0.119.0-beta.3+apt-android-7-github-debug_arm64-v8a.apk)



2 Termux-x11 from 
[HERE](https://github.com/termux/termux-x11/releases/download/nightly/app-arm64-v8a-debug.apk)


3.Gboard from [Google play ](https://play.google.com/store/apps/details?id=com.google.android.inputmethod.latin)


Now run commands in termux↓



```
pkg update || true
```
```
pkg install git -y
```
```
git clone https://github.com/rbasry29-blip/gui-ubuntu-os
```




Then,  run



```
cd gui-ubuntu-os
```



```
chmod +x *
```



```
./cli.sh
```


If you want GUI , run



```
./gui.sh
```




## *Note 📌*
⚠️ GUI installation may take up to 2 hours
Depending on Device 

In any question,  only hit enter,  
You should have 6 gb + storage,  the installation may take 2 hour. 
Then,  restart your termux and run


```
server
```
Open another session,run


```
ubuntu 
```


then 

```
gui
```

If you want a full copy-paste command , use this -
```
pkg update || true
yes | pkg upgrade
pkg install git -y
git clone https://github.com/rbasry29-blip/gui-ubuntu-os
cd gui-ubuntu-os
chmod +x *
./cli.sh
./gui.sh
```
And go to termux-x11 app and
Enjoy
## ⭐ Support
*If this helped you, please give a star ⭐❤️‍🔥  
Your support keeps the project alive 🚀*

## Credit
This project utilizes proot-distro for managing and installing Linux distributions inside Termux.

proot-distro is an official project maintained by the Termux development team and is licensed under its respective open-source license.

Full credit for proot-distro goes to its original authors and contributors:
https://github.com/termux/proot-distro

This repository does not claim ownership of proot-distro and only uses it as a dependency.

# Stuck problem

If you stuck on 
```
setting up elementary-xfce-icon-theme
```
And in plocate
```
settting up plocate (intellizing database)
```
Then , hold "termux" app 


click on "app info"


click on "force stop" and "ok" .


Also clean the cache
then run in termux

```
cd PROOT-DISTRO-UBUNTU
./fix-stuck.sh
```
Then run
```
./gui.sh
```
# Termux-x11 setup 
 First , hold Termix-x11 app click on "PREFERENCES" ↓

 
 ![1000011387](https://github.com/user-attachments/assets/a87319be-5e8c-4b61-b5d7-0e4cda79d2ed)

 
click on "other"


 ![1000011388](https://github.com/user-attachments/assets/822ada0a-41e0-42ec-aa32-5cfcff0befdb)



click on "Configure response to user actions ↓"


![1000011390](https://github.com/user-attachments/assets/5213ed5b-41b1-43bb-a21f-ed2aa0ecad88)



click on "Volume up" ↓


![1000011389](https://github.com/user-attachments/assets/87233df9-2709-438e-b4e3-e5b0db15de1c)


select "toggle additional key bar " ↓


![1000011391](https://github.com/user-attachments/assets/b25a38b6-da04-40bb-9feb-9f0ba033b36b)



click on "Volume down" 


![1000011392](https://github.com/user-attachments/assets/31337b01-3c98-4b2d-95b6-f24132453791)


select "toggle soft Keyboard " ↓


![1000011393](https://github.com/user-attachments/assets/0b092744-6dcf-4e7c-b969-d50deee8fff4)


go back.  click on "Output" ↓


![1000011394](https://github.com/user-attachments/assets/1a59dcd3-fe37-4391-ac1f-795e5c29c8c6)



enable "Fullscreen"↓


![1000011395](https://github.com/user-attachments/assets/30519f6d-2d95-40b7-b8d6-d9f8f99329c2)


All done! 
Now set Gboard as default keyboard. Run in termux -

```
server
```

Open another session and run 

```
ubuntu
```
then run 
```
gui
```
inside ubuntu. 
Go to Termux-x11 app, press volume up for additional key bar.  Press volume down for key board 
for example ↓


<img width="1600" height="720" alt="1000011396" src="https://github.com/user-attachments/assets/903ce52f-3cef-45b7-9d6d-b50dea66b8e8" />



Enjoy !
