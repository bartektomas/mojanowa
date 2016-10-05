@extends('layout')

@section('title', 'Login')

@section('content')
<div class="fixed-container" style="background-image: url('{{asset('assets/images/bg.jpg')}}');" >
  <div class="form-container" >
    <img class="logo" src="{{asset("assets/images/".Config::get('database.logo'))}}" >

    <form method="post" action="{{URL::to('login')}}" >
      <div class="rounded-form" >
        @if(Session::get('error'))
        <div class="alert alert-danger">{{Session::get('error')}}</div>
        @endif
        @if(Session::get('success'))
        <div class="alert alert-success">{{Session::get('success')}}</div>
        @endif
        <input type="text" name="email" placeholder="Email" value="admin@rumblr.biz" required >
        <input type="password" name="password" placeholder="Password" value="admin" required>
      </div >
      <input type="submit" value="Login" >
    </form >
  </div >
  <div class="left-footer" >
    <a href="{{URL::to('register')}}" class="transparent button" > Sign Up </a >
  </div >
  <nav class="right-footer" >
    <ul class="menu" >
      <li ><a href="{{URL::to('terms')}}" > Terms </a ></li >
      <li ><a href="{{URL::to('privacy')}}" > Privacy </a ></li >
    </ul >
  </nav >
</div >
@stop
