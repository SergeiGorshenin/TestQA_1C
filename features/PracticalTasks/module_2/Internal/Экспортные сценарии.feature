﻿#language: ru

@tree

Функционал: Заполнение шапки документа Заказ и проверка поля Количество (итог) 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Заполнение шапки Заказа и проверка поля Количество (итог)
	И заполнение шапки документа Заказ
	И проверка заполнения поля Количество (итог)