class people::micalexander::git {

  git::config::global {

    'user.email'    :value  => 'micalexander@hotmail.com';
    'user.name'     :value  => 'micalexander';
    'user.username' :value  => 'micalexander';
    'alias.st'      :value  => 'status';
    'alias.co'      :value  => 'checkout';
    'alias.br'      :value  => 'branch';
    'alias.logg'    :value  => "log --graph --pretty=format:'%C(yellow)%h%Creset%C(bold red)%d%Creset %s %C(green)(%ad) %C(white)<%an>%Creset' --abbrev-commit --date=local";

  }

}