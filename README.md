# КБЖУ — дневник питания

Один файл `index.html`, без сборки. Регистрация и синхронизация через Supabase.

## Настройка

1. **База данных.** В Supabase откройте SQL Editor, вставьте содержимое `supabase/schema.sql` и нажмите Run. Создадутся таблицы `days` и `goals` с RLS: каждый видит только свои строки.
2. **GitHub Pages.** В репозитории: Settings → Pages → Source: Deploy from a branch → ветка `main`, папка `/ (root)` → Save.
3. **Адрес сайта.** В Supabase: Authentication → URL Configuration → Site URL = ссылка GitHub Pages (например `https://<логин>.github.io/kbzhu/`).
4. Подтверждение почты в проекте должно быть отключено (Authentication → Providers → Email → Confirm email выкл).

В коде используется только публичный ключ `sb_publishable_...`.
