# AquilaUAV_pc

Это репозиторий для настройки рабочего окружения c Nvidia Jetson JetPack 4.5.1 на Nvidia Jetson Nano.



### Установка Ubuntu 18.04

Скачиваем с [официального сайта](https://releases.ubuntu.com/18.04/) Desktop image: 

https://releases.ubuntu.com/18.04/ubuntu-18.04.5-desktop-amd64.iso 

После записываем на свободный USB накопитель с помощью [balenaEtcher](https://www.balena.io/etcher/)

Загружаемся, устанавливаем, радуемся Ubuntu. Мануалов по установке Ubuntu в интернете полно, так что на это не буду заострять внимание.



### Первоначальная настройка и подготовка к установке

Первым делом необходимо обновить систему и перезагрузиться. Это рекомендуется делать регулярно при использовании GNU Linux, но перезагрузка обязательно только при изменении ядра. В нашем случае оно, вероятно, меняется.

```bash
sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo reboot
```

Далее можно установить удобный браузер, например, [Google Chrome](https://www.google.ru/intl/ru/chrome/). После его скачивания и установки можете удалить дефолтный браузер.

```bash
sudo apt remove -y firefox
```

Также по желанию можете поставить смену раскладки на привычную комбинацию. [Почитать об этом можно тут](https://dock.co.nz/post/change-keyboard-layout-switch-to-altshift-ubuntu-18-04/).

```bash
sudo apt-get install -y gnome-tweak-tool
gnome-tweaks
```

Осталось поставить git, склонировать этот репозиторий и можно начинать частично автоматическую установку скриптов.

```bash
sudo apt-get install -y git
cd
git clone https://github.com/AquilaUAV/AquilaUAV_pc.git
cd ~/AquilaUAV_pc
```

Также рекомендуется включить [автоматический вход в систему](https://linuxconfig.org/how-to-enable-automatic-login-on-ubuntu-18-04-bionic-beaver-linux), чтобы установка могла быть более автоматизированной.

Ещё можно отключить требование пароля для операций sudo на время установки, чтобы можно было почти не прикасаться к компьютеру во время установки. Для этого нужно открыть настройки sudo:

```bash
sudo visudo
```

Потом в самый конец файла вставить следующую строку, где вписать своё имя пользователя вместо **USER** (Если очевидно, где оно в терминале, можете ввести **whoami**) и сохранить по **ctrl+o**, **Enter**, **ctrl+x**:

```bash
USER ALL=NOPASSWD: ALL
```

Конечно же, после завершения установки такую **дыру в безопасности** необходимо закрыть, стерев эту строчку таким же образом.

 

### Автоматическая установка

Можно посмотреть список рабочих окружений, для которых работает автоматическая сборка:

```bash
~/AquilaUAV_pc/install.sh
```

Базовый пакет включает OpenCV 4.5.1, CUDA 10.2, CUDNN 8.1.1, ROS Melodic, Realsense2 SDK и настройку для работы в PyCharm. Установить его очень просто:

```bash
~/AquilaUAV_pc/install.sh base
```

Пакет с TensorFlow в разработке, но уже можно поставить TensorRt:

```bash
~/AquilaUAV_pc/install.sh tensorflow
```

По проектам на данный момент работают примеры из [VINS-Fusion-gpu](https://github.com/IOdissey/VINS-Fusion-gpu) (форк для работы с OpenCV 4):

```bash
~/AquilaUAV_pc/install.sh VINS-Fusion-GPU
```

Перед запуском всех нод этого проекта необходимо подключить его окружение. Чтобы не возникало проблем с cv_bridge, было решено изолировать пакеты этого проекта от остальных:

```bash
source ~/catkin_workspaces/VINS-Fusion-GPU_ws/devel/setup.bash
```

