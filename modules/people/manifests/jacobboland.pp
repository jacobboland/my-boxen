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

  class { 'osx::dock::icon_size':
    size => 24
  }

  class { 'osx::dock::position':
    position => 'left'
  }

  class { 'osx::dock::pin_position':
    position => 'end'
  }

  include osx::dock::autohide
  include osx::dock::clear_dock
  include osx::global::enable_keyboard_control_access

	#configurations
	git::config::global { 'user.email':
    		value  => 'jacob.boland@daptiv.com'
  	}
  	git::config::global { 'user.name':
    		value  => 'Jacob Boland'
  	}
}
