--[[� ������ �������� ���������� ���������:
1. �������� ������ ������� � ������� ������� getClassesList()]]


-- �������������� ���������
CLASS_CODE = "SPBFUT"; -- ����� ������


list = getClassesList()
message("�������� ���� �������: " .. list)
message(type(list))
list_class = getClassSecurities(CLASS_CODE)
message("�������� ����������� ������ SPBFUT: " .. list_class)
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