const commands = {
    SELECT: 'Выбрать',
    INSERT: 'Вписать',
    UPDATE: 'Обновить',
    DELETE: 'Удалить',
    MERGE: 'Объединить',
    CREATE: 'Создать',
    ALTER: 'Модифицировать',
    DROP: 'Удалить',
    RENAME: 'Переименовать',
    TRUNCATE: 'Удалить',
    COMMIT: 'Применить',
    ROLLBACK: 'Откатить',
    SAVEPOINT: 'Сохранить',
    GRANT: 'Дать доступ',
    REVOKE: 'Забрать доступ'
};


let command = document.querySelectorAll('.command');

command.forEach(item => {
    let text = item.textContent;
    item.addEventListener("mouseenter", event => {
        item.textContent = commands[text];
    });
    item.addEventListener("mouseleave", event => {
        item.textContent = text;
    });
});