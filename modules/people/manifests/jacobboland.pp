class people::jacobboland {
  	$home = "/Users/${::boxen_user}"

	#development
	include atom

	#terminal
	include apps::fishShell
	include iterm2::dev

	file { "${home}/.config/fish/personal.fish":
	    	ensure  => link,
	    	target  => "${$boxen::config::repodir}/modules/people/files/jacobboland/personal.fish",
		subscribe => File["${home}/.config/fish/"]
	}

	file { "${home}/.bash_profile":
    		ensure  => link,
	    	target  => "${$boxen::config::repodir}/modules/people/files/jacobboland/.bash_profile"
	}

	#browsers
	include chrome
	include chrome::canary
	include firefox

	#osx
	include spectacle

	#configurations
	git::config::global { 'user.email':
    		value  => 'jacob.boland@daptiv.com'
  	}
  	git::config::global { 'user.name':
    		value  => 'Jacob Boland'
  	}
}
