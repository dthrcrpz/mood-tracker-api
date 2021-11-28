@extends('mails.master')

@section('content')
    <div class="sub-header">
        Hi AAA,
    </div>
    <div class="content">
        <p>It seems like you forgot your password. Click <a href="{{ config('app.website_url') . "/reset-password?token=$token" }}" target="_blank">here</a> to reset it. </p>
    </div>
@endsection