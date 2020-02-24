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

testapp_IP = 35.242.236.225
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
   Команда gcloud для создания правила firewall:

   gcloud compute firewall-rules create default-puma-server \
     --direction=INGRESS \
     --priority=1000 \
     --network=default \
     --action=ALLOW \
     --rules=tcp:9292 \
     --source-ranges=0.0.0.0/0 \
     --target-tags=puma-server

===================================================

Homework 7. Packer-base

1. Скрипты перемещены в директорию config-scripts

2. Установлен packer

3. Созданы ADC (Application Default Credentials)

4. Создан и заполнен packer template
4.1 В шаблон добавлены скрипты для прожижинга
    ruby и mongodb
4.2 На основе packer tepmlate создан образ VM
    reddit-base-xxxxxxx

5. Задеплоено приложение
5.1 Запущена VM созданная из образа reddit-base
5.2 Установлено и запущено приложение puma
5.3 Результаты закоммитчены

6. Добавлен файл gitignore

7. Выполнены самостоятельные задания 1-3

8. Задания со *
8.1 Выполнено первое задание со *
    Создан образ в котором установлены все зависимости
    и само приложение. Создан шаблон immutable.json
8.2 Выполнено второе задание со *
    Создан скрипт для запуска VM из семейства reddit-full.

===================================================

Homework 8. Terraform-1

1. Выполнил практическую работу

2. Определил input переменную для приватного ключа,
   использующегося в определении подключения для
   провижинеров (connection).

3. Определил input переменную для задания зоны в
   ресурсе "google_compute_instance" "app" с
   значением по умолчанию.

4. Отформатировал все конфигурационные файлы
   используя команду terraform fmt.

5. Создал файл terraform.tfvars.example, в
   котором указал переменные для образца.

===================================================

Homework 9. Terraform-2

1. Сконфигурировал правило файервола в файле main.tf

2. Задал IP для инстанса с app в виде внешнего
   ресурса

3. Вынес DB и APP на отдельные инстансы VM

4. Перенес конфигурацию файервола в vpc.tf

5. Перенёс конфигурацию в модули DB module и
   APP module

6. Сконфигурировал VPC module

7. Сконфигурировал source_ranges для не своего IP

8. Сконфигурировал source_ranges для своего IP

9. Сконфигурировал source_ranges для 0.0.0.0/0

10. Создал Stage и Prod окружения с разными
    доступами по IP

11. Отформатировал конфигурационные файлы

12. Использовал модуль storage-backet из реестра
    модулей

===================================================

Homework 10. Ansible-1

01. Установил PIP

02. Установил ansible

03. Создал файл ansible/inventory

04. Создал файл ansible.cfg

05. Проверил работу с модулем command

06. Создал файл ansible/inventory.yml

07. Проверил работу с модулем shell

08. Проверил работу с модулем git

09. Проверил работу с модулем systemd

10. Проверил работу с модулем service

11. Создал простой плейбук ansible/clone.yml
    для клонирования репозитория приложения

12. Выполнил плейбук до очистки каталога и после.
    (после очистки репозиторий был скачан заново)

===================================================

Homework 11. Ansible-2

01. Создал плейбук reddit_app.yml. Отредактировал
    файл .ditignore

02. Написал сценарии для настройки инстанса MongoDB
    и инстанса приложения.

03. Написал сценария деплоя приложения.

04. Переписал плейбук в режиме -- 1 плейбук
    несколько сценариев. результат сохранил в
    reddit_app2.yml

05. Разделил плейбук на 3 (db.yml, app.yml deploy.yml)

06. Переименовал пердыдущие плейбуки
    reddit_app.yml  => reddit_app_one_play.yml
    reddit_app2.yml => reddit_app_multiple_plays.yml

07. Создал плейбук site.yml, включающий все остальные

08. Заменил bash-скрипты в Packer на Ansible-плейбуки

09. Выполнил билд образов с использованием нового
    провижининга

10. Проверил новые образы запустив stage окружение
    и задеплоив приложение с помощью плейбука
    site.yml

===================================================
