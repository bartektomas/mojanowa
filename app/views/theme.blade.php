<!DOCTYPE html>
<html>
<head>
	<title>{{json_decode($blog->config)->title}}</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="{{asset('theme/css/style.css')}}">
	<link rel="stylesheet" href="{{asset('theme/css/lightbox.css')}}">
	
	<style type="text/css">
	@if(isset(json_decode($blog->config)->customcss))
		{{json_decode($blog->config)->customcss}}
	@endif
	a .no_of_likes{
		font-size: 20px;
		font-weight: normal;
		color: #aaa;
	}
	</style>
	
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<a href="{{URL::route('publicblog', array('name' => $blog->name))}}" class="main-title"> {{json_decode($blog->config)->title}} </a>
				@if(Sentry::check())
				<?php $userLikes = User::find(Sentry::getUser()->id)->likes; ?>
				@endif
				@foreach($posts as $post)
				@if($post->type == 'regular')
				@if($post->regularPost['type'] == 'text')
				<div class="post">
					<h2 class="post-title"> {{json_decode($post->regularPost->content)->title}} </h2>
					<p> {{json_decode($post->regularPost->content)->content}}</p>
					@foreach($post->tags as $tag)
            <a class="tag" href="{{URL::route('tagged', array('name' => $tag->name))}}" >#{{$tag->name}}</a >
           @endforeach
					<div class="post-footer">
								<a href="javascript:;" class="date">{{date('d M Y', strtotime($post->created_at))}}</a>
								<div class="pull-right actions">
									<!-- <a href="javascript:;"> <i class="glyphicon glyphicon-retweet"></i></a> -->
									@if(!Sentry::check())
									<a href="{{URL::route('login')}}"> <i class="glyphicon glyphicon-heart"></i></a>
									@else
										@if($userLikes->contains($post->id))
				              <a href="javascript:;" data-href="{{URL::to('unlike/'.$post->id)}}" class="option like_button" >
				                <span class="no_of_likes">{{$post->likers->count()}}</span><i class="glyphicon glyphicon-heart" style="color:#FF6448"></i >
				              </a >
				            @else
				            <a href="javascript:;" data-href="{{URL::to('like/'.$post->id)}}" class="option like_button" >
				              <i class="glyphicon glyphicon-heart" ></i >
				            </a >
				            @endif
									@endif
								</div>
					</div>
				</div>
				@elseif($post->regularPost['type'] == 'image')
				<div class="post">
				   @foreach(json_decode($post->regularPost->content)->files as $file)
				   	@if(json_decode($post->regularPost->content)->files[0] == $file)
            <img src="{{asset($file)}}" >
            @else
            <img src="{{asset($file)}}" >
            @endif
            </br>
          @endforeach

					@foreach($post->tags as $tag)
            <a class="tag" href="{{URL::route('tagged', array('name' => $tag->name))}}" >#{{$tag->name}}</a >
           @endforeach
					<div class="post-footer">
								<a href="javascript:;" class="date">{{date('d M Y', strtotime($post->created_at))}}</a>
								<div class="pull-right actions">
									<!-- <a href="javascript:;"> <i class="glyphicon glyphicon-retweet"></i></a> -->
									@if(!Sentry::check())
									<a href="{{URL::route('login')}}"> <i class="glyphicon glyphicon-heart"></i></a>
									@else
										@if($userLikes->contains($post->id))
				              <a href="javascript:;" data-href="{{URL::to('unlike/'.$post->id)}}" class="option like_button" >
				                <span class="no_of_likes">{{$post->likers->count()}}</span><i class="glyphicon glyphicon-heart" style="color:#FF6448"></i >
				              </a >
				            @else
				            <a href="javascript:;" data-href="{{URL::to('like/'.$post->id)}}" class="option like_button" >
				              <i class="glyphicon glyphicon-heart" ></i >
				            </a >
				            @endif
									@endif
								</div>
					</div>
				</div>
				@elseif($post->regularPost['type'] == 'quote')
				<div class="post">
					<h2 class="post-title quote"> "{{json_decode($post->regularPost->content)->content}}" </h2>
					<p> - {{json_decode($post->regularPost->content)->source}}</p>
					@foreach($post->tags as $tag)
            <a class="tag" href="{{URL::route('tagged', array('name' => $tag->name))}}" >#{{$tag->name}}</a >
           @endforeach
					<div class="post-footer">
								<a href="javascript:;" class="date">{{date('d M Y', strtotime($post->created_at))}}</a>
								<div class="pull-right actions">
									<!-- <a href="javascript:;"> <i class="glyphicon glyphicon-retweet"></i></a> -->
									@if(!Sentry::check())
									<a href="{{URL::route('login')}}"> <i class="glyphicon glyphicon-heart"></i></a>
									@else
										@if($userLikes->contains($post->id))
				              <a href="javascript:;" data-href="{{URL::to('unlike/'.$post->id)}}" class="option like_button" >
				                <span class="no_of_likes">{{$post->likers->count()}}</span><i class="glyphicon glyphicon-heart" style="color:#FF6448"></i >
				              </a >
				            @else
				            <a href="javascript:;" data-href="{{URL::to('like/'.$post->id)}}" class="option like_button" >
				              <i class="glyphicon glyphicon-heart" ></i >
				            </a >
				            @endif
									@endif
								</div>
					</div>
				</div>
				@elseif($post->regularPost['type'] == 'link')
				<div class="post">
					<h2 class="post-title"> <a href="{{json_decode($post->regularPost->content)->url}}" rel="nofollow" class="title" > {{json_decode($post->regularPost->content)->title}} </a > </h2>
					<p> {{json_decode($post->regularPost->content)->caption}} </p>
					@foreach($post->tags as $tag)
            <a class="tag" href="{{URL::route('tagged', array('name' => $tag->name))}}" >#{{$tag->name}}</a >
           @endforeach
					<div class="post-footer">
								<a href="javascript:;" class="date">{{date('d M Y', strtotime($post->created_at))}}</a>
								<div class="pull-right actions">
									<!-- <a href="javascript:;"> <i class="glyphicon glyphicon-retweet"></i></a> -->
									@if(!Sentry::check())
									<a href="{{URL::route('login')}}"> <i class="glyphicon glyphicon-heart"></i></a>
									@else
										@if($userLikes->contains($post->id))
				              <a href="javascript:;" data-href="{{URL::to('unlike/'.$post->id)}}" class="option like_button" >
				                <span class="no_of_likes">{{$post->likers->count()}}</span><i class="glyphicon glyphicon-heart" style="color:#FF6448"></i >
				              </a >
				            @else
				            <a href="javascript:;" data-href="{{URL::to('like/'.$post->id)}}" class="option like_button" >
				              <i class="glyphicon glyphicon-heart" ></i >
				            </a >
				            @endif
									@endif
								</div>
					</div>
				</div>
				@elseif($post->regularPost['type'] == 'chat')
				<div class="post">
					<h2 class="post-title"> {{json_decode($post->regularPost->content)->title}} </h2>
					<p> {{nl2br(json_decode($post->regularPost->content)->content)}}</p>
					@foreach($post->tags as $tag)
            <a class="tag" href="{{URL::route('tagged', array('name' => $tag->name))}}" >#{{$tag->name}}</a >
           @endforeach
					<div class="post-footer">
								<a href="javascript:;" class="date">{{date('d M Y', strtotime($post->created_at))}}</a>
								<div class="pull-right actions">
									<!-- <a href="javascript:;"> <i class="glyphicon glyphicon-retweet"></i></a> -->
									@if(!Sentry::check())
									<a href="{{URL::route('login')}}"> <i class="glyphicon glyphicon-heart"></i></a>
									@else
										@if($userLikes->contains($post->id))
				              <a href="javascript:;" data-href="{{URL::to('unlike/'.$post->id)}}" class="option like_button" >
				                <span class="no_of_likes">{{$post->likers->count()}}</span><i class="glyphicon glyphicon-heart" style="color:#FF6448"></i >
				              </a >
				            @else
				            <a href="javascript:;" data-href="{{URL::to('like/'.$post->id)}}" class="option like_button" >
				              <i class="glyphicon glyphicon-heart" ></i >
				            </a >
				            @endif
									@endif
								</div>
					</div>
				</div>
				@elseif($post->regularPost['type'] == 'video')
				<div class="post">
					<div class="videoWrapper">
				  	<video width="100%" height="100%" controls preload="auto" src="{{URL::asset(json_decode($post->regularPost->content)->url)}}" type="video/mp4" id="player1"  controls="controls" preload="none" ></video >
					</div>
					</br>
					</br>
					@foreach($post->tags as $tag)
            <a class="tag" href="{{URL::route('tagged', array('name' => $tag->name))}}" >#{{$tag->name}}</a >
           @endforeach
					<div class="post-footer">
								<a href="javascript:;" class="date">{{date('d M Y', strtotime($post->created_at))}}</a>
								<div class="pull-right actions">
									<!-- <a href="javascript:;"> <i class="glyphicon glyphicon-retweet"></i></a> -->
									@if(!Sentry::check())
									<a href="{{URL::route('login')}}"> <i class="glyphicon glyphicon-heart"></i></a>
									@else
										@if($userLikes->contains($post->id))
				              <a href="javascript:;" data-href="{{URL::to('unlike/'.$post->id)}}" class="option like_button" >
				                <span class="no_of_likes">{{$post->likers->count()}}</span><i class="glyphicon glyphicon-heart" style="color:#FF6448"></i >
				              </a >
				            @else
				            <a href="javascript:;" data-href="{{URL::to('like/'.$post->id)}}" class="option like_button" >
				              <i class="glyphicon glyphicon-heart" ></i >
				            </a >
				            @endif
									@endif
								</div>
					</div>
				</div>
				@elseif($post->regularPost['type'] == 'audio')
				<div class="post">
					<div class="videoWrapper">
				  	<audio controls width="495" >
            <source src="{{URL::asset(json_decode($post->regularPost->content)->url)}}" type="audio/mpeg" >
            Your browser does not support the audio element.
          </audio >
					</div>
					@foreach($post->tags as $tag)
            <a class="tag" href="{{URL::route('tagged', array('name' => $tag->name))}}" >#{{$tag->name}}</a >
           @endforeach
					<div class="post-footer">
								<a href="javascript:;" class="date">{{date('d M Y', strtotime($post->created_at))}}</a>
								<div class="pull-right actions">
									<!-- <a href="javascript:;"> <i class="glyphicon glyphicon-retweet"></i></a> -->
									@if(!Sentry::check())
									<a href="{{URL::route('login')}}"> <i class="glyphicon glyphicon-heart"></i></a>
									@else
										@if($userLikes->contains($post->id))
				              <a href="javascript:;" data-href="{{URL::to('unlike/'.$post->id)}}" class="option like_button" >
				                <span class="no_of_likes">{{$post->likers->count()}}</span><i class="glyphicon glyphicon-heart" style="color:#FF6448"></i >
				              </a >
				            @else
				            <a href="javascript:;" data-href="{{URL::to('like/'.$post->id)}}" class="option like_button" >
				              <i class="glyphicon glyphicon-heart" ></i >
				            </a >
				            @endif
									@endif
								</div>
					</div>
				</div>
				@endif
				@elseif($post->type == 'reblogged')
				@if($post->rebloggedPost->originalPost->regularPost['type'] == 'text')
				<div class="post">
					<p> {{json_decode($post->rebloggedPost->content)->comment}} </p>
					<div class="quoted">
						<span class="posted-by"> originally posted by <a href="http://{{$post->rebloggedPost->originalPost->blog->name}}.{{Config::get('database.domain')}}"> {{json_decode($post->rebloggedPost->originalPost->blog->config)->title}} </a> </span>
						<h2 class="post-title"> {{json_decode($post->rebloggedPost->originalPost->regularPost->content)->title}} </h2>
						<p> {{json_decode($post->rebloggedPost->originalPost->regularPost->content)->content}}</p>
					</div>
					@foreach($post->rebloggedPost->originalPost->tags as $tag)
            <a class="tag" href="{{URL::route('tagged', array('name' => $tag->name))}}" >#{{$tag->name}}</a >
           @endforeach
					<div class="post-footer">
								<a href="javascript:;" class="date">{{date('d M Y', strtotime($post->created_at))}}</a>
								<div class="pull-right actions">
									<!-- <a href="javascript:;"> <i class="glyphicon glyphicon-retweet"></i></a> -->
									@if(!Sentry::check())
									<a href="{{URL::route('login')}}"> <i class="glyphicon glyphicon-heart"></i></a>
									@else
										@if($userLikes->contains($post->id))
				              <a href="javascript:;" data-href="{{URL::to('unlike/'.$post->id)}}" class="option like_button" >
				                <span class="no_of_likes">{{$post->likers->count()}}</span><i class="glyphicon glyphicon-heart" style="color:#FF6448"></i >
				              </a >
				            @else
				            <a href="javascript:;" data-href="{{URL::to('like/'.$post->id)}}" class="option like_button" >
				              <i class="glyphicon glyphicon-heart" ></i >
				            </a >
				            @endif
									@endif
								</div>
					</div>
				</div>
				@elseif($post->rebloggedPost->originalPost->regularPost['type'] == 'image')
				<div class="post">
				<p> {{json_decode($post->rebloggedPost->content)->comment}} </p>
					<div class="quoted">
						<span class="posted-by"> originally posted by <a href="http://{{$post->rebloggedPost->originalPost->blog->name}}.{{Config::get('database.domain')}}"> {{json_decode($post->rebloggedPost->originalPost->blog->config)->title}} </a> </span>
				   @foreach(json_decode($post->rebloggedPost->originalPost->regularPost->content)->files as $file)
				   	@if(json_decode($post->rebloggedPost->originalPost->regularPost->content)->files[0] == $file)
            <img src="{{asset($file)}}"  >
            @else
            <img src="{{asset($file)}}" >
            @endif
           @endforeach
          </div>
					@foreach($post->rebloggedPost->originalPost->tags as $tag)
            <a class="tag" href="{{URL::route('tagged', array('name' => $tag->name))}}" >#{{$tag->name}}</a >
           @endforeach
					<div class="post-footer">
								<a href="javascript:;" class="date">{{date('d M Y', strtotime($post->created_at))}}</a>
								<div class="pull-right actions">
									<!-- <a href="javascript:;"> <i class="glyphicon glyphicon-retweet"></i></a> -->
									@if(!Sentry::check())
									<a href="{{URL::route('login')}}"> <i class="glyphicon glyphicon-heart"></i></a>
									@else
										@if($userLikes->contains($post->id))
				              <a href="javascript:;" data-href="{{URL::to('unlike/'.$post->id)}}" class="option like_button" >
				                <span class="no_of_likes">{{$post->likers->count()}}</span><i class="glyphicon glyphicon-heart" style="color:#FF6448"></i >
				              </a >
				            @else
				            <a href="javascript:;" data-href="{{URL::to('like/'.$post->id)}}" class="option like_button" >
				              <i class="glyphicon glyphicon-heart" ></i >
				            </a >
				            @endif
									@endif
								</div>
					</div>
				</div>
				@elseif($post->rebloggedPost->originalPost->regularPost['type'] == 'quote')
				<div class="post">
				<p> {{json_decode($post->rebloggedPost->content)->comment}} </p>
					<div class="quoted">
						<span class="posted-by"> originally posted by <a href="http://{{$post->rebloggedPost->originalPost->blog->name}}.{{Config::get('database.domain')}}"> {{json_decode($post->rebloggedPost->originalPost->blog->config)->title}} </a> </span>
					<h2 class="post-title quote"> "{{json_decode($post->rebloggedPost->originalPost->regularPost->content)->content}}" </h2>
					<p> - {{json_decode($post->rebloggedPost->originalPost->regularPost->content)->source}}</p>
					</div>
					@foreach($post->rebloggedPost->originalPost->tags as $tag)
            <a class="tag" href="{{URL::route('tagged', array('name' => $tag->name))}}" >#{{$tag->name}}</a >
           @endforeach
					<div class="post-footer">
								<a href="javascript:;" class="date">{{date('d M Y', strtotime($post->created_at))}}</a>
								<div class="pull-right actions">
									<!-- <a href="javascript:;"> <i class="glyphicon glyphicon-retweet"></i></a> -->
									@if(!Sentry::check())
									<a href="{{URL::route('login')}}"> <i class="glyphicon glyphicon-heart"></i></a>
									@else
										@if($userLikes->contains($post->id))
				              <a href="javascript:;" data-href="{{URL::to('unlike/'.$post->id)}}" class="option like_button" >
				                <span class="no_of_likes">{{$post->likers->count()}}</span><i class="glyphicon glyphicon-heart" style="color:#FF6448"></i >
				              </a >
				            @else
				            <a href="javascript:;" data-href="{{URL::to('like/'.$post->id)}}" class="option like_button" >
				              <i class="glyphicon glyphicon-heart" ></i >
				            </a >
				            @endif
									@endif
								</div>
					</div>
				</div>
				@elseif($post->rebloggedPost->originalPost->regularPost['type'] == 'link')
				<div class="post">
				<p> {{json_decode($post->rebloggedPost->content)->comment}} </p>
					<div class="quoted">
						<span class="posted-by"> originally posted by <a href="http://{{$post->rebloggedPost->originalPost->blog->name}}.{{Config::get('database.domain')}}"> {{json_decode($post->rebloggedPost->originalPost->blog->config)->title}} </a> </span>
					<h2 class="post-title"> <a href="{{json_decode($post->rebloggedPost->originalPost->regularPost->content)->url}}" rel="nofollow" class="title" > {{json_decode($post->rebloggedPost->originalPost->regularPost->content)->title}} </a > </h2>
					<p> {{json_decode($post->rebloggedPost->originalPost->regularPost->content)->caption}} </p>
					</div>
					@foreach($post->rebloggedPost->originalPost->tags as $tag)
            <a class="tag" href="{{URL::route('tagged', array('name' => $tag->name))}}" >#{{$tag->name}}</a >
           @endforeach
					<div class="post-footer">
								<a href="javascript:;" class="date">{{date('d M Y', strtotime($post->created_at))}}</a>
								<div class="pull-right actions">
									<!-- <a href="javascript:;"> <i class="glyphicon glyphicon-retweet"></i></a> -->
									@if(!Sentry::check())
									<a href="{{URL::route('login')}}"> <i class="glyphicon glyphicon-heart"></i></a>
									@else
										@if($userLikes->contains($post->id))
				              <a href="javascript:;" data-href="{{URL::to('unlike/'.$post->id)}}" class="option like_button" >
				                <span class="no_of_likes">{{$post->likers->count()}}</span><i class="glyphicon glyphicon-heart" style="color:#FF6448"></i >
				              </a >
				            @else
				            <a href="javascript:;" data-href="{{URL::to('like/'.$post->id)}}" class="option like_button" >
				              <i class="glyphicon glyphicon-heart" ></i >
				            </a >
				            @endif
									@endif
								</div>
					</div>
				</div>
				@elseif($post->rebloggedPost->originalPost->regularPost['type'] == 'chat')
				<div class="post">
				<p> {{json_decode($post->rebloggedPost->content)->comment}} </p>
					<div class="quoted">
						<span class="posted-by"> originally posted by <a href="http://{{$post->rebloggedPost->originalPost->blog->name}}.{{Config::get('database.domain')}}"> {{json_decode($post->rebloggedPost->originalPost->blog->config)->title}} </a> </span>
					<h2 class="post-title"> {{json_decode($post->rebloggedPost->originalPost->regularPost->content)->title}} </h2>
					<p> {{nl2br(json_decode($post->rebloggedPost->originalPost->regularPost->content)->content)}}</p>
					</div>
					@foreach($post->rebloggedPost->originalPost->tags as $tag)
            <a class="tag" href="{{URL::route('tagged', array('name' => $tag->name))}}" >#{{$tag->name}}</a >
           @endforeach
					<div class="post-footer">
								<a href="javascript:;" class="date">{{date('d M Y', strtotime($post->created_at))}}</a>
								<div class="pull-right actions">
									<!-- <a href="javascript:;"> <i class="glyphicon glyphicon-retweet"></i></a> -->
									@if(!Sentry::check())
									<a href="{{URL::route('login')}}"> <i class="glyphicon glyphicon-heart"></i></a>
									@else
										@if($userLikes->contains($post->id))
				              <a href="javascript:;" data-href="{{URL::to('unlike/'.$post->id)}}" class="option like_button" >
				                <span class="no_of_likes">{{$post->likers->count()}}</span><i class="glyphicon glyphicon-heart" style="color:#FF6448"></i >
				              </a >
				            @else
				            <a href="javascript:;" data-href="{{URL::to('like/'.$post->id)}}" class="option like_button" >
				              <i class="glyphicon glyphicon-heart" ></i >
				            </a >
				            @endif
									@endif
								</div>
					</div>
				</div>
				@elseif($post->rebloggedPost->originalPost->regularPost['type'] == 'video')
				<div class="post">
				<p> {{json_decode($post->rebloggedPost->content)->comment}} </p>
					<div class="quoted">
						<span class="posted-by"> originally posted by <a href="http://{{$post->rebloggedPost->originalPost->blog->name}}.{{Config::get('database.domain')}}"> {{json_decode($post->rebloggedPost->originalPost->blog->config)->title}} </a> </span>
					<div class="videoWrapper">
				  	<video width="100%" height="100%" controls preload="auto" src="{{URL::asset(json_decode($post->rebloggedPost->originalPost->regularPost->content)->url)}}?random=1" type="video/mp4" id="player1"  controls="controls" preload="none" ></video >
					</div>
					<br>
					<br>
					</div>
					@foreach($post->rebloggedPost->originalPost->tags as $tag)
            <a class="tag" href="{{URL::route('tagged', array('name' => $tag->name))}}" >#{{$tag->name}}</a >
           @endforeach
					<div class="post-footer">
								<a href="javascript:;" class="date">{{date('d M Y', strtotime($post->created_at))}}</a>
								<div class="pull-right actions">
									<!-- <a href="javascript:;"> <i class="glyphicon glyphicon-retweet"></i></a> -->
									@if(!Sentry::check())
									<a href="{{URL::route('login')}}"> <i class="glyphicon glyphicon-heart"></i></a>
									@else
										@if($userLikes->contains($post->id))
				              <a href="javascript:;" data-href="{{URL::to('unlike/'.$post->id)}}" class="option like_button" >
				                <span class="no_of_likes">{{$post->likers->count()}}</span><i class="glyphicon glyphicon-heart" style="color:#FF6448"></i >
				              </a >
				            @else
				            <a href="javascript:;" data-href="{{URL::to('like/'.$post->id)}}" class="option like_button" >
				              <i class="glyphicon glyphicon-heart" ></i >
				            </a >
				            @endif
									@endif
								</div>
					</div>
				</div>
				@elseif($post->rebloggedPost->originalPost->regularPost['type'] == 'audio')
				<div class="post">
				<p> {{json_decode($post->rebloggedPost->content)->comment}} </p>
					<div class="quoted">
						<span class="posted-by"> originally posted by <a href="http://{{$post->rebloggedPost->originalPost->blog->name}}.{{Config::get('database.domain')}}"> {{json_decode($post->rebloggedPost->originalPost->blog->config)->title}} </a> </span>
					<div class="videoWrapper">
				  	<audio controls width="495" >
            <source src="{{URL::asset(json_decode($post->rebloggedPost->originalPost->regularPost->content)->url)}}" type="audio/mpeg" >
            Your browser does not support the audio element.
          </audio >
					</div>
					</div>
					@foreach($post->rebloggedPost->originalPost->tags as $tag)
            <a class="tag" href="{{URL::route('tagged', array('name' => $tag->name))}}" >#{{$tag->name}}</a >
           @endforeach
					<div class="post-footer">
								<a href="javascript:;" class="date">{{date('d M Y', strtotime($post->created_at))}}</a>
								<div class="pull-right actions">
									<!-- <a href="javascript:;"> <i class="glyphicon glyphicon-retweet"></i></a> -->
									@if(!Sentry::check())
									<a href="{{URL::route('login')}}"> <i class="glyphicon glyphicon-heart"></i></a>
									@else
										@if($userLikes->contains($post->id))
				              <a href="javascript:;" data-href="{{URL::to('unlike/'.$post->id)}}" class="option like_button" >
				                <span class="no_of_likes">{{$post->likers->count()}}</span><i class="glyphicon glyphicon-heart" style="color:#FF6448"></i >
				              </a >
				            @else
				            <a href="javascript:;" data-href="{{URL::to('like/'.$post->id)}}" class="option like_button" >
				              <i class="glyphicon glyphicon-heart" ></i >
				            </a >
				            @endif
									@endif
								</div>
					</div>
				</div>
				@endif
				@endif
				@endforeach

			<?php echo $posts->links(); ?>

				<div class="footer">
					<h3> {{json_decode($blog->config)->description}} </h3>
					<h5> powered by {{Config::get('database.domain')}} </h5> 

				</div>
			</div>
		</div>
	</div>

	<div class="rumblr-actions">
		@if(!Sentry::check()) 
		<a href="{{URL::route('login')}}" class="rumblr-btn"> <i class="glyphicon glyphicon-home"></i> Sign in/Sign up </a>
		<a href="{{URL::route('login')}}" class="rumblr-btn"> <i class="glyphicon glyphicon-plus"></i> Follow </a>
		@else
		<a href="{{URL::route('dashboard')}}" class="rumblr-btn"> <i class="glyphicon glyphicon-home"></i> Dashboard </a>
			@if(User::find(Sentry::getUser()->id)->follows->contains($blog->id))
			<a href="javascript:;" data-href="{{URL::route('unfollow', array('domain' => $blog->name, 'id' => $blog->id))}}" class="rumblr-btn follow-btn"> <i class="glyphicon glyphicon-minus"></i> Unfollow </a>
			@else
			<a href="javascript:;" data-href="{{URL::route('follow', array('domain' => $blog->name, 'id' => $blog->id))}}" class="rumblr-btn follow-btn"> <i class="glyphicon glyphicon-plus"></i> Follow </a>
			@endif
			@if(count($posts) == 1)
				<!-- <a href="#" class="rumblr-btn"> <i class="glyphicon glyphicon-heart"></i> </a>
				<a href="#" class="rumblr-btn"> <i class="glyphicon glyphicon-retweet"></i> Reblog </a> -->
			@endif
		@endif  
	</div>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="{{asset('theme/js/lightbox.min.js')}}" type="text/javascript" charset="utf-8" async defer></script>
	<script type="text/javascript">
		$('.like_button').click(function(){
	    $(this).attr('id', 'like_button');
	    $.ajax($(this).attr('data-href'))
	    .done(function( data ) {
	       if(data.message == 'Liked')
	       {
	         $('#like_button').children('i').css('color', '#FF6448');
	         $('#like_button').attr('data-href', data.url);
		$('#like_button').children('span').html(parseInt($('#like_button').children('span').html())+1);
	         $('#like_button').removeAttr('id');
	       }
	       else
	       {
	         $('#like_button').children('i').removeAttr('style');
	         $('#like_button').attr('data-href', data.url);
		$('#like_button').children('span').html(parseInt($('#like_button').children('span').html())-1);
	         $('#like_button').removeAttr('id');
	       }
	       console.log( data );
	    });
  	});
  	$('.follow-btn').click(function(){
	    $(this).attr('id', 'follow_button');
	    $.ajax($(this).attr('data-href'))
	    .done(function( data ) {
	       if(data.message == 'Followed')
	       {
	       	 $('#follow_button').html('Unfollow');
	         $('#follow_button').children('i').addClass('glyphicon-plus').removeClass('glyphicon-minus');
	         $('#follow_button').attr('data-href', data.url);
	         $('#follow_button').removeAttr('id');
	       }
	       else
	       {
	       	 $('#follow_button').html('Follow');
	         $('#follow_button').children('i').addClass('glyphicon-minus').removeClass('glyphicon-plus');
	         $('#follow_button').attr('data-href', data.url);
	         $('#follow_button').removeAttr('id');
	       }
	       console.log( data );
	    });
  	});
	</script>
</body>
</html>
