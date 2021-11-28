<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Designblue Ticketing</title>
    <style>
        <?php include public_path('css/mails.css') ?>
    </style>
</head>
<body>
    <div class="body-wrapper">
        <div class="header">
            <p>Mood Tracker</p>
        </div>
        @yield('content')
        <div class="footer">
            This is an automated email from <b>Mood Tracker</b>. Do not reply to this email.
        </div>
    </div>
</body>
</html>