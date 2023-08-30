#language: ru

@tree

Функционал: создать десять товаров

Как Тестирощик я хочу
создать десять элементов справочника Номенклатура
чтобы проверить создание товаров

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: создать десять товаров
	Дано Я открываю навигационную ссылку "e1cib/list/Catalog.Items"
	И Я запоминаю значение выражения '1' в переменную "Счетчик"
	И я делаю 10 раз
		И Я запоминаю значение выражения "$Счетчик$ + 1" в переменную "Счетчик"
		И Я запоминаю значение выражения '"Мой тестовый товар " + $Счетчик$' в переменную "ИмяТовра"
		И Я запоминаю значение выражения '"Артикул " + $Счетчик$' в переменную "ItemId"
		И я проверяю или создаю для справочника "Items" объекты:
			| 'Ref'                                                               | 'DeletionMark' | 'Code' | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture'                          | 'Vendor'                                                           | 'ItemID'   | 'PackageUnit' | 'Description_en' | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
			| '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        |        | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6879' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794d' | '$ItemId$' | ''            | '$ИмяТовра$'     | ''                 | ''               | ''               |          |          |          |          |         |
	И я закрываю все окна клиентского приложения