class YoutubeController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__),'..')

  # sets the view directory correctly
  set :views, Proc.new {File.join(root,"views")}

  configure :development do
      register Sinatra::Reloader
  end



	$youtube_videos= [

		{
			id: 0,
			name: "Baptasia",
			video_code: "c-HgBrVLv5I"
		},
		{
			id: 1,
			name: "Andy C vs the Holy Ghost",
			video_code: "c-HgBrVLv5I"
		},
		{
			id: 2,
			name: "drum and bass flashmob",
			video_code: "btL-EeX96Kk"
		}

	]



	# index
	get "/youtube" do

		@youtube_videos = $youtube_videos

		erb :index

	end

	# new
	get "/youtube/new" do


		erb :new

	end


	# show
	get "/youtube/:id" do

		id = params[:id].to_i

		@youtube_video = $youtube_videos[id]



		erb :show

	end




	# create
	post "/youtube" do 

		name = params[:name]
		video_code = params[:video_code]
		new_id = $youtube_videos.length


		youtube_video = { 

			id: new_id,
			name: name,
			video_code: video_code
		}


		$youtube_videos.push(youtube_video)

		redirect :"/youtube"

	end



	# edit
	# update
	# delete



end