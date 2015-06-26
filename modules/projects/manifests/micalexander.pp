class people::tarebyte {

  include projects::all

  prefpane { 'Hazel':
    source => 'https://s3.amazonaws.com/Noodlesoft/Hazel-3.3.5.dmg',
  }

  git::config::global { 'user.email':
    value  => 'micalexander@hotmail.com'
  }

  git::config::global { 'user.name':
    value  => 'micalexander'
  }

  git::config::global { 'alias.st':
    value  => 'status'
  }

  git::config::global { 'alias.co':
    value  => 'checkout'
  }

  git::config::global { 'alias.br':
    value  => 'branch'
  }

  git::config::global { 'alias.logg':
    value  => "log --graph --pretty=format:'%C(yellow)%h%Creset%C(bold red)%d%Creset %s %C(green)(%ad) %C(white)<%an>%Creset' --abbrev-commit --date=local"
  }

  osx::recovery_message { 'If this Mac is found, please call +1.623.204.5592': }
}