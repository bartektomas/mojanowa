@extends('layout')

@section('title', 'Blog Settings')

@section('content')

<div class="main container">
  @include('partials.menu')
  <section class="content clearfix">
    <div class="settings">
      <div class="row setting">
        <div class="col-sm-2">
          <a href="#" data-toggle="modal" data-target="#changedp">
            <img src="{{ asset(Image::path('/'.json_decode($currentblog->config)->picture,'resizeCrop',64,64)) }}" class="dp" />
            <span class="edit-picture"> <i class="glyphicon glyphicon-pencil"></i> Edit </span>
          </a>
        </div>
        <div class="col-sm-9 data">
          <div class="blogname"> {{json_decode($currentblog->config)->title}} </div>
          <p> {{json_decode($currentblog->config)->description}} </p>
        </div>
        <div class="col-sm-1 big trigger">
          <a href="javascript:;" data-toggle="modal" data-target="#changedesc">
            <i class="glyphicon glyphicon-pencil"></i>
          </a>
        </div>
      </div>
      <div class="row setting">
        <div class="col-sm-4 option">
          Username
        </div>
        <div class="col-sm-7 data">
          {{$currentblog->name}}
        </div>
        <div class="col-sm-1 trigger">
          <a href="javascript:;" data-toggle="modal" data-target="#changeusername">
            <i class="glyphicon glyphicon-pencil"></i>
          </a>
        </div>
      </div>
      <div class="row setting">
        <div class="col-sm-4 option">
          Domain
        </div>
        <div class="col-sm-7 data">
          {{$currentblog->domain}}
        </div>
        <div class="col-sm-1 trigger">
          <a href="javascript:;" data-toggle="modal" data-target="#changedomain">
            <i class="glyphicon glyphicon-pencil"></i>
          </a>
        </div>
      </div>
    </div>

    <aside class="sidebar">
      <ul class="nav nav-pills nav-stacked navigation">
        <li class="active"><a href="{{URL::route('settings')}}"> Account Settings </a></li>
        @if(Sentry::getUser()->hasAccess('admin'))
        <li><a href="{{URL::route('adminsettings')}}"> Admin Settings </a></li>
        @endif
        <li><a href="{{URL::route('dashboard')}}">Dashboard </a></li>
      </ul>
      <div class="title">
        Blogs
      </div>
      <ul class="nav nav-pills nav-stacked navigation">
        @foreach($blogs as $blog)
        <li class="@if($currentblog->name == $blog->name) {{'active'}} @endif"><a href="{{URL::route('blogsettings', array('name' => $blog->name))}}"> <img src="{{ asset(Image::path('/'.json_decode($blog->config)->picture,'resizeCrop',32,32)) }}" class="small-img" /> {{json_decode($blog->config)->title}} </a></li>
        @endforeach
        <li class=""><a href="{{URL::route('createblog')}}"> Create New Blog </a></li>
      </ul>
    </aside>
  </section>

</div>

<div class="modal fade" id="changedesc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Change Description</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" role="form" method="post" action="{{URL::to('blog/'.$currentblog->name.'/changeinfo')}}">
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Title</label>
            <div class="col-sm-10">
              <input name="title" type="text" class="form-control" id="inputEmail3" value="{{json_decode($currentblog->config)->title}}">
            </div>
          </div>
          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">description</label>
            <div class="col-sm-10">
              <textarea name="description" class="form-control"></textarea>
            </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
      </form>
    </div>
  </div>
</div><!-- End of change email modal -->

<div class="modal fade" id="changeusername" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Change Username</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" role="form" method="post" action="{{URL::to('blog/'.$currentblog->name.'/changeusername')}}">
          <div class="form-group">
            <label class="col-sm-4 control-label">Username</label>
            <div class="col-sm-8">
              <input name="name" type="text" class="form-control" value="{{$currentblog->name}}" required>
            </div>
          </div>
          <div class="form-group">
            <label for="inputPassword3" class="col-sm-4 control-label">Password</label>
            <div class="col-sm-8">
              <input name="password" type="password" class="form-control" id="inputPassword3" required>
            </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
      </form>
    </div>
  </div>
</div><!-- End of change password modal -->

<div class="modal fade" id="changedomain" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Change Domain</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" role="form" method="post" action="{{URL::to('blog/'.$currentblog->name.'/changedomain')}}">
          <div class="form-group">
            <label class="col-sm-4 control-label">Domain :</label>
            <div class="col-sm-8">
              <input name="domain" type="text" class="form-control" value="{{$currentblog->domain}}">
            </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
      </form>
    </div>
  </div>
</div><!-- End of change domain modal -->

<div class="modal fade" id="changedp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Change Profile Picture</h4>
      </div>
      <div class="modal-body">
      <form class="form-horizontal" enctype="multipart/form-data" role="form" method="post" action="{{URL::to('blog/'.$currentblog->name.'/changeprofilepicture')}}">
        <div class="form-group">
          <label class="col-sm-4 control-label">New Image :</label>
          <div class="col-sm-8">
            <input type="file" name="picture" class="form-control" accept='image/*'>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Upload</button>
        </form>
      </div>
    </div>
  </div>
</div><!-- End of change Profile Picture modal -->

@stop
