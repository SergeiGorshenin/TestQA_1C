﻿#language: ru

@tree

Функционал: Тестирование основного варианта отчета Остатки

Как Тестировщик я хочу
проверить корректность формирования основного варианта отчета Остатки
чтобы пользователи были уверены в корректности получаемых данных    

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Тестирование основного варианта отчета Остатки
* Открытие отчета вариант Основной
	И я закрываю все окна клиентского приложения
	И я перехожу по навигационной ссылке "e1cib/app/Отчет.ОстаткиТоваровНаСкладах?vrn=Основной"
	И Пауза 10
	И в табличном документе 'Результат' я перехожу к ячейке "R1C1"
* Формирование отчета без отборов
	И я нажимаю на кнопку 'Установить стандартные настройки'
	И я нажимаю на кнопку с именем 'ФормаСформировать'
	И я жду, что в табличном документе 'Результат' ячейка 'R26C6' станет равна '7 026,00' в течение 20 секунд
	Дано Табличный документ "Результат" равен макету "ОстаткиБезОтборов" по шаблону	
* Формирование отчета по складу
	И из выпадающего списка с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент2Значение" я выбираю точное значение 'Большой'
	И я нажимаю на кнопку с именем 'ФормаСформировать'
	И я жду, что в табличном документе 'Результат' ячейка 'R22C3' станет равна '1 342,00' в течение 20 секунд
	Дано Табличный документ "Результат" равен макету "ОстаткиПоСкладу" по шаблону
* Формирование отчета по товару
	И я нажимаю на кнопку 'Установить стандартные настройки'		
	И я нажимаю кнопку выбора у поля с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент1Значение"
	И я нажимаю на кнопку с именем 'ФормаДерево'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000011' | 'Продукты'      |
	И в таблице "Список" я разворачиваю текущую строку
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000030' | 'Колбаса'      |
	И в таблице "Список" я выбираю текущую строку
	И я нажимаю на кнопку с именем 'ФормаСформировать'
	Тогда табличный документ "Результат" равен:
		| 'Отбор:'  | 'Товар Равно "Колбаса"' | ''                   | ''                    | ''                   |
		| ''        | ''                      | ''                   | ''                    | ''                   |
		| 'Товар'   | 'Большой'               | 'Малый'              | 'Склад отдела продаж' | 'Итого'              |
		| ''        | 'Количество Остаток'    | 'Количество Остаток' | 'Количество Остаток'  | 'Количество Остаток' |
		| 'Колбаса' | '205,00'                | '352,00'             | '2 100,00'            | '2 657,00'           |
		| 'Итого'   | '205,00'                | '352,00'             | '2 100,00'            | '2 657,00'           |	
	И я нажимаю на кнопку 'Установить стандартные настройки'
	И я закрываю все окна клиентского приложения