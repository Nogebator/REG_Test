SELECT d.dname FROM domains AS d LEFT JOIN users AS u ON u.user_id = d.user_id WHERE u.name = 'Иван Иванов';
