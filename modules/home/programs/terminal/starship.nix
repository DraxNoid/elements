{ lib, config, ...}: 

{
    options = {
        starship.enable = lib.mkEnableOption "enables starship";
    };

    config = lib.mkIf config.starship.enable {
      	programs.starship = {
			enable = true;
			settings = {
				format = "[╭╴[ ](surface0 )](bold surface0) $username$sudo$all[╰─](bold surface0)$character ";

				add_newline = true;

				# Change the default prompt characters
				character = {
					success_symbol = "[](bold surface0)";
					error_symbol = "[](bold surface0)";
				};

				username ={
					style_root = "bold red";
					style_user = "bold mauve";
					format = "[ $user]($style) ";
					show_always = true;
				};

				directory = {
					read_only = " ";
					style = "bold maroon";
					home_symbol = " ";
					format = "in [ $path]($style)[$read_only]($style) ";
				};

				git_branch = {
					symbol = " ";
					style = "bold peach";
					format = " [$symbol$branch(:$remote_branch)]($style) ";
				};

				git_status = {
					ahead = "⇡\${count}";
					diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
					behind = "⇣\${count}";
				};

				# [time]
				# format = "[ $time]($style)"
				# disabled = false
				sudo = {
					disabled = false;
					format = "as [](bold yellow) ";
				};

				cmd_duration = {
					style = "bold green";
				};

				aws = {
					symbol = "  ";
				};


				buf = {
					symbol = " ";
					format = "- [$symbol($version )]($style)";
				};

				c = {
					symbol = " ";
					format = "- [$symbol($version )]($style)";
				};

				conda = {
					symbol = " ";
					format = "- [$symbol($version )]($style)";
				};

				dart = {
					symbol = " ";
					format = "- [$symbol($version )]($style)";
				};

				docker_context = {
					symbol = " ";
					style = "bold #0db7ed";
					format = "- [$symbol$context]($style) ";
				};

				elixir = {
					symbol = " ";
					format = "- [$symbol($version )]($style)";
				};

				elm = {
					symbol = " ";	
					format = "- [$symbol($version )]($style)";
				};

				golang = {
					symbol = " ";
					format = "- [$symbol($version )]($style)";
				};

				haskell = {
					symbol = " ";
					format = "- [$symbol($version )]($style)";
				};

				hg_branch = {
					symbol = " ";
					format = "- [$symbol($version )]($style)";
				};

				java = {
					symbol = " ";
					format = "- [$symbol($version )]($style)";
				};

				julia = {
					symbol = " ";
					format = "- [$symbol($version )]($style)";
				};

				lua = {
					symbol = " ";
					format = "- [$symbol($version )]($style)";
				};

				memory_usage = {
					symbol = " ";
				};

				nim = {
					symbol = " ";
					format = "- [$symbol($version )]($style)";
				};

				nix_shell = {
					symbol = " ";
					format = "- [$symbol($version )]($style)";
				};

				nodejs = {
					symbol = " ";
					format = "- [$symbol($version )]($style)";
				};

				package = {
					symbol = " ";
				};

				python = {
					symbol = " ";
					format = "- [\${symbol}\${pyenv_prefix}(\${version} )(\($virtualenv\) )]($style)";
				};

				rlang = {
					symbol = "ﳒ ";
					format = "- [$symbol($version )]($style)";
				};

				ruby = {
					symbol = " ";
					format = "- [$symbol($version )]($style)";
				};

				rust = {
					symbol = " ";
					format = "- [$symbol($version )]($style)";
				};

				scala = {
					symbol = " ";
					format = "- [$symbol($version )]($style)";
				};

				spack = {
					symbol = "🅢 ";
					format = "- [$symbol($version )]($style)";
				};

				php = {
					disabled = true;
				};
			};
		};
	};		
}