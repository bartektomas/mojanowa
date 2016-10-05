@extends('layout')

@section('title', 'Create Blog')

@section('content')

<div class="main container">
  @include('partials.menu')
  <section class="white content clearfix">
    <h1 class="page-title"> Create New Blog </h1>
    <p class="desc">This additional blog can be managed by multiple authors or set to private.<br>
                    Note: If you want to Like posts or Follow other users with this blog identity, you must log out and create a separate account.</p>

    <form class="form-horizontal" role="form" method="post" action="{{URL::route('createblog')}}">
      <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">Title</label>
        <div class="col-sm-10">
          <input name="title" type="text" class="form-control input-lg">
        </div>
      </div>
      <div class="form-group has-feedback">
        <label class="col-sm-2 control-label">URL</label>
        <div class="col-sm-10 subdomain">
          <input name="name" type="text" class="form-control input-lg">
          <span class="form-control-feedback">.rumblr.com</span>
        </div>
      </div>

      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-8">
          <button type="submit" class="btn btn-default">Create a new blog</button>
        </div>
        <div class="col-sm-2">
          <div class="pull-right">
            <button type="reset" class="btn btn-default"> Cancel </button>
          </div>
        </div>
      </div>
    </form>

  </section>

</div>

@stop