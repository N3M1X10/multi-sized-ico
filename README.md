# multi-sized-ico
### 🖼️Преобразование `.png` в `.ico` (иконку), с сразу несколькими вшитыми размерами
>[!important]
>1. Запусти **`convert.bat`**, создадутся папки `input` и `output` (единоразовое действие)
>2. Помести свою `.png` в папку `input`
>3. Запусти **`convert.bat`**
>4. Выбери нужные выходные размеры
>5. Забирай готовую `multisized.ico` в папке `output`

>[!note]
> - **Flush** - очистка папок `input` и `output` от обрабатываемых данных (`.png` и `.ico` файлов)
> - **Выходные** данные обновляются утилитой, уже существующий файл в `output` будет заменён на новый при конвертировании. Нет нужды очищать `output` если нужна иконка с другими размерами
> - Разом может быть конвертирован только один PNG

## ImageMagick❤️
- Данный репозиторий включает в себя и подразумевает использование программного обеспечения **ImageMagick Studio LLC**
- [Сайт оригинальной утилиты](https://imagemagick.org/)
