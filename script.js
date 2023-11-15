const commands = {
    SELECT: ['Выбрать', 'SELECT * FROM table_name WHERE condition;'],
    INSERT: ['Вписать', 'INSERT INTO table_name (column1, column2, column3) VALUES (value1, value2, value3);'],
    UPDATE: ['Обновить', 'UPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;'],
    DELETE: ['Удалить', 'DELETE FROM table_name WHERE condition;'],
    MERGE: ['Объединить', ''],
    CREATE: ['Создать', ''],
    ALTER: ['Модифицировать', ''],
    DROP: ['Удалить', ''],
    RENAME: ['Переименовать', ''],
    TRUNCATE: ['Очистить', ''],
    COMMIT: ['Применить', ''],
    ROLLBACK: ['Откатить', ''],
    SAVEPOINT: ['Сохранить', ''],
    GRANT: ['Дать доступ', ''],
    REVOKE: ['Забрать доступ', '']
};


let command = document.querySelectorAll('.command');
let syntax = document.getElementById('syntax');

command.forEach(item => {
    let text = item.textContent;
    item.addEventListener("mouseenter", event => {
        item.textContent = commands[text][0];
    });

    item.addEventListener("mouseleave", event => {
        item.textContent = text;
    });

    item.onclick = function () {
        syntax.textContent = commands[text][1];
    };

});