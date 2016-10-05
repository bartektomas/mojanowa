@extends('layout')

@section('title', 'Register')

@section('content')
<div class="fixed-container" style="background-image: url('{{asset('assets/images/bg.gif')}}');" >
  <div class="form-container" >
    <img class="logo" src="{{asset("assets/images/".Config::get('database.logo'))}}" >

    <form method="post" action="{{URL::to('register')}}" >
      <div class="rounded-form" >
        @if(Session::get('error'))
        <div class="alert alert-danger">{{Session::get('error')}}</div>
        @endif
        @if(Session::get('success'))
        <div class="alert alert-success">{{Session::get('success')}}</div>
        @endif
        <input name="username" type="text" placeholder="Username" value="{{Input::old('username')}}" required>
        <input name="email" type="text" placeholder="Email" value="{{Input::old('email')}}" reuqired>
        <input name="password" type="password" placeholder="Password" reuqired>
      </div >
      <input type="submit" value="Sign Up" >
    </form >
  </div >
  <div class="left-footer" >
    <a href="{{URL::to('login')}}" class="transparent button" > Login </a >
  </div >
  <nav class="right-footer" >
    <ul class="menu" >
      <li ><a href="{{URL::to('terms')}}" > Terms </a ></li >
      <li ><a href="{{URL::to('privacy')}}" > Privacy </a ></li >
    </ul >
  </nav >
</div >
@stop