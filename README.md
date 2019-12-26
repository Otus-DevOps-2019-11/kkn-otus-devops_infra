# kkn-otus-devops_infra
kkn-otus-devops Infra repository

Homework 5. Cloud Bastion

bastion_IP = 35.234.79.34
someinternalhost_IP = 10.156.0.3

SSH
----------
Used ssh forwarding

Самостоятельное задание №1
---------------------------------------------------

Подключение к someinternalhost в одну команду:

ssh -A  kondratukkn@35.234.79.34 ssh -tt 10.156.0.3

Дополнительное задание №1
---------------------------------------------------
 Вариант решения для подключения из консоли при
помощи команды вида ssh someinternalhost из
локальной консоли рабочего устройства, чтобы
подключение выполнялось по алиасу someinternalhost:

Добавить в файл ~/.ssh/config настройки:

host bastion
    hostname 35.234.79.34
    user kondratukkn
    identityfile ~/.ssh/id_rsa

host someinternalhost
    hostname 10.156.0.3
    user kondratukkn
    proxycommand ssh -W %h:%p bastion
    identityfile ~/.ssh/id_rsa



VPN
-----------------
Installed and configured VPN server pritunl
Configured OpenVPN clein and connected to pritunl
server. Checked direct ssh connect to someinternalhost

ssh -A  kondratukkn@10.156.0.3


Дополнительное задание №2
---------------------------------------------------
Реализуйте использование валидного сертификата для
панели управления VPN-сервера

Done

https://35.234.79.34.xip.io


===================================================

Homework 6. Cloud-testapp

testapp_IP = 35.234.79.34
testapp_port = 9292


1. Установлено Google Cloud SDK

2. Создана VM через gcloud cli

3. Написаны скрипты для
3.1 Установки ruby (install_ruby.sh)
3.2 Установки mongodb (install_mongodb.sh)
3.3 Деплоя и запуска приложения (deploy.sh)

4. Доплнительное задание 1
4.1 Написанные скрипты объеденены в один скрипт startup_script.sh
    Скрипт запускается при создании инстанса.
    Модификация команды gcloud:
    (добавлена опция
      --metadata-from-file startup-script=startup_script.sh)

    gcloud compute instances create reddit-app\
      --boot-disk-size=10GB \
      --image-family ubuntu-1604-lts \
      --image-project=ubuntu-os-cloud \
      --machine-type=f1-micro \
      --tags puma-server \
      --restart-on-failure \
      --metadata-from-file startup-script=startup_script.sh


5. Дополнительное задание 2
