class people::jacobboland {
    $home = "/Users/${::boxen_user}"

    # development
    include atom
    include nodejs

    # terminal
    include apps::fishShell
    include iterm2::dev

    file {
        "${home}/.config/fish/personal.fish":
            ensure  => link,
            target  => "${$boxen::config::repodir}/modules/people/files/jacobboland/personal.fish",
            subscribe => File["${home}/.config/fish/"]
    }

    file {
        "${home}/.bash_profile":
            ensure  => link,
            target  => "${$boxen::config::repodir}/modules/people/files/jacobboland/.bash_profile"
    }

    # browsers
    include chrome
    include chrome::canary
    include firefox

    # home media
    include chromecast
    include sonos

    # health
    include fitbit

    # osx
    include spectacle

    class {
        'osx::dock::icon_size': size => 24
    }

    class {
        'osx::dock::position': position => 'left'
    }

    class { 'osx::dock::pin_position':
        position => 'end'
    }

    include osx::dock::autohide
    include osx::dock::clear_dock
    include osx::global::enable_keyboard_control_access
    include osx::finder::show_hidden_files

    # configurations
    git::config::global {
        'user.email': value  => 'jacob.boland@gmail.com'
    }

    git::config::global {
        'user.name': value  => 'Jacob Boland'
    }

    # atom
    atom::theme { 'seti-ui': }
    atom::theme { 'seti-syntax': }

    atom::package { 'atom-beautify': }
    atom::package { 'autocomplete': }
    atom::package { 'autocomplete-paths': }
    atom::package { 'autocomplete-plus': }
    atom::package { 'js-refactor': }
    atom::package { 'language-html': }
    atom::package { 'language-javascript': }
    atom::package { 'language-less': }
    atom::package { 'language-puppet': }
    atom::package { 'linter': }
    atom::package { 'linter-jshint': }
    atom::package { 'linter-less': }
    atom::package { 'minimap': }
    atom::package { 'refactor': }
}
