# BlackJack

Игра "Black Jack" с текстовым интерфейсом.

Проект выполнялся 5 дней в декабре 2020 года.

# Описание правил и механики игры

Есть игрок (пользователь) и дилер (управляется программой).
При начале игры у пользователя и дилера в банке находится 100 долларов.

Пользователю выдаются случайные 2 карты, которые он видит.
Также 2 случайные карты выдаются «дилеру», против которого играет пользователь.

После раздачи, автоматически делается ставка в банк игры в размере 10 долларов от игрока и диллера.
После этого ход переходит пользователю.

Относительно суммы своих очков пользователь может выбрать 1 из 3 вариантов хода:
- Пропустить.
- Добавить карту. В этом случае игроку добавляется еще одна случайная карта, ход переходит дилеру. 
- Открыть карты. Открываются карты дилера и игрока, игрок видит сумму очков дилера, идет подсчет результатов игры (см. ниже).

Ход дилера (управляется программой, цель - выиграть, т.е набрать сумму очком, максимально близкую к 21).
Дилер может:
- Пропустить ход. 
- Добавить карту.

Игроки вскрывают карты либо по достижению у них по 3 карты (автоматически), либо когда пользователь выберет вариант «Открыть карты».
После этого пользователь видит карты дилера и сумму его очков, а также результат игры (кто выиграл и кто проиграл).

Подсчет результатов:
- Выигрывает игрок, у которого сумма очков ближе к 21
- Если у игрока сумма очков больше 21, то он проиграл
- Если сумма очков у игрока и дилера одинаковая, то объявляется ничья и деньги из банка возвращаются игрокам
- Сумма из банка игры переходит к выигравшему

После окончания игры, у пользователя спрашивается, хочет ли он сыграть еще раз. Если да, то игра начинается заново с раздачи карт и банк игры пополняется.
