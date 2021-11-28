@extends('mails.master')

@section('content')
    <div class="sub-header">
        Hi {{ $user->first_name }},
    </div>
    <div class="content">
        <p>
            <b>{{ $assigner->full_name }}</b> has assigned you a ticket</b>.
        </p>
        @if ($remarks != null)
            <p class="remarks">
                {{ $remarks }}
            </p>
        @endif
        <br>
        <p>
            <p class="title">{{ $ticket->subject }}</p>
            <br>
            Severity: <b>{{ ucfirst($ticket->level) }}</b> <br>
            Ticket Code: <b>{{ $ticket->code }}</b> <br>
            Category: <b>{{ $ticket->category->name }}</b> <br>
            Ticket URL: <b><a href="{{ $ticketUrl }}" target="_blank">{{ $ticketUrl }}</a></b>
        </p>
    </div>
@endsection