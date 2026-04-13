# BigDataSnowflake

## Реализация

Сделан вариант лабораторной с автоматическим запуском PostgreSQL через Docker и загрузкой всех CSV в базу.

### Что есть в проекте

- `docker-compose.yml` - запускает PostgreSQL 16
- `docker/init/01_staging_ddl.sql` - staging-таблица `mock_data_raw`
- `docker/init/02_dimensions_ddl.sql` - DDL snowflake-схемы
- `docker/init/03_load_raw_data.sql` - автозагрузка всех 10 CSV
- `docker/init/04_dml_dimensions.sql` - заполнение измерений и справочников
- `docker/init/05_dml_fact.sql` - заполнение таблицы фактов
- `docker/init/06_validation.sql` - проверки результата
- `sql/analysis_queries.sql` - запросы для анализа исходных данных
- `data/raw/` - копии исходных CSV

### Шаги реализации

1. Запустить PostgreSQL через Docker.
2. Автоматически загрузить все 10 CSV в `mock_data_raw`.
3. Создать snowflake-схему с таблицей фактов и измерениями.
4. Заполнить измерения и таблицу фактов из staging-таблицы.
5. Выполнить проверку результата и анализ исходных данных.

### Как запустить

```bash
docker compose up -d
```

При первом запуске контейнера автоматически:

1. создаст базу `bdsnowflake`;
2. загрузит все 10 CSV в `mock_data_raw`;
3. создаст snowflake-схему;
4. заполнит измерения и таблицу фактов;
5. выполнит валидацию.

### Параметры подключения

- Host: `localhost`
- Port: `5433`
- Database: `bdsnowflake`
- User: `postgres`
- Password: `postgres`

### Проверка

- в `mock_data_raw` должно быть `10000` строк;
- в `fact_sales` должно быть `10000` строк;
- все внешние ключи факта должны ссылаться на существующие измерения.

### Анализ данных

Для анализа исходных данных можно открыть файл `sql/analysis_queries.sql` в DBeaver и выполнить запросы из него.
