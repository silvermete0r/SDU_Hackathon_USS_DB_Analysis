# SDU Hackathon: Unified Star Scheme (USS) [Analysis]
🛠️ **Tools:** PostgreSQL (DBMS), Python (Data Engineering)

💽 **Dataset:** [dataset.kz](https://drive.google.com/drive/folders/1cbaVDf9eqNxXsfupbcrtGQPE85Rz9fo0?usp=sharing)

💬 **Data Description:** [datadescription.kz](https://docs.google.com/document/d/1nLlaICvW7AmZk-3JrbCOaqr4hkBBxyzM8kw4X0wWjo8/edit?pli=1)

[![uss-scheme-img-1][uss-scheme-img-1]](https://www.amazon.co.uk/Unified-Star-Schema-Resilient-Warehouse/dp/163462887X)

## 1) Что такое USS и в чем заключается его основное преимущество по сравнению с традиционными звездной и снежинкой схемами?
> *Unified Star Schema (USS)* - это методология проектирования схемы данных для аналитических систем. Она объединяет данные из различных источников в одну звездную схему, устраняя несогласованности и дублирование. 

> **Авторы:** Инмон Б., Пуппини Ф.
> **Книга:** [The Unified Star Schema](https://www.amazon.co.uk/Unified-Star-Schema-Resilient-Warehouse/dp/163462887X)

| Критерий          | USS           | Снежинка     | Звезда       |
|-------------------|---------------|--------------|--------------|
| Структура         | Одна звездная схема, объединяющая данные из разных источников | Множество нормализованных таблиц | Одна фактовая таблица, окруженная измерениями |
| Производительность запросов | Высокая | Низкая (из-за необходимости объединения таблиц) | Высокая |
| Дублирование данных | Минимальное | Может быть высоким из-за нормализации | Минимальное |
| Количество таблиц | Меньше | Больше | Среднее |
| Изменение структуры данных | Сложное | Простое | Среднее |
| Поддержка исторических данных | Да | Да | Ограниченная (часто требует дополнительных таблиц) |
| Использование в аналитике | Оптимальное | Неэффективное из-за сложности запросов | Оптимальное |

### №1. Задача:  
> Постройте USS структуру для анализа продаж и определения самых популярных продуктов в разных магазинах. Включите таблицы для фактов продаж и измерений продуктов, магазинов и времени.

> **Решение задачи:** [Task-1-Solution](https://github.com/silvermete0r/SDU_Hackathon_USS_DB_Analysis/blob/main/task-1.sql)

> **Screenshot:**

[![task-1][task-1]](#)

> **Решение для настройки базы данных:** [store_db[DB Creation].sql](https://github.com/silvermete0r/SDU_Hackathon_USS_DB_Analysis/blob/main/store_db%5BDB%20Creation%5D.sql) + [data_engineering - preprocessing](https://github.com/silvermete0r/SDU_Hackathon_USS_DB_Analysis/blob/main/data_engineering.ipynb) + [data_fill_csv_sql](https://github.com/silvermete0r/SDU_Hackathon_USS_DB_Analysis/blob/main/fill_data_from_csv.sql)

> **Схема:**

[![scheme-1][scheme-1]](#)

> **ERD-Схема:**

[![erd-scheme-1][erd-scheme-1]](https://github.com/silvermete0r/SDU_Hackathon_USS_DB_Analysis/blob/main/store_db%5BDB%20Creation%5D.sql)

&nbsp;
## 2) Какой подход к моделированию связей сущностей в USS структуре может использоваться для обеспечения гибкости и простоты масштабирования?
> В USS для гибкости и масштабирования рекомендуется использовать "унифицированные ключи". Это подход, при котором каждой сущности присваивается уникальный и постоянный идентификатор системы. Это способствует гибкости и облегчает масштабирование системы при увеличении объема данных и источников.

[![uss-scheme-img-2][uss-scheme-img-2]](https://towardsdatascience.com/the-new-unified-star-schema-paradigm-in-analytics-data-modeling-review-a245b2641dc8)

### №2. Задача:  
> Создайте USS структуру для анализа активности клиентов и определения их предпочтений в разных магазинах. Включите таблицы для фактов заказов и измерений клиентов, магазинов и времени.

> **Решение:** [Task-2-Solution](https://github.com/silvermete0r/SDU_Hackathon_USS_DB_Analysis/blob/main/task-2.sql)

> **Screenshots:** 

[![task-2-1][task-2-1]](#)
[![task-2-2][task-2-2]](#)
[![task-2-3][task-2-3]](#)
[![task-2-4][task-2-4]](#)


&nbsp;
## 3) Как USS таблицы могут быть использованы для оптимизации выполнения сложных аналитических запросов?

⭐ **Звездная схема:** Использлование звездной схемы в USS облегчает агрегирование данных и ускоряет выполнение групповых функций, как AVG, SUM, COUNT для сложных аналитических запросов.

🔑 **Унифицированные ключи:** Уникальные идентификаторы для сущностей облегчают объединение данных из разных источников, уменьшая необходимость дополнительных операций соединения таблиц.

📋 **Минимизация дублирования:** USS устраняет дублирование данных, что сокращает объем обработки и оптимизирует производительность запросов.

🆔 **Индексы:** Возможность создания оптимальных индексов на унифицированных ключах улучшает скорость выполнения запросов, особенно при больших объемах данных.

🔗 **Предварительное объединение данных:** USS позволяет предварительно объединять данные из различных источников, что уменьшает время выполнения запросов, так как предобработка уже выполнена.

➕ **Удобство добавления данных:** USS упрощает процесс добавления новых данных, что облегчает масштабирование системы при увеличении объема данных и источников.

### №3. Задача:  
> Постройте USS структуру для анализа эффективности маркетинговых акций в различных магазинах. Включите таблицы для фактов заказов и измерений магазинов, продуктов, клиентов и времени.

> **Решение:** [Task-3-Solution](https://github.com/silvermete0r/SDU_Hackathon_USS_DB_Analysis/blob/main/task-3.sql)

> **Screenshot:**

[![task-3][task-3]](#)

&nbsp;
## 4) Какие инструменты или программное обеспечение можно использовать для работы с USS структурами и выполнения аналитических запросов?

🐘 [**PostgreSQL:**](https://www.postgresql.org/) Мощная система управления базами данных (СУБД) с поддержкой звездных схем и унифицированных ключей.

📊 [**Microsoft Power BI:**](https://powerbi.microsoft.com/) Еще один мощный инструмент для визуализации данных и работы с USS структурами.

📈 [**Tableau:**](https://www.tableau.com/) Визуализационный инструмент, поддерживающий USS структуры и облегчающий создание интерактивных отчетов.

✨ [**Apache Spark:**](https://spark.apache.org/) Распределенный фреймворк для обработки больших объемов данных и выполнения сложных аналитических запросов.

🐝 [**Apache Hive:**](https://hive.apache.org/) Система управления данными на основе Hadoop, позволяющая использовать USS для аналитики.

### №4. Задача:  
> Создайте USS структуру для анализа покупательского поведения и предсказания спроса на определенные продукты в разных магазинах. Включите таблицы для фактов заказов и измерений продуктов, клиентов, магазинов и времени.

> **Решение:** [Task-4-Solution](https://github.com/silvermete0r/SDU_Hackathon_USS_DB_Analysis/blob/main/task-4.sql)

> **Схема:**

[![task-4-1][task-4-1]](#)
[![task-4-2][task-4-2]](#)
[![task-4-3][task-4-3]](#)
[![task-4-4][task-4-4]](#)
[![task-4-5][task-4-5]](#)

&nbsp;
## 5) Какую роль играют факты и измерения в USS структуре, и как это помогает анализировать данные?
> В USS структуре факты представляют числовые данные, которые измеряются и агрегируются, а измерения описывают контекст или характеристики фактов. Их сочетание позволяет анализировать данные в различных срезах и уровнях детализации, обеспечивая гибкость и простоту в аналитике.

### №5. Задача:  
> Напишите SQL запрос для получения общего количества продаж за каждый месяц в указанном периоде.

> **Решение:** [Название файла](#)

> **Схема:**

&nbsp;
## 6) Как можно масштабировать USS структуру для обработки больших объемов данных и поддержания производительности?
> Для масштабирования USS структуры при обработке больших объемов данных и поддержания производительности можно использовать *горизонтальное масштабирование* с помощью *репликации или шардинга*. Также можно оптимизировать индексы и настройки базы данных для улучшения производительности запросов.

[![horizontal-scaling-img][horizontal-scaling-img]](https://www.webairy.com/horizontal-and-vertical-scaling/)

### №6. Задача:  
> Напишите SQL запрос для получения самых популярных продуктов по количеству заказов.

> **Решение:** [Название файла](#)

> **Схема:**

### №7. Задача:  
> Напишите SQL запрос для получения среднего чека заказов в каждом магазине.

> **Решение:** [Название файла](#)

> **Схема:**

### №8. Задача:  
> Выясните топ-5 продуктов с наибольшим объемом продаж за последние три месяца и определите, какие клиенты совершили эти покупки.

> **Решение:** [Название файла](#)

> **Схема:**

&nbsp;
<!-- LICENSE -->
## License

[![MIT-License][license-shield]][license-url]

&nbsp;
<!-- CONTACT -->
## Contact
[![Linkedin][linkedin-shield]][linkedin-url]

🧐 Author: Arman Zhalgasbayev - [@grembim](https://www.instagram.com/grembim/)

📬 Email: supwithproject@gmail.com

📦 Project Link (Github Repository): [https://github.com/silvermete0r/SDU_Hackathon_USS_DB_Analysis](https://github.com/silvermete0r/SDU_Hackathon_USS_DB_Analysis)

&nbsp;
<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
 - [The Unified Star Schema: An Agile and Resilient Approach to Data Warehouse and Analytics Design by Inmon, B. & Puppini, F. (2020)](https://cdn.ttgtmedia.com/rms/pdf/The-Unified-Star-Schema.pdf)
 - [The New “Unified Star Schema” Paradigm in Analytics Data Modeling Review by Zabavskyy, A.](https://towardsdatascience.com/the-new-unified-star-schema-paradigm-in-analytics-data-modeling-review-a245b2641dc8)
 - [PostgreSQL Docs](https://www.postgresql.org/docs/)

<!-- ACKNOWLEDGMENTS -->
[license-shield]: https://img.shields.io/github/license/silvermete0r/SDU_Hackathon_USS_DB_Analysis.svg?style=flat-square
[license-url]: https://github.com/silvermete0r/SDU_Hackathon_USS_DB_Analysis/blob/main/license
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/arman-zhalgasbayev/
[uss-scheme-img-1]: https://sun9-74.userapi.com/impg/ee5yviOtIWMcImmtLju2Mh7UVk1xT9QDXQHHLg/bQli4lonCZM.jpg?size=2172x688&quality=95&sign=554cf4675dd11f518229e5b34e2b0b3a&type=album
[uss-scheme-img-2]: https://sun9-25.userapi.com/impg/AZD9Y725oy4AQvIoQqG7RfOzjHqB2eftjLL2Uw/EH1Lm6j0So4.jpg?size=2230x676&quality=95&sign=71aba4e9ff2e43d1020885da0c309fa6&type=album
[horizontal-scaling-img]: https://sun9-17.userapi.com/impg/88-jfZWTT2hAjrD4OPfcygjwMfh97LwcHCg43A/ZVA25wS3qL4.jpg?size=730x450&quality=95&sign=6b20c3b9671e1849ceae8c9d3ac961d9&type=album
[erd-scheme-1]: https://sun9-13.userapi.com/impg/oLIoAYzU8NK8idLSr1ZMwL4aPqkoZjyqe9MlMg/31_yb0WtQJE.jpg?size=1173x904&quality=95&sign=5df4eae61e795f9df13522ac21335c3e&type=album
[scheme-1]: https://sun9-47.userapi.com/impg/UldG5sIY0DON0JKTF2V4-sjhTpm83oH2_xVoTQ/3Tbd4tO-jGk.jpg?size=2103x1069&quality=95&sign=4721f44be9f789bacadaee0f1e805c6c&type=album
[task-1]: https://sun9-17.userapi.com/impg/-kb7ep5eJ5BkZfud6pzK9xUKHJ16HlM_PrmsVA/G6NkHfMw44w.jpg?size=892x1074&quality=95&sign=95009bb9ab0c4331dd11b7cb665d3ec3&type=album
[task-2-1]: https://sun9-34.userapi.com/impg/FamhJlPvfdB5q4coHWnlUUCODs4SsSbamvSf-g/OjrnDqwXOj4.jpg?size=826x1123&quality=95&sign=89bff26a705d531923423d9b5d94fe42&type=album
[task-2-2]: https://sun9-17.userapi.com/impg/-kb7ep5eJ5BkZfud6pzK9xUKHJ16HlM_PrmsVA/G6NkHfMw44w.jpg?size=892x1074&quality=95&sign=95009bb9ab0c4331dd11b7cb665d3ec3&type=album
[task-2-3]: https://sun9-14.userapi.com/impg/nyf-XO4IFaN93PSI7CBud0twT6HLg4AsBPI8hg/gQf3JO5FlP4.jpg?size=796x703&quality=95&sign=2828ba0c76b4a1fd04ad242c0c69d4cf&type=album
[task-2-4]: https://sun9-61.userapi.com/impg/PZNTIqMtWz3DvTR2UWFt-EaJts7PBvXYvanNZg/1LcMypHAaTA.jpg?size=826x1122&quality=95&sign=c1a38a5f3a305bd520b04d6c55a8de0d&type=album
[task-3]: https://sun9-34.userapi.com/impg/B276Xx688GjICt8plTJeDuvEkm-vvZ2L5FSjCQ/Fmg0IZUvLWg.jpg?size=1035x826&quality=95&sign=420adef23ecfc8970558c0c68f0b17c7&type=album
[task-4-1]: https://sun9-57.userapi.com/impg/nM8TOVW-hWGpqFXyeVnahoih8BuTiRJ6BkbtiQ/IE4rR5e0tmI.jpg?size=637x370&quality=95&sign=c7f2fd69f8120dbdd49052cf6b434ac1&type=album
[task-4-2]: https://sun9-69.userapi.com/impg/_qHiNY8P5yF1oQvf6Z_gEjvHD68yaBGaHDJm0A/qKtvIWcIfuI.jpg?size=579x757&quality=95&sign=aa6df93faa6eeddafa7f2f79eec4b920&type=album
[task-4-3]: https://sun9-64.userapi.com/impg/kY149kNTgsI5lPtgijLICf2o3QjWlqpv2hX5Jw/9BwL8F8fHjU.jpg?size=957x406&quality=95&sign=ac7e0335bd21938759b975a48ce700f2&type=album
[task-4-4]: https://sun9-44.userapi.com/impg/4FiMQm33w_ng28zvM8yfCbY_VWyeHJBjPGhB4Q/wzgzS259dkY.jpg?size=597x603&quality=95&sign=68f64d948bc2921145249b8eb90f2411&type=album
[task-4-5]: https://sun9-68.userapi.com/impg/NCEyktOz0kKg9HqXam2bVamN04aoHjBTcSUkWg/H4SVCDtA63g.jpg?size=1132x477&quality=95&sign=14ffb75b85b0b84371ff7f8b940b171a&type=album
