@extends('mails.master')

@section('content')
    <div class="sub-header">
        Hi {{ $user->first_name }},
    </div>
    <div class="content">
        Thank you for signing up. <br>
        We promise that this application will help you improve yourself. 
    </div>
@endsection