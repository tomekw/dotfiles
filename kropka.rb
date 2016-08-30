Kropka::Recipe.new do
  directory do
    name "#{ENV["HOME"]}/bin"
  end

  directory do
    name "#{ENV["HOME"]}/.emacs.d"
  end

  directory do
    name "#{ENV["HOME"]}/.janus"
  end

  directory do
    name "#{ENV["HOME"]}/.lein"
  end

  directory do
    name "#{ENV["HOME"]}/.iterm2"
  end

  directory do
    name "#{ENV["HOME"]}/.sbt"
  end

  directory do
    name "#{ENV["HOME"]}/.sbt/0.13"
  end

  file do
    source "global.sbt"
    target "#{ENV["HOME"]}/.sbt/0.13/global.sbt"
  end

  file do
    source "src/emacs"
    target "#{ENV["HOME"]}/bin/emacs"
  end

  file do
    source "src/zshrc"
    target "#{ENV["HOME"]}/.zshrc"
  end

  file do
    source "src/gemrc"
    target "#{ENV["HOME"]}/.gemrc"
  end

  file do
    source "src/gitconfig"
    target "#{ENV["HOME"]}/.gitconfig"
  end

  file do
    source "src/gitignore"
    target "#{ENV["HOME"]}/.gitignore"
  end

  file do
    source "src/vimrc.before"
    target "#{ENV["HOME"]}/.vimrc.before"
  end

  file do
    source "src/vimrc.after"
    target "#{ENV["HOME"]}/.vimrc.after"
  end

  file do
    source "src/gvimrc.after"
    target "#{ENV["HOME"]}/.gvimrc.after"
  end

  file do
    source "src/ackrc"
    target "#{ENV["HOME"]}/.ackrc"
  end

  file do
    source "src/init.el"
    target "#{ENV["HOME"]}/.emacs.d/init.el"
  end

  file do
    source "src/janus_gitmodules"
    target "#{ENV["HOME"]}/.janus/.gitmodules"
  end

  file do
    source "src/lein_profiles.clj"
    target "#{ENV["HOME"]}/.lein/profiles.clj"
  end

  file do
    source "src/iterm2.plist"
    target "#{ENV["HOME"]}/.iterm2/com.googlecode.iterm2.plist"
  end
end
