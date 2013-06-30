Kropka::Recipe.new do
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
end
