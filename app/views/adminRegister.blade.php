@extends('layout')

@section('title', 'Register')

@section('content')
<div class="fixed-container" style="background-image: url('{{asset('assets/images/bg.gif')}}');" >
  <div class="form-container" >
    <img class="logo" src="{{asset("assets/images/".Config::get('database.logo'))}}" >

    <form method="post" action="{{URL::to('superadmin/create')}}" >
      <div class="rounded-form" >
        @if(Session::get('error'))
        <div class="alert alert-danger">{{Session::get('error')}}</div>
        @endif
        <input name="username" type="text" placeholder="Username" value="{{Input::old('username')}}" >
        <input name="email" type="text" placeholder="Email" value="{{Input::old('email')}}" >
        <input name="password" type="password" placeholder="Password" >
      </div >
      <input type="submit" value="Sign Up" >
    </form >
  </div >
  <div class="left-footer" >
  </div >
  <nav class="right-footer" >
    <ul class="menu" >
      <li ><a href="#" > Terms </a ></li >
      <li ><a href="#" > Privacy </a ></li >
    </ul >
  </nav >
</div >
@stop