# Операционные системы UNIX/Linux (Базовый).
## Part 1. Готовый докер

1.1 Взять официальный докер образ с nginx и выкачать его при помощи `docker pull`

<img src="image.png" width="800">

1.2 Проверить наличие докер образа через `docker images`

<img src="image-1.png" width="800">

1.3 Запусти докер-образ через `docker run -d [image_id|repository]`

<img src="image-2.png" width="800">

1.4 Проверить, что образ запустился через `docker ps`

<img src="image-3.png" width="800">

1.5 Посмотри информацию о контейнере через `docker inspect [container_id|container_name]`

<img src="image-4.png" width="800">

1.6 По выводу команды определи и помести в отчёт:

размер контейнера:

<img src="image-5.png" width="800">

список замапленных портов:

<img src="image-6.png" width="800">

ip контейнера:

<img src="image-7.png" width="800">

1.6 Остановить докер образ через `docker stop [container_id|container_name]`

<img src="image-8.png" width="800">

1.7 Проверить, что образ остановился через `docker ps`

<img src="image-9.png" width="800">

1.8 Запусти докер с `портами 80 и 443` в контейнере, замапленными на такие же порты на локальной машине, через команду `run`

<img src="image-10.png" width="800">

1.9 Проверь, что в браузере по адресу `localhost:80` доступна стартовая страница nginx.

<img src="image-11.png" width="800">

1.10 Перезапустить докер контейнер через `docker restart [container_id|container_name]`

<img src="image-12.png" width="800">

1.11 Проверить любым способом, что контейнер запустился

<img src="image-13.png" width="800">


## Part 2. Операции с контейнером

2.1 Прочитать конфигурационный файл nginx.conf внутри докер контейнера через команду exec

команды : `docker run -d -p 80:80 39286ab8a5e1` и `docker exec 5fdd62eecdcf cat /etc/nginx/nginx.conf`

<img src="image-14.png" width="800">

2.2 Создать на локальной машине файл nginx.conf

<img src="image-16.png" width="800">


2.3 Настроить в нем по пути /status отдачу страницы статуса сервера nginx

<img src="image-15.png" width="800">

2.4 Скопировать созданный файл nginx.conf внутрь докер образа через команду `docker cp`

2.5 Перезапустить nginx внутри докер образа через команду `exec`

<img src="image-17.png" width="800">

2.6 Проверить, что по адресу `localhost:80/status` отдается страничка со статусом сервера nginx

<img src="image-18.png" width="800">

2.7 Экспортируй контейнер в файл `container.tar` через команду `export.`

2.8 Остановить контейнер

<img src="image-19.png" width="800">

2.9 Удалить образ через `docker rmi [image_id|repository]`, не удаляя перед этим контейнеры

<img src="image-20.png" width="800">

2.10 Удалить остановленный контейнер

<img src="image-21.png" width="800">

2.11 Импортировать контейнер обратно через команду `import`

<img src="image-22.png" width="800">

2.12 Запустить импортированный контейнер

<img src="image-23.png" width="800">

2.13 Проверь, что по адресу `localhost:80/status` отдается страничка со статусом сервера nginx.

<img src="image-24.png" width="800">

## Part 3. Мини веб-сервер


3.1 Написать мини сервер на C и FastCgi, который будет возвращать простейшую страничку с надписью `Hello World!`

<img src="image-25.png" width="800">

3.2 Написать свой `nginx.conf`, который будет проксировать все запросы `с 81 порта на 127.0.0.1:8080`

<img src="image-26.png" width="800">

3.3 Запустить написанный мини сервер через `spawn-fcgi на порту 8080`


Команды:

```
docker images
docker run -d -p 81:81 [IMAGE_ID]
docker ps
```

<img src="image-27.png" width="800">
  
Подключаемся к контейнеру:
```
docker cp nginx.conf [CONTAINER ID]:/etc/nginx/
docker cp server.c [CONTAINER ID]:/home/
docker exec -it [CONTAINER ID] bash     // чтобы подключиться к контейнеру
```

<img src="image-28.png" width="800">

Устанавливаем все требуемые пакеты: 
```
apt-get update
apt-get install gcc
apt-get install spawn-fcgi
apt-get install libfcgi-dev
```

Запускаем мини сервер:
```
gcc server.c -lfcgi
spawn-fcgi -p 8080 ./a.out
nginx -s reload
```

<img src="image-29.png" width="800">

3.4 Проверить, что в браузере по `localhost:81` отдается написанная вами страничка

<img src="image-30.png" width="500">

## Part 4. Свой докер

4.1 Написать свой докер образ, который:

1) собирает исходники мини сервера на FastCgi из Части 3

2) запускает его на 8080 порту

3) копирует внутрь образа написанный ./nginx/nginx.conf

4) запускает nginx.

<img src="image-31.png" width="500">

<img src="image-32.png" width="500">

4.2 Собрать написанный докер образ через docker build при этом указав имя и тег

4.3 Проверить через docker images, что все собралось корректно

<img src="image-33.png" width="800">

4.4 Запустить собранный докер образ с маппингом 81 порта на 80 на локальной машине

<img src="image-34.png" width="800">

4.5 Проверить, что по localhost:80 доступна страничка написанного мини сервера 

<img src="image-35.png" width="500">

4.6 Допиши в ./nginx/nginx.conf проксирование странички /status, по которой надо отдавать статус сервера nginx.

<img src="image-36.png" width="800">

4.7 Перезапусти докер-образ. Проверь, что теперь по localhost:80/status отдается страничка со статусом nginx

<img src="image-37.png" width="500">

## Part 5. Dockle

5.1 Просканировать образ из предыдущего задания через dockle

<img src="image-38.png" width="800">

5.2 Исправить образ так, чтобы при проверке через dockle не было ошибок и предупреждений

<img src="image-39.png" width="500">

5.3 Заново билдим образ и проверяем

<img src="image-40.png" width="800">

## Part 6. Базовый Docker Compose

6.1 Написать файл docker-compose.yml, с помощью которого:

1) Поднять докер контейнер из Части 5 (он должен работать в локальной сети, т.е. не нужно использовать инструкцию EXPOSE и мапить порты на локальную машину)

2) Поднять докер контейнер с nginx, который будет проксировать все запросы с 8080 порта на 81 порт первого контейнера

<img src="image-41.png" width="500">

6.2 Замапить 8080 порт второго контейнера на 80 порт локальной машины

<img src="image-42.png" width="600">

6.3 Собрать и запустить проект с помощью команд `docker-compose build` и `docker-compose up`

<img src="image-43.png" width="1000">

<img src="image-45.png" width="800">

<img src="image-44.png" width="400">

6.4 Проверить, что в браузере по localhost:80 отдается написанная вами страничка, как и ранее

<img src="image-46.png" width="500">
