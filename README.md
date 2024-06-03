
# Pencatatan Data Siswa

Aplikasi ini hasil fork dari repository Pak Suwondo dengan mengubah crud dan database nya. Project ini masih memiliki kekurangan yaitu belum otomatis refresh, jadi harus menekan tombol refresh untuk mendapatkan data terbaru.
## Demo Project

![Demo Video](./demo_siswa.mp4)


## Run Locally

Clone the project

```bash
  git clone https://github.com/diorizqi404/data-siswa-app
```

Go to the project directory

```bash
  cd data-siswa-app
```

Get Packages

```bash
  flutter pub get
```

Run the app

```bash
  flutter run
  // In VSCode, u can use F5
```


## Host CRUD

Copy Folder `siswa` inside:
- `www` if using **Laragon**
- `htdocs` if using **Xampp**

Open your phpmyadmin, create a database, then import `siswa.sql` inside `siswa` folder

Configure your username & password mysql on `conn.php`
## Authors
I Forked From
- [Pak Suwondo](https://github.com/suwondo7)

Author:
- [Dio Rizqi](https://github.com/diorizqi404)

Thanks to
- [Glaezz](https://github.com/Glaezz)

