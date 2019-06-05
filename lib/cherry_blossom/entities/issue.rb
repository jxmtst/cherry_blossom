class Issue < Hanami::Entity
  def parent?
    author == 'jxmtst'
  end
end
