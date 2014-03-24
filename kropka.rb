Kropka::Recipe.new do
  directory do
    name "#{ENV["HOME"]}/.emacs.d"
  end

  directory do
    name "#{ENV["HOME"]}/.janus"
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
end