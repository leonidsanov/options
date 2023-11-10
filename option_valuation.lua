--[[В данном сценарии происходит следующее:
1. Получаем список классов с помощью функции getClassesList()]]


-- Инициализируем константы
CLASS_CODE = "SPBFUT"; -- Класс бумаги


list = getClassesList()
message("Получаем коды классов: " .. list)
message(type(list))
list_class = getClassSecurities(CLASS_CODE)
message("Получаем инструменты класса SPBFUT: " .. list_class)
message(type(list_class))

function OnInit()
    is_run = true;
end;


function main()
    while is_run do
        
    sleep(2000)
    end
end


function OnStop()
    is_run = false;
    return 2000
end;