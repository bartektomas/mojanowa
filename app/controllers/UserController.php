<?php

  class UserController extends BaseController {

    public function dashboard()
    {
      $ownBlogsPosts = array();
      $user = User::find(Sentry::getUser()->id);
      $userBlogsWithOnlyIDs = $user->blogswithonlyids->toArray();
      $userBlogs = $user->blogs;
      $userFollows = $user->followswithonlyids->toArray();
      $blogs = array_merge(array_map('current', $userBlogsWithOnlyIDs), array_map('current', $userFollows));
      $blogs = array_unique($blogs);
	if(Sentry::getUser()->hasAccess('admin'))  {    
$posts = Post::with('regularPost', 'rebloggedPost', 'tags', 'blog', 'likers')->orderBy('created_at', 'desc')->paginate(10);
}
else
{
$posts = Post::whereIn('blog_id', $blogs )->with('regularPost', 'rebloggedPost', 'tags', 'blog', 'likers')->orderBy('created_at', 'desc')->paginate(10);
}
      $defaultBlog = Blog::where('name', '=', $user->username)->first()->toArray();
      // print_r($posts);
      return View::make('dashboard')->withPosts($posts)->withDefaultblog($defaultBlog)->withBlogs($userBlogs)->withUser($user);
    }

    public function saveUser()
    {
      try
      {
        // Create the user
        $user = Sentry::createUser(array(
                                     'email'      => Input::get('email'),
                                     'password'   => Input::get('password'),
                                     'username'   => Input::get('username'),
                                     'activated'  => false
                                   ));

        // Find the group using the group id
        $userGroup = Sentry::findGroupById(1);

        // Assign the group to the user
        $user->addGroup($userGroup);

        // Log the user in
        //Sentry::login($user, false);

        $activationCode = $user->getActivationCode(); // Get Activation Code

        $activationLink = URL::to('authenticate')."?email=".$_POST['email']."&code=".$activationCode;

        $payload = array(
          'message' => array(
              'subject' => 'Activate your account',
              'html' => $activationLink,
              'from_email' => Config::get('database.email'),
              'to' => array(array('email'=>Input::get('email')))
          )
      );


        $response = Mandrill::request('messages/send', $payload);



      }
      catch (Cartalyst\Sentry\Users\LoginRequiredException $e)
      {
        return Redirect::route('register')->with('error', 'Login Field is Required');
      }
      catch (Cartalyst\Sentry\Users\PasswordRequiredException $e)
      {
        return Redirect::route('register')->withInput()->with('error', 'Password Field is Required');
      }
      catch (Cartalyst\Sentry\Users\UserExistsException $e)
      {
        return Redirect::route('register')->withInput(Input::except('password'))->with('error', 'User Already Exists');
      }
      catch (Cartalyst\Sentry\Groups\GroupNotFoundException $e)
      {
        return Redirect::route('register')->withInput(Input::except('password'))->with('error', 'Group Not Found');
      }

      // Create a blog with the username
      $blog = new Blog();
      $blog->name = $user->username;
      $blog->config = json_encode(array('title' => 'Untitled', 'picture' => 'assets/images/default_avatar.png', 'description' => '', 'customcss' => ''));
      $blog->author()->associate($user);
      $blog->save();

      // Redirect to Login
      return Redirect::route('login')->with('success', 'Check your mail for authentication link');

    }

    public function loginUser()
    {
      try
      {
        $credentials = array(
          'email'    => htmlentities($_POST['email']),
          'password' => htmlentities($_POST['password']),
        );

        $user = Sentry::authenticate($credentials, false);

      }
      catch (Cartalyst\Sentry\Users\LoginRequiredException $e)
      {
        return Redirect::route('login')->withInput(Input::except('password'))->with('error', 'Login Field is Required');
      }
      catch (Cartalyst\Sentry\Users\PasswordRequiredException $e)
      {
        return Redirect::route('login')->withInput(Input::except('password'))->with('error', 'Password Field is Required');
      }
      catch (Cartalyst\Sentry\Users\WrongPasswordException $e)
      {
        return Redirect::route('login')->withInput(Input::except('password'))->with('error', 'Wrong password, try again.');
      }
      catch (Cartalyst\Sentry\Users\UserNotFoundException $e)
      {
        return Redirect::route('login')->withInput(Input::except('password'))->with('error', 'User was not found.');
      }
      catch (Cartalyst\Sentry\Users\UserNotActivatedException $e)
      {
        return Redirect::route('login')->withInput(Input::except('password'))->with('error', 'User is not activated.');
      }
      catch (Cartalyst\Sentry\Throttling\UserSuspendedException $e)
      {
        return Redirect::route('login')->withInput(Input::except('password'))->with('error', 'User is suspended.');
      }
      catch (Cartalyst\Sentry\Throttling\UserBannedException $e)
      {
        return Redirect::route('login')->withInput(Input::except('password'))->with('error', 'User is banned.');
      }

      // Redirect to dashboard
      return Redirect::route('dashboard')->with('success', 'Login Successful');
    }

    public function logoutUser()
    {
      Sentry::logout();
      return Redirect::route('login')->with('success', 'Logout Successful');
    }

    public function createBlog()
    {
      return View::make('createBlog');
    }

    public function saveBlog()
    {
      $user = User::find(Sentry::getUser()->id);
      $blog = new Blog();
      $blog->name = htmlentities($_POST['name']);
      $blog->config = json_encode(array('title' => htmlentities($_POST['title']), 'picture' => 'assets/images/default_avatar.png', 'description' => '', 'customcss' => ''));
      $blog->author()->associate($user);
      $blog->save();
      return Redirect::route('dashboard');
    }

    public function blogDashboard($name)
    {
      $currentBlog = Blog::where('name', '=', $name)->first();
      $user = User::find(Sentry::getUser()->id);
      $userBlogs = $user->blogs->all();
      if($currentBlog->user_id == Sentry::getUser()->id)
      {
        $posts = Post::where('blog_id', '=', $currentBlog->id)->with('regularPost', 'rebloggedPost', 'tags', 'blog')->orderBy('created_at', 'desc')->paginate(10);
        return View::make('blogDashboard')->withPosts($posts)->withBlog($currentBlog)->withBlogs($userBlogs)->withUser($user);
      }
      else
      {
        return Redirect::route('dashboard')->withError('You don\'t have enough permission.');
      }

    }

    public function like($post_id)
    {
      if (Request::ajax())
      {
        $user = User::find(Sentry::getUser()->id);
        $user->likes()->attach($post_id);
        $response = array('message' => 'Liked', 'url' => URL::to('unlike/'.$post_id));
        return Response::json($response);
      }
      else
      {
        return Response::make('Page not found', 404);
      }
    }

    public function unlike($post_id)
    {
      if (Request::ajax())
      {
        $user = User::find(Sentry::getUser()->id);
        $user->likes()->detach($post_id);
        $response = array('message' => 'Unliked', 'url' => URL::to('like/'.$post_id));
        return Response::json($response);
      }
      else
      {
        return Response::make('Page not found', 404);
      }
    }

    public function tagboard($name)
    {
      $currentTag = Tag::where('name', '=', $name)->first();
      if(Sentry::getUser())
      {
        $user = User::find(Sentry::getUser()->id);
        $userBlogs = $user->blogs->all();
        if($currentTag)
        {
          $posts = $currentTag->posts->all();
          function cmp($a, $b)
          {
            return strcmp($b->created_at, $a->created_at);
          }

          usort($posts, "cmp");
          return View::make('tagboard')->withPosts($posts)->withTagname($name)->withUser($user)->withBlogs($userBlogs);
        }
        else
        {
          $posts = array();
          return View::make('tagboard')->withPosts($posts)->withTagname($name)->withUser($user);
        }
      }
      else
      {
          if($currentTag)
          {
              $posts = $currentTag->posts->all();
              function cmp($a, $b)
              {
                return strcmp($b->created_at, $a->created_at);
              }

              usort($posts, "cmp");
              return View::make('publictagboard')->withPosts($posts)->withName('#'.$name);
          }
          else
          {
              $posts = array();
              return View::make('publictagboard')->withPosts($posts)->withName('#'.$name);
          }
      }

    }

    public function follow($domain, $blog_id)
    {
      $user = User::find(Sentry::getUser()->id);
      $user->follows()->attach($blog_id);
      $response = array('message' => 'Followed', 'url' => 'http://'.$domain.'.'.Config::get('database.domain').'/unfollow/'.$blog_id);
      return Response::json($response);
    }

    public function unfollow($domain, $blog_id)
    {
      $user = User::find(Sentry::getUser()->id);
      $user->follows()->detach($blog_id);
      $response = array('message' => 'Unfollowed', 'url' => 'http://'.$domain.'.'.Config::get('database.domain').'/follow/'.$blog_id);
      return Response::json($response);
    }

    public function settings()
    {
      $user = User::find(Sentry::getUser()->id);
      $userBlogs = $user->blogs->all();
      return View::make('settings')->withBlogs($userBlogs)->withUser($user);
    }

    public function changeEmail()
    {
      $user = Sentry::getUser();
      if($user->checkPassword(Input::get('password')))
      {
        $user->email = htmlentities(Input::get('email'));
        $user->save();
        return Redirect::route('settings')->withSuccess('Email Updated');
      }
      else
      {
        return Redirect::route('settings')->withError('Incorrect Password. Try Again.');
      }
    }

    public function changePassword()
    {
      $user = Sentry::getUser();
      if($user->checkPassword(Input::get('oldpassword')))
      {
        $user->password = htmlentities(Input::get('password'));
        $user->save();
        return Redirect::route('settings')->withSuccess('Password Updated');
      }
      else
      {
        return Redirect::route('settings')->withError('Incorrect Password. Try Again.');
      }
    }

      public function search()
      {
          $query = Input::get('query');
          $posts = Post::whereRaw("search_index LIKE '%".$query."%'")->with('regularPost', 'rebloggedPost', 'tags', 'blog')->orderBy('created_at','desc')->paginate(10);
	$bloggers = Blog::whereRaw("name LIKE '%".$query."%'")->take(10)->get();

          if(Sentry::getUser())
          {
              $user = User::find(Sentry::getUser()->id);
              $userBlogs = $user->blogs->all();
              return View::make('search')->withPosts($posts)->withQuery($query)->withUser($user)->withBlogs($userBlogs)->withBloggers($bloggers);
          }
          else
          {
              return View::make('publictagboard')->withPosts($searchposts)->withName($query)->withBloggers($bloggers);
          }

      }

      function authenticate(){

    try{
      $user = Sentry::findUserByLogin($_GET['email']);  
    }
    catch(Cartalyst\Sentry\Users\UserNotFoundException $e)
    {
      Session::put('flash_error','User Not Found');
    }


    

    try{


      if ($user->attemptActivation($_GET['code']))
        {
            return Redirect::route('login')->with('success','Your account has been activated Successfully. Login now...');
        }
        else
        {
            return Redirect::to('/')->with('error','Activation failed :(');
        }
    }
    catch(Cartalyst\Sentry\Users\UserAlreadyActivatedException $e)
    {
      Session::put('flash_error','You already activated your Account');
    }

    return Redirect::route('login');
  }

  public function ban($id)
  {
    try
    {
        $throttle = Sentry::findThrottlerByUserId($id);

        if($suspended = $throttle->isBanned())
        {
          Session::flash('error','This user is already banned.');
        }
        else
        {
          $throttle->ban();

          Session::flash('error','User has been banned Successfully :)');
        }
        
    }
    catch (Cartalyst\Sentry\Users\UserNotFoundException $e)
    {
        Session::flash('error','User was not found.');
    }

    return Redirect::to('users');
  }

	 public function unban($id)
  {
    try
    {
        $throttle = Sentry::findThrottlerByUserId($id);

        if($suspended = $throttle->isBanned())
        {
		$throttle->unban();
          Session::flash('success','This user is unbanned successfully.');
        }
        else
        {
          Session::flash('error','User is not banned');
        }
        
    }
    catch (Cartalyst\Sentry\Users\UserNotFoundException $e)
    {
        Session::flash('error','User was not found.');
    }

    return Redirect::to('users');
  }

  }
