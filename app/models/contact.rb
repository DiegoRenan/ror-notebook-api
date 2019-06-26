class Contact < ApplicationRecord
  def author
    "Jackson Pires"
  end

  #render sobreescrevendo o as_json. Aplicado para todas actions
  def as_json(options={})
    super(methods: :author, root: true)
  end
end
