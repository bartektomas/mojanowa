<header class="header" >
  <a href="{{URL::route('dashboard')}}" class="logo" >
    <img src="{{asset("assets/images/".Config::get('database.logo'))}}" >
  </a >

  <section class="search" >
    <div class="form-group has-feedback" >
        <form method="get" id="search_form" action="{{URL::to('search')}}">
            <input type="text" name="query" placeholder="Search" class="form-control" value="{{isset($_GET['query'])?$_GET['query']:''}}">
            <span class="glyphicon glyphicon-search form-control-feedback" style="cursor: pointer;" onclick="$('#search_form').submit()" ></span >
        </form>
    </div >
  </section >

  <section class="menu" >
    <ul >
      <li @if(Route::currentRouteName() == 'dashboard') echo class="active"; @endif >
        <a href="{{URL::route('dashboard')}}" >
          <i class="glyphicon glyphicon-home" ></i >
        </a >

        <div class="selection" ></div >
      </li >
      <li @if(Route::currentRouteName() == 'messages' || Route::currentRouteName() == 'blogmessages' ) echo class="active"; @endif >
        <a href="{{URL::route('messages')}}" >
          <i class="glyphicon glyphicon-envelope" ></i >
        </a >

        <div class="selection" ></div >
      </li >
      <li @if(Route::currentRouteName() == 'settings' || Route::currentRouteName() == 'blogsettings' ) echo class="active"; @endif >
        <a href="{{URL::route('settings')}}" >
          <i class="glyphicon glyphicon-cog" ></i >
        </a >

        <div class="selection" ></div >
      </li >
      @if(Sentry::getUser()->hasAccess('admin'))
      <li @if(Route::currentRouteName() == 'usermanagement' || Route::currentRouteName() == 'blogsettings' ) echo class="active"; @endif >
        <a href="{{URL::route('usermanagement')}}" >
          <i class="glyphicon glyphicon-user" ></i >
        </a>
        <div class="selection" ></div >
      </li >
      @endif
      <li >
        <a href="{{URL::route('logout')}}" >
          <i class="glyphicon glyphicon-off" ></i >
        </a >

        <div class="selection" ></div >
      </li >
    </ul >
  </section >
</header >
