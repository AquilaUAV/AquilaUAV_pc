# AquilaUAV_pc

Это репозиторий для настройки идентичного Nvidia Jetson JetPack 4.5.1 рабочего окружения на компьютере с GPU Nvidia.



#### Установка Ubuntu 18.04

Скачиваем с [официального сайта](https://releases.ubuntu.com/18.04/) Desktop image: 

https://releases.ubuntu.com/18.04/ubuntu-18.04.5-desktop-amd64.iso 

После записываем на свободный USB накопитель с помощью [balenaEtcher](https://www.balena.io/etcher/)

Загружаемся, устанавливаем, радуемся Ubuntu. Мануалов по установке Ubuntu в интернете полно, так что на это не буду заострять внимание.



#### Первоначальная настройка и подготовка к установке

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



