if status is-interactive
    # Commands to run in interactive sessions can go here
	
	#fastfetch skibidi conf
	#fastfetch --config ~/.config/fastfetch/nexus.jsonc

	function refresh
	   source ~/.config/fish/config.fish
	end	

	function skibidi
	   fastfetch --config ~/.config/fastfetch/nexus.jsonc
	end
	
	#minecraft
	function mc
	    java -jar ~/SKlauncher-3.2.12.jar
	end

	#stremio
	function stremio
	   flatpak run com.stremio.Stremio
	end

	#unimatrix
	function gopro
	   unimatrix -n -c cyan -s 94
	end	

	# fzf key bindings
	fzf --fish | source

end

